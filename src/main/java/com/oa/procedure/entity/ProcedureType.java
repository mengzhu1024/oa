package com.oa.procedure.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 17710
 */
@Data
public class ProcedureType implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private Integer order;

    private Date gmtCreate;

    private Date gmtModified;
}