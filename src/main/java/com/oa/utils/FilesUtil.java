package com.oa.utils;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.oa.domain.enums.FileTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.FileCopyUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.Objects;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * 操作文件的工具类
 *
 * @author 文龙
 */
@Slf4j
public class FilesUtil {
    /**
     * 文件复制方法
     *
     * @param src     源文件
     * @param desPath 复制路径
     * @param cover   是否覆盖
     */
    public static void copyFile(File src, String desPath, boolean cover) {
        //创建目标文件路径
        File file = new File(desPath);
        if (!file.exists()) {
            file.mkdirs();
        }
        int index = src.getName().lastIndexOf(".");
        //如果覆盖，就用原来文件名；如果追加，就在原来文件名的基础上增加当前毫秒数
        String fileName = cover ? src.getName() : src.getName().substring(0, index) +
                "_" + StringUtil.dateToString(new Date(), "yyyyMMddHHmmss") + src.getName().substring(index);
        File desFile = new File(desPath + "/" + fileName);
        try {
            FileCopyUtils.copy(src, desFile);
        } catch (IOException e) {
            log.error("copyFile method error, src:{}, desPath:{}, cover:{}, e:", src.getPath(), desPath, cover, e);
        }
    }

    /**
     * 文件夹复制
     *
     * @param src     原文件夹
     * @param desPath 复制路径
     */
    public static void copyDirectory(File src, String desPath) {
        String[] strs1 = src.getAbsolutePath().split("\\\\");
        String[] strs2 = desPath.split("/");
        int n = strs1.length > strs2.length ? strs2.length : strs1.length;
        for (int i = 0; i < n; i++) {
            if (!strs1[i].equals(strs2[i])) {
                break;
            }
            if (strs1[i].equals(strs2[i]) && i == n - 1) {
                log.warn("parent dir connot copy to children dir, src:{}, dest:{}", src, desPath);
                return;
            }
        }
        //创建目标文件夹
        File desDir = new File(desPath + "/" + src.getName());
        desDir.mkdirs();
        File[] files = src.listFiles();
        if (Objects.nonNull(files)) {
            for (File file : files) {
                if (file.isFile()) {
                    copyFile(file, desPath + "/" + src.getName(), true);
                } else if (file.isDirectory()) {
                    copyDirectory(file, desPath + "/" + src.getName());
                }
            }
        }
    }

    /**
     * 删除文件、文件夹的方法
     *
     * @param file 目标文件
     */
    public static void deleteFileWithChildren(File file) {
        if (!file.delete()) {
            File[] files = file.listFiles();
            if (Objects.nonNull(files)) {
                for (File file2 : files) {
                    deleteFileWithChildren(new File(file2.getPath()));
                }
            }
            file.delete();
        }
    }

    /**
     * 删除文件及父文件夹（如果父文件夹为空）
     *
     * @param path 目标文件路径
     */
    public static void deleteFileWithParent(String path) {
        File file = new File(path);
        if (file.delete()) {
            File parent = file.getParentFile();
            if (parent.exists() && parent.delete()) {
                deleteFileWithParent(parent.getParent());
            }
        }
    }

    private static final int wdFormatPDF = 17;
    private static final int xlTypePDF = 0;
    private static final int ppSaveAsPDF = 32;

    /**
     * office文件转pdf。注意：导入jacob包后把下载的jacob.dll 文件放到C:\Windows\System32目录下
     *
     * @param srcFile 源文件
     * @param tarFile 目标文件（生成的pdf文件）
     */
    public static void officeToPDF(String srcFile, String tarFile) {
        String kind = srcFile.substring(srcFile.lastIndexOf(".") + 1);
        File file = new File(srcFile);
        if (!file.exists()) {
            //文件不存在
            log.info("convert failed, src not exists, srcFile:{}", srcFile);
            return;
        }
        if (kind.equals(FileTypeEnum.PDF.getType())) {
            //原文件就是PDF文件
            log.info("srcFile is pdf, not need convert, srcFile:{}", srcFile);
            return;
        }
        File tar = new File(tarFile);
        tar.getParentFile().mkdirs();
        //如果文件已存在，无需转换
        if (tar.isFile()) {
            // 目标文件已存在
            log.info("convert failed, tar has existed, tarFile:{}", tarFile);
            return;
        }
        if (kind.equals(FileTypeEnum.DOC.getType()) || kind.equals(FileTypeEnum.DOCX.getType())
                || kind.equals(FileTypeEnum.TXT.getType())) {
            wordToPDF(srcFile, tarFile);
        } else if (kind.equals(FileTypeEnum.PPT.getType()) || kind.equals(FileTypeEnum.PPTX.getType())) {
            pptToPDF(srcFile, tarFile);
        } else if (kind.equals(FileTypeEnum.XLS.getType()) || kind.equals(FileTypeEnum.XLSX.getType())) {
            excelToPDF(srcFile, tarFile);
        } else {
            log.info("unsupport type, srcFile:{}, tarFile:{}", srcFile, tarFile);
        }
    }

