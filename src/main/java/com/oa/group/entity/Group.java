package com.oa.group.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Group implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String desc;

    private Integer type;

    private String depId;

    private Date gmtCreate;

    private Date gmtModified;
}