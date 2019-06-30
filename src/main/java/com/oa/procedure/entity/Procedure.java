package com.oa.procedure.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Procedure implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String content;

    private String formId;

    private String typeId;

    private Date gmtCreate;

    private Date gmtModified;
}