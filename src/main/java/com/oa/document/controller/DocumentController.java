package com.oa.document.controller;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.oa.annotations.RightAnnotation;
import com.oa.cache.CacheMap;
import com.oa.document.entity.Document;
import com.oa.document.entity.DocumentExt;
import com.oa.document.service.DocumentService;
import com.oa.domain.Result;
import com.oa.domain.enums.FileTypeEnum;
import com.oa.domain.enums.PageEnum;
import com.oa.domain.enums.ResultEnum;
import com.oa.group.entity.Group;
import com.oa.group.service.GroupService;
import com.oa.log.entity.Log;
import com.oa.log.service.LogService;
import com.oa.member.entity.EmployeeExt;
import com.oa.utils.CollectionUtil;
import com.oa.utils.Constant;
import com.oa.utils.FilesUtil;
import com.oa.utils.StringUtil;
import com.zhuozhengsoft.pageoffice.FileSaver;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;
import com.zhuozhengsoft.pageoffice.ThemeType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.*;

/**
 * @author huwenlong
 */
@Slf4j
@Controller
@RequestMapping("/doc")
public class DocumentController {

    @Autowired
    private DocumentService documentService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private LogService logService;

    @RightAnnotation(name = "查看文件", desc = "这是查看文件的权限", common = true)
    @RequestMapping("/admin")
    public String admin(Model model, int type, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
        //设置磁盘信息
        model.addAttribute("diskMap", CollectionUtil.getDiskMap());
        //添加部门查询下拉框
        model.addAttribute("departmentMap", CacheMap.departmentMap);
        //添加查询类型
        model.addAttribute("type", type);
        //添加ip_port
        model.addAttribute("ip_port", Constant.IP_PORT);
        model.addAttribute("pageNum", pageNum);
        return PageEnum.DOCUMENT_ADMIN.getPage();
    }

    @ResponseBody
    @RequestMapping("/page")
    public Result page(PageCriteria<DocumentExt> pageCriteria, HttpSession session, int type) {
        pageCriteria.setOrderBy("upload_time desc, id");
        EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
        //如果不是超级管理员，只查看本部门的文件，并且设置文件的可操作性
        //type：0,部门文件；1：共享文件
        if (type == 0) {
            if (!loginer.isSupper()) {
                pageCriteria.injectCriterion("doc.dep_id", "=", loginer.getDepId());
            }
        } else {
            //查询共享文件，为了避免生成查询总记录数sql时截取错误，这里把两个子查询中的from大写
            pageCriteria.injectCriterion("doc.dep_id", "!=", loginer.getDepId())
                    .concatCriterion("doc.id", "in", "(select distinct doc_id from group_document where group_id in " +
                            "(select group_id from group_employee where emp_id = '" + loginer.getId() + "'))");
        }
        PageResult<DocumentExt> pageResult = documentService.selectExtPage(pageCriteria);
        if (!loginer.isSupper()) {
            documentService.setOperateable(loginer.getId(), pageResult.getEntityList());
        }
        return new Result<>(pageResult);
    }

    @RightAnnotation(name = "上传文件", desc = "这是上传文件的权限，公共权限", common = true)
    @RequestMapping("/to-upload")
    public String toUpload(Model model) {
        //设置磁盘信息
        model.addAttribute("diskMap", CollectionUtil.getDiskMap());
        return PageEnum.UPLOAD_FILE.getPage();
    }

