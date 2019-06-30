package com.oa.member.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author huwenlong
 */
@Data
public class Employee implements Serializable {

    private static final long serialVersionUID = 7341400667896415770L;

    private String id;

    private String account;

    private String name;

    private String sex;

    private String telnum;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date hiredate;

    private String password;

    private String depId;

    private String posId;

    private Boolean status;

    private Date gmtCreate;

    private Date gmtModified;
}