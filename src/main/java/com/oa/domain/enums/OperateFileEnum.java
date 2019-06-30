package com.oa.domain.enums;

import lombok.Getter;

/**
 * @author huwenlong
 * @date 2019/5/22 23:10
 */
public enum  OperateFileEnum {

    /**
     * operate file enum
     */
    DOWNLOAD(0),
    DELETE(1),
    EDIT(2),
    PREVIEW(3),
    ;

    @Getter
    private int type;

    OperateFileEnum(int type) {
        this.type = type;
    }
}
