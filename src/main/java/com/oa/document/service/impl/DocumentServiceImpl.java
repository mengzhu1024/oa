package com.oa.document.service.impl;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.enums.OperateEnum;
import com.elementchain.base.service.BaseServiceImpl;
import com.elementchain.monitor.annotations.EnableMonitor;
import com.oa.document.entity.Document;
import com.oa.document.entity.DocumentExt;
import com.oa.document.mapper.DocumentMapper;
import com.oa.document.service.DocumentService;
import com.oa.domain.enums.OperateFileEnum;
import com.oa.group.mapper.GroupMapper;
import com.oa.log.annotations.EnableLog;
import com.oa.utils.Constant;
import com.oa.utils.FilesUtil;
import com.oa.utils.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@EnableLog(target = "document", logEnums = {OperateEnum.DELETE})
@EnableMonitor(logEnums = {OperateEnum.DELETE})
public class DocumentServiceImpl extends BaseServiceImpl<Document, DocumentMapper> implements DocumentService {

    @Autowired
    private GroupMapper groupMapper;

    @Override
    public PageResult<DocumentExt> selectExtPage(PageCriteria<DocumentExt> documentCriteria) {
        return PageResult.getCurrentPageResult(baseMapper.selectExtPage(documentCriteria));
    }

    private List<String> canOperateIds(String employeeId, String[] documentIds, int type) {
        Map<String, Object> map = new HashMap<>();
        map.put("employeeId", employeeId);
        map.put("documentIds", documentIds);
        map.put("type", type);
        return baseMapper.selectCanOperateIds(map);
    }

    @Override
    public void setOperateable(String employeeId, List<DocumentExt> documentList) {
        if (!CollectionUtils.isEmpty(documentList)) {
            String[] documentIds = new String[documentList.size()];
            for (int i = 0; i < documentList.size(); i++) {
                documentIds[i] = documentList.get(i).getId();
            }
            //获取当前页面文件该员工可以下载的文件ID
            List<String> canDownloadIds = canOperateIds(employeeId, documentIds, OperateFileEnum.DOWNLOAD.getType());
            //获取当前页面文件安该员工可以删除的文件ID
            List<String> canDeleteIds = canOperateIds(employeeId, documentIds, OperateFileEnum.DELETE.getType());
            //获取当前页面文件该员工可以编辑的文件ID
            List<String> canEditIds = canOperateIds(employeeId, documentIds, OperateFileEnum.EDIT.getType());
            //获取当前页面文件安该员工可以预览的文件ID
            List<String> canPreviewIds = canOperateIds(employeeId, documentIds, OperateFileEnum.PREVIEW.getType());
            //修改文件的可操作性
            for (DocumentExt document : documentList) {
                document.setDownload(canDownloadIds.contains(document.getId()));
                document.setDelete(canDeleteIds.contains(document.getId()));
                //edit和文件的locked属性有关，文件上传的时候根据文件的可编辑性进行赋值，故这里只能掷为true（不能编辑），不能掷为false（能编辑）
                if (!canEditIds.contains(document.getId())) {
                    document.setLocked(true);
                }
                //preview属性在通过反射设置文件名的时候赋值，可编辑为true，不可编辑为false，故这里只能掷为false。
                if (!canPreviewIds.contains(document.getId())) {
                    document.setPreview(false);
                }
            }
        }
    }

    @Override
    public void batchInsert(List<Document> documentList, String[] groupIds) {
        //添加文件和分组的关联
        for (Document document : documentList) {
            baseMapper.insert(document);
        }
        if (ValidateUtil.isValid(groupIds)) {
            for (Document document : documentList) {
                for (String groupId : groupIds) {
                    groupMapper.insertGroupDocument(groupId, document.getId());
                }
            }
        }
    }

    @Override
    public boolean hasExist(Document document) {
        Criteria documentCriteria = new Criteria();
        documentCriteria.injectCriterion("disk", "=", document.getDisk())
                .injectCriterion("path", "=", document.getPath())
                .injectCriterion("name", "=", document.getName())
                .setLimit(1);
        return !CollectionUtils.isEmpty(baseMapper.selectAll(documentCriteria));
    }

    @Override
    public Integer delete(Document document) {
        Integer result = super.delete(document);
        FilesUtil.deleteFileWithParent(Constant.ROOT_PATH + document.getDisk() + "/" + document.getPath() + "/" + document.getName());
        FilesUtil.deleteFileWithParent(Constant.ROOT_PATH + document.getDisk() + "1/" + document.getPath() + "/" + document.getName());
        return result;
    }

    @Override
    public Integer batchDelete(Document[] documents) {
        Integer result = baseMapper.batchDelete(documents);
        //删除文件
        for (Document document : documents) {
            //删除文件
            FilesUtil.deleteFileWithParent(Constant.ROOT_PATH + document.getDisk() + "/" + document.getPath() + "/" + document.getName());
            FilesUtil.deleteFileWithParent(Constant.ROOT_PATH + document.getDisk() + "1/" + document.getPath() + "/" + document.getName());
        }
        return result;
    }

    @Override
    public void clearTempDirectary() {
        String[] names = new File(Constant.TEMP_PATH).list();
        if (ValidateUtil.isValid(names)) {
            for (String name : names) {
                FilesUtil.deleteFileWithChildren(new File(Constant.TEMP_PATH + name));
            }
        }
    }

    @Override
    public List<DocumentExt> selectWithGroup(String documentIds) {
        return baseMapper.selectWithGroup(documentIds);
    }
}