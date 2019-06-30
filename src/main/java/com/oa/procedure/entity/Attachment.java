package com.oa.procedure.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Attachment implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String newName;

    private String affairId;

    private Date gmtCreate;

    private Date gmtModified;
}