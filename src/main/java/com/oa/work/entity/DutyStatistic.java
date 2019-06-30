package com.oa.work.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class DutyStatistic implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String executor;

    private Integer completeNum;

    private Integer totalNum;

    private String month;

    private Date gmtCreate;

    private Date gmtModified;
}