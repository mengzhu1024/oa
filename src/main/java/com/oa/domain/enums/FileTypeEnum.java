package com.oa.domain.enums;

import lombok.Getter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author huwenlong
 * @date 2019/5/19 9:56
 */
public enum FileTypeEnum {

    /**
     * file type
     */
    TXT("txt", Boolean.TRUE, Boolean.FALSE),
    PNG("png", Boolean.TRUE, Boolean.FALSE),
    JPG("jpg", Boolean.TRUE, Boolean.FALSE),
    JPEG("jpeg", Boolean.TRUE, Boolean.FALSE),
    GIF("gif", Boolean.TRUE, Boolean.FALSE),
    PDF("pdf", Boolean.TRUE, Boolean.FALSE),
    DOC("doc", Boolean.TRUE, Boolean.TRUE),
    DOCX("docx", Boolean.TRUE, Boolean.TRUE),
    XLS("xls", Boolean.TRUE, Boolean.TRUE),
    XLSX("xlsx", Boolean.TRUE, Boolean.TRUE),
    PPT("ppt", Boolean.TRUE, Boolean.TRUE),
    PPTX("pptX", Boolean.TRUE, Boolean.TRUE),
    ;

    @Getter
    private String type;

    @Getter
    private Boolean previewable;

    @Getter
    private Boolean editable;

    FileTypeEnum(String type, Boolean previewable, Boolean editable) {
        this.type = type;
        this.previewable = previewable;
        this.editable = editable;
    }

    public static List<String> editableList() {
        return Arrays.stream(FileTypeEnum.values())
                .filter(fileTypeEnum -> fileTypeEnum.editable)
                .map(FileTypeEnum::getType)
                .collect(Collectors.toList());
    }

    public static List<String> previewableList() {
        return Arrays.stream(FileTypeEnum.values())
                .filter(fileTypeEnum -> fileTypeEnum.previewable)
                .map(FileTypeEnum::getType)
                .collect(Collectors.toList());
    }
}
