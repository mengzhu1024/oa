package com.oa.form.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Form implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private Integer version;

    private Date gmtCreate;

    private Date gmtModified;

    private String content;
}