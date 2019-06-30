package com.oa.auth.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Right implements Serializable {

    private static final long serialVersionUID = -8115675924031269383L;

    private String id;

    private String name;

    private String url;

    private String desc;

    private Integer code;

    private Integer pos;

    private Boolean common;

    private Date gmtCreate;

    private Date gmtModified;

    /**
     * 重写equals方法，只要url地址相同，则这两个权限是相同的
     * @param obj
     * @return
     */
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Right){
            if(url.equals(((Right) obj).getUrl())){
                return true;
            }
        }
        return super.equals(obj);
    }
}