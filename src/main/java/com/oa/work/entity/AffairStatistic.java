package com.oa.work.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 17710
 */
@Data
public class AffairStatistic implements Serializable {

    private static final long serialVersionUID = -632127667802446778L;

    private String id;

    private String emp;

    private Integer startNum1 = 0;

    private Integer handleNum1 = 0;

    private Integer startNum2 = 0;

    private Integer handleNum2 = 0;

    private Integer startNum3 = 0;

    private Integer handleNum3 = 0;

    private Integer startNum4 = 0;

    private Integer handleNum4 = 0;

    private Integer startNum5 = 0;

    private Integer handleNum5 = 0;

    private Integer startNum6 = 0;

    private Integer handleNum6 = 0;

    private Integer startNum7 = 0;

    private Integer handleNum7 = 0;

    private Integer startNum8 = 0;

    private Integer handleNum8 = 0;

    private Integer startNum9 = 0;

    private Integer handleNum9 = 0;

    private Integer startNum10 = 0;

    private Integer handleNum10 = 0;

    private String month;

    private Date gmtCreate;

    private Date gmtModified;

    public Integer getStartNum10() {
        return startNum10;
    }

    public void setStartNum10() {
        this.startNum10 = startNum1 + startNum2 + startNum3 + 
        		startNum4 + startNum5 + startNum6 + startNum7 + startNum8 + startNum9;
    }

    public Integer getHandleNum10() {
        return handleNum10;
    }

    public void setHandleNum10() {
        this.handleNum10 = handleNum1 + handleNum2 + handleNum3 + 
        		handleNum4 + handleNum5 + handleNum6 + handleNum7 + handleNum8 + handleNum9;
    }
}