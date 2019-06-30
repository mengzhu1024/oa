package com.oa.procedure.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Process implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private Date handleTime;

    private String handler;

    private String nodeName;

    private Integer nodeOrder;

    private String affairId;

    private Date gmtCreate;

    private Date gmtModified;
}