package com.oa.auth.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Role implements Serializable {

    private static final long serialVersionUID = -8360621518465948189L;

    private String id;

    private String name;

    private Boolean supper;

    private String desc;

    private Date gmtCreate;

    private Date gmtModified;
}