    @RequestMapping("/upload")
    @ResponseBody
    public String upload(HttpServletRequest request, String disk, String[] groupIds) throws Exception {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            EmployeeExt loginer = (EmployeeExt) request.getSession().getAttribute("loginer");
            Date date = new Date();
            //拼接文件路径
            String path = loginer.getDepName() + "/" + StringUtil.dateToString(date, "yyyy-MM-dd");
            List<Document> documentList = new ArrayList<>();
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multiRequest 中所有的文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                //取得上传文件
                MultipartFile multipartfile = multiRequest.getFile(iter.next());
                if (multipartfile != null) {
                    String name = multipartfile.getOriginalFilename();
                    Document document = new Document(StringUtil.randomUUID(), name, path, disk, date, loginer.getId(), loginer.getDepId());
                    //如果文件重名，则修改名称
                    if (documentService.hasExist(document)) {
                        int index = name.lastIndexOf(".");
                        document.setName(name.substring(0, index) + "_" + StringUtil.dateToString(date, "yyyyMMddHHmmss") + name.substring(index));
                        name = document.getName();
                    }
                    //设置文件的可编辑性
                    document.setLocked(!FileTypeEnum.editableList().contains(name.substring(name.lastIndexOf(".") + 1)));
                    documentList.add(document);
                    //定义上传路径
                    File file = new File(Constant.ROOT_PATH + "/" + disk + "/" + path + "/" + name);
                    //生成父目录
                    file.getParentFile().mkdirs();
                    //文件上传
                    multipartfile.transferTo(file);
                    //上传后备份两份
                    FilesUtil.copyFile(file, Constant.ROOT_PATH + "/" + disk + "1/" + path, true);
                    FilesUtil.copyFile(file, Constant.ROOT_PATH + "/" + disk + "2/" + path, true);
                    //手动记录日志
                    Log log = new Log();
                    log.setId(StringUtil.randomUUID());
                    log.setOperator(loginer.getName());
                    log.setOperate("文件上传");
                    log.setObject(document.toString());
                    log.setOpertime(date);
                    logService.insert(log);
                }
            }
            //写入数据库
            documentService.batchInsert(documentList, groupIds);
        }
        return "{}";
    }

    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, String id) {
        Document document = documentService.selectByPrimaryKey(id);
        BufferedOutputStream output = null;
        BufferedInputStream input = null;
        //手动记录日志
        Log log = new Log();
        try {
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(document.getName(), "UTF-8"));
            output = new BufferedOutputStream(response.getOutputStream());
            input = new BufferedInputStream(new FileInputStream(Constant.ROOT_PATH + document.getDisk() + "/" + document.getPath() +
                    "/" + document.getName()));
            byte[] buffer = new byte[1024];
            int len;
            while ((len = input.read(buffer)) > 0) {
                output.write(buffer, 0, len);
            }
            output.flush();
            EmployeeExt loginer = (EmployeeExt) request.getSession().getAttribute("loginer");
            log.setId(StringUtil.randomUUID());
            log.setOperator(loginer.toString());
            log.setOperate("文件下载");
            log.setObject("文件名：" + document.getName() + "，盘符：" + document.getDisk() + "，路径：" + document.getPath());
            log.setOpertime(new Date());
        } catch (Exception e) {
            DocumentController.log.error("download method error, e:", e);
            log.setSuccess(false);
            log.setErrormes(e.getMessage());
        } finally {
            FilesUtil.close(input, output);
            logService.insert(log);
        }
    }

    @RequestMapping("/batch-download")
    public void batchDownload(HttpServletRequest request, HttpServletResponse response, String ids) {
        List<Document> documentList = documentService.selectPage(new PageCriteria<Document>()
                .concatCriterion("id", "in", "(" + ids + ")")).getEntityList();
        int size = documentList.size();
        //记录日志
        Log log = new Log();
        File[] files = new File[size];
        for (int i = 0; i < size; i++) {
            Document document = documentList.get(i);
            //清空多于的信息，便于记录日志
            document.setId(null);
            document.setUploadTime(null);
            document.setUploaderId(null);
            document.setDepId(null);
            document.setLocked(null);
            files[i] = new File(Constant.ROOT_PATH + document.getDisk() + "/" + document.getPath() + "/" + document.getName());
        }
        Exception e = FilesUtil.multiDownload(files, response);
        //手动记录日志
        EmployeeExt loginer = (EmployeeExt) request.getSession().getAttribute("loginer");
        log.setId(StringUtil.randomUUID());
        log.setOperator(loginer.toString());
        log.setOperate("批量下载文件");
        log.setObject(StringUtil.collectionToString(documentList, "<br>"));
        log.setOpertime(new Date());
        if (Objects.nonNull(e)) {
            log.setSuccess(false);
            log.setErrormes(e.getMessage());
        }
        logService.insert(log);
    }

    @RightAnnotation(name = "删除文件", desc = "这是删除文件的权限，包括批量删除", common = true)
    @RequestMapping("/delete")
    @ResponseBody
    public void delete(@RequestBody Document[] documents) {
        if (documents.length == 1) {
            documentService.delete(documents[0]);
        } else {
            documentService.batchDelete(documents);
        }
    }

    @ResponseBody
    @RequestMapping("/to-pdf")
    public Result toPDF(String srcFile, String tarFile) {
        FilesUtil.officeToPDF(srcFile, tarFile);
        return Result.result(ResultEnum.DEFAULT_SUCCESS);
    }

    @RightAnnotation(name = "编辑文件", desc = "这是在线编辑的文件", common = true)
    @PostMapping("/to-edit")
    public String toEdit(HttpServletRequest request, String id) {
        Document document = documentService.selectByPrimaryKey(id);
        if (document.getLocked()) {
            request.setAttribute("errorInfo", "该文件正在被编辑，请稍等……");
            return PageEnum.ERROR.getPage();
        }
        //锁定文件
        document.setLocked(true);
        documentService.update(document);
        request.setAttribute("id", id);
        PageOfficeCtrl ctrl = new PageOfficeCtrl(request);
        //此行必须
        ctrl.setServerPage("poserver.do");
        //如要保存文件，此行必须
        ctrl.setSaveFilePage("/doc/edit?id=" + id);
        //添加保存按钮
        ctrl.addCustomToolButton("保存", "saveDocument()", 1);
        //添加打印按钮
        ctrl.addCustomToolButton("打印", "printDocument()", 6);
        //poCtrl为PageOfficeCtrl对象，ThemeType为枚举类型
        ctrl.setTheme(ThemeType.Office2010);
        String filePath = "D:\\javaFile\\oa\\" + document.getDisk() + "\\" + document.getPath() + "\\" + document.getName();
        OpenModeType modeType = null;
        if (filePath.endsWith("doc") || filePath.endsWith("docx")) {
            modeType = OpenModeType.docNormalEdit;
        } else if (filePath.endsWith("xls") || filePath.endsWith("xlsx")) {
            modeType = OpenModeType.xlsNormalEdit;
        } else {
            modeType = OpenModeType.pptNormalEdit;
        }
        ctrl.webOpen(filePath, modeType, "小明");
        //此行必须
        ctrl.setTagId("PageOfficeCtrl1");
        return PageEnum.EDIT_FILE.getPage();
    }

    //确定编辑文件执行的方法
    @ResponseBody
    @RequestMapping("/edit")
    public void edit(HttpServletRequest request, HttpServletResponse response, String id) {
        //设置该文件为可编辑状态
        Document document = documentService.selectByPrimaryKey(id);
        document.setLocked(false);
        documentService.update(document);

        //写入日志
        Log log = new Log();
        log.setId(StringUtil.randomUUID());
        log.setOperator(request.getSession().getAttribute("loginer").toString());
        log.setOperate("编辑文件");
        log.setObject(document.toString());
        log.setOpertime(new Date());
        logService.insert(log);
        //修改文件
        FileSaver fs = new FileSaver(request, response);
        fs.saveToFile("D:\\javaFile\\oa\\" + document.getDisk() + "\\" + document.getPath() + "\\" + fs.getFileName());
        fs.close();
        //将修改后的文件备份到一个盘符下，新增到另一个盘符下
        File srcFile = new File("D:\\javaFile\\oa\\" + document.getDisk() + "\\" + document.getPath() + "\\" + fs.getFileName());
        FilesUtil.copyFile(srcFile, "D:\\javaFile\\oa\\" + document.getDisk() + "1\\" + document.getPath(), true);
        FilesUtil.copyFile(srcFile, "D:\\javaFile\\oa\\" + document.getDisk() + "2\\" + document.getPath(), false);
        //删除用于预览的缓存文件
        int index = document.getName().lastIndexOf(".");
        File temp = new File(Constant.TEMP_PATH + "/" + document.getDisk() + "/" + document.getPath() +
                "/" + document.getName().substring(0, index) + ".pdf");
        temp.delete();
    }

    @ResponseBody
    @RequestMapping("/exit-edit")
    public void exitEdit(String id, String type) {
        Document document = documentService.selectByPrimaryKey(id);
        //这里type表示监听的事件，如果为关闭，则设置可编辑状态为ture，如果为打开，设置可编辑状态为false
        if (type.equals("onunload")) {
            document.setLocked(false);
        } else {
            document.setLocked(true);
        }
        documentService.update(document);
    }
    @RightAnnotation(name = "文件共享", desc = "这是文件共享的权限", common = true)
    @RequestMapping("/to-share")
    public String toShare(Model model, String documentIds, String depId, Integer pageNum, int type) {
        List<Document> documentList = documentService.selectCondition(new Criteria()
                .concatCriterion("id", "in", "(" + documentIds + ")"));
        List<Group> groupList = groupService.selectCondition(new Criteria().
                injectCriterion("dep_id", "=", depId));
        model.addAttribute("documentList", documentList);
        model.addAttribute("groupList", groupList);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("documentIds", documentIds);
        model.addAttribute("type", type);
        return PageEnum.DOCUMENT_SHARE.getPage();
    }

    @ResponseBody
    @RequestMapping("/share")
    public Result share(String documentIds, String[] shareGroupIds) {
        groupService.documentShare(shareGroupIds, documentService.selectWithGroup(documentIds));
        return Result.result(ResultEnum.DEFAULT_SUCCESS);
    }
}
