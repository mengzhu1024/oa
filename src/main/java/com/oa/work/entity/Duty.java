package com.oa.work.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Duty implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String title;

    private String content;

    private String sponsor;

    private Date launchDate;

    private String executor;

    private Date expireDate;

    private Integer status;

    private String remark;

    private String evaluate;

    private Date gmtCreate;

    private Date gmtUpdate;

    private Date gmtModified;
}