    /**
     * word转pdf
     */
    private static void wordToPDF(String srcFile, String tarFile) {
        // 打开Word应用程序
        ActiveXComponent app = new ActiveXComponent("KWPS.Application");
        long date = System.currentTimeMillis();
        // 设置Word不可见
        app.setProperty("Visible", new Variant(false));
        // 禁用宏
        app.setProperty("AutomationSecurity", new Variant(3));
        // 获得Word中所有打开的文档，返回documents对象
        Dispatch docs = app.getProperty("Documents").toDispatch();
        // 调用Documents对象中Open方法打开文档，并返回打开的文档对象Document
        Dispatch doc = Dispatch.call(docs, "Open", srcFile, false, true).toDispatch();
        // word保存为pdf格式宏，值为
        Dispatch.call(doc, "ExportAsFixedFormat", tarFile, wdFormatPDF);
        // 关闭文档
        long date2 = System.currentTimeMillis();
        int time = (int) ((date2 - date) / 1000);

        Dispatch.call(doc, "Close", false);
        // 关闭Word应用程序
        app.invoke("Quit", 0);
        log.info("word to pdf success, srcFile:{}, tarFile:{}, cost:{}", srcFile, tarFile, time);
    }

    /**
     * excel转pdf
     */
    private static void excelToPDF(String srcFile, String tarFile) {
        ComThread.InitSTA(true);
        ActiveXComponent ax = new ActiveXComponent("KET.Application");
        long date = System.currentTimeMillis();
        ax.setProperty("Visible", false);
        // 禁用宏
        ax.setProperty("AutomationSecurity", new Variant(3));
        Dispatch excels = ax.getProperty("Workbooks").toDispatch();

        Dispatch excel = Dispatch
                .invoke(excels, "Open", Dispatch.Method,
                        new Object[]{srcFile, new Variant(false), new Variant(false)}, new int[9])
                .toDispatch();
        // 转换格式, PDF格式=0
        Dispatch.invoke(excel, "ExportAsFixedFormat", Dispatch.Method, new Object[]{new Variant(0),
                tarFile, new Variant(xlTypePDF)}, new int[1]);

        long date2 = System.currentTimeMillis();
        int time = (int) ((date2 - date) / 1000);
        Dispatch.call(excel, "Close", new Variant(false));

        ax.invoke("Quit", new Variant[]{});
        ax = null;
        ComThread.Release();
        log.info("excel to pdf success, srcFile:{}, tarFile:{}, cost:{}", srcFile, tarFile, time);
    }

    /**
     * ppt转pdf
     */
    private static void pptToPDF(String srcFile, String tarFile) {
        ComThread.InitSTA(true);
        ActiveXComponent app = new ActiveXComponent("KWPP.Application");
        long date = System.currentTimeMillis();
        Dispatch ppts = app.getProperty("Presentations").toDispatch();
        Dispatch ppt = Dispatch.call(ppts, "Open", srcFile, true, false).toDispatch();
        Dispatch.invoke(ppt, "SaveAs", Dispatch.Method, new Object[]{
                tarFile, new Variant(ppSaveAsPDF)}, new int[1]);
        Dispatch.call(ppt, "Close");
        long date2 = System.currentTimeMillis();
        int time = (int) ((date2 - date) / 1000);
        app.invoke("Quit");
        log.info("ppt to pdf success, srcFile:{}, tarFile:{}, cost:{}", srcFile, tarFile, time);
    }

    /**
     * 图片转pdf
     *
     * @param srcDictory 图片所在的文件夹
     * @param destFile   目标文件（生成的pdf文件）
     */
    public static void imageToPDF(String srcDictory, String destFile) throws IOException, DocumentException {
        //标准A4的宽
        final float weight = 595 - 60;
        //标准A4的高
        final float height = 842 - 60;
        Document document = new Document(PageSize.A4, 30, 30, 30, 30);
        //创建文档容器
        //创建编写器（PDF类型）
        PdfWriter.getInstance(document, new FileOutputStream(destFile + ".pdf"));
        //打开容器
        document.open();
        File[] files = new File(srcDictory).listFiles();
        float percent = 100;
        float w, h;
        for (int i = 0; i < files.length; i++) {
            Image img = Image.getInstance(files[i].getCanonicalPath());
                /*处理图片缩放比例*/
            w = img.getWidth();
            h = img.getHeight();
            if ((w > weight) && (h < height)) {
                percent = (weight * 100) / w;
            } else {
                if ((w < weight) && (h > height)) {
                    percent = (height * 100) / h;
                } else {
                    if ((w > weight) && (h > height)) {
                        percent = (weight * 100) / w;
                        h = (h * percent) / 100;
                        if (h > height) {
                            percent = (height * 100) / h;
                        }
                    }
                }
            }
            img.scalePercent(percent);
            document.add(img);
        }
    }

