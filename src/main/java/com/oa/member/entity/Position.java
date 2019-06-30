package com.oa.member.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Position implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String desc;

    private String depId;

    private Date gmtCreate;

    private Date gmtModified;

}