package com.oa.procedure.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Affair implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private String sponsorId;

    private String remark;

    private String procId;

    private String formId;

    private String nodeId;

    private String handlerId;

    private Integer status;

    private Date gmtCreate;

    private Date gmtModified;
}