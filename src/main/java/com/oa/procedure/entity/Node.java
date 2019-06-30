package com.oa.procedure.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Node implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private Integer order;

    private String flowNumber;

    private String procId;

    private String controls;

    private String handlers;

    private String branch;

    private String branchJs;

    private Date gmtCreate;

    private Date gmtModified;
}