    /**
     * 压缩文件、文件夹
     *
     * @param srcFiles 源文件路径
     * @param zipPath  目标文件路径
     */
    public static void zipFileWithTier(String srcFiles, String zipPath) {
        try {
            ZipOutputStream output = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipPath)));
            zipFiles(srcFiles, output, "");
            output.close();
        } catch (IOException e) {
            log.error("zipFileWithTier method error, src:{}, zipPath:{}, e:", srcFiles, zipPath, e);
        }
    }

    private static void zipFiles(String filePath, ZipOutputStream output, String prefix)
            throws IOException {
        File file = new File(filePath);
        if (file.isDirectory()) {
            if (file.listFiles().length == 0) {
                ZipEntry zipEntry = new ZipEntry(prefix + file.getName() + "/");
                output.putNextEntry(zipEntry);
                output.closeEntry();
            } else {
                prefix += file.getName() + File.separator;
                for (File f : file.listFiles()) {
                    zipFiles(f.getAbsolutePath(), output, prefix);
                }
            }
        } else {
            FileInputStream input = new FileInputStream(file);
            ZipEntry zipEntry = new ZipEntry(prefix + file.getName());
            output.putNextEntry(zipEntry);
            byte[] buf = new byte[1024];
            int len;
            while ((len = input.read(buf)) > 0) {
                output.write(buf, 0, len);
            }
            output.closeEntry();
            input.close();
        }
    }

    /**
     * 解压缩文件
     *
     * @param zipPath   源文件路径
     * @param unZipPath 解压路径和文件名
     */
    public static void unzipFilesWithTier(String zipPath, String unZipPath) {
        String prefix = unZipPath + "/";
        try {
            ZipInputStream input = new ZipInputStream(new BufferedInputStream(new FileInputStream(new File(zipPath))));
            ZipEntry zipEntry;
            while ((zipEntry = input.getNextEntry()) != null) {
                if (zipEntry.isDirectory()) {
                    File file = new File(prefix + zipEntry.getName());
                    if (!file.exists()) {
                        file.mkdirs();
                    }
                    continue;
                }
                File file = new File(prefix + zipEntry.getName());
                if (!file.getParentFile().exists()) {
                    file.getParentFile().mkdirs();
                }
                BufferedOutputStream toScan = new BufferedOutputStream(new FileOutputStream(prefix + zipEntry.getName()));
                byte[] buf = new byte[1024];
                int len;
                while ((len = input.read(buf)) > 0) {
                    toScan.write(buf, 0, len);
                }
                toScan.close();
            }
            input.close();
        } catch (Exception e) {
            log.error("unzipFilesWithTier method error, zipPath:{}, unZipPath:{}, e:", zipPath, unZipPath, e);
        }
    }

    public static Exception multiDownload(File[] files, HttpServletResponse response) {
        if (Objects.nonNull(files) && files.length > 0) {
            File tempFile = null;
            ZipOutputStream zipOutput;
            FileInputStream input = null;
            OutputStream output = null;
            BufferedInputStream[] inputs = new BufferedInputStream[files.length];
            try {
                for (int i = 0; i < files.length; i ++) {
                    inputs[i] = new BufferedInputStream(new FileInputStream(files[i]));
                }
                //zip压缩文件
                tempFile = new File(Constant.TEMP_PATH + StringUtil.randomUUID() + ".zip");
                byte[] buf = new byte[2048];
                int len;
                zipOutput = new ZipOutputStream(new FileOutputStream(tempFile));
                for (int i = 0; i < inputs.length; i++) {
                    BufferedInputStream in = inputs[i];
                    zipOutput.putNextEntry(new ZipEntry(files[i].getName()));
                    while ((len = in.read(buf)) > 0) {
                        zipOutput.write(buf, 0, len);
                    }
                    zipOutput.closeEntry();
                }
                //压缩流一定要在这里关闭
                zipOutput.close();
                //下载文件
                input = new FileInputStream(tempFile);
                output = response.getOutputStream();
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=file.zip");
                while ((len = input.read(buf)) != -1) {
                    output.write(buf, 0, len);
                }
                output.flush();
                return null;
            }catch (Exception e) {
                log.error("multiDownload method error, e:", e);
                return e;
            }finally {
                close(output, input);
                //删除压缩包
                if (tempFile != null && tempFile.exists()) {
                    tempFile.delete();
                }
                for (BufferedInputStream in : inputs) {
                    close(in);
                }
            }
        }
        return null;
    }

    public static void close(Closeable... closeables) {
        for (Closeable closeable : closeables) {
            try {
                closeable.close();
            } catch (IOException e) {
                log.error("close method error, e:", e);
            }
        }
    }
}
