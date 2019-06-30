package com.oa.domain;

import com.oa.domain.enums.ResultEnum;
import lombok.Data;

/**
 * @author jiguang.qi
 * Created on 2018/11/14
 * Description
 */

@Data
public class Result<T> {

    private Integer code;

    private String msg;

    private T data;

    private Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(T data) {
        this.code = 0;
        this.data = data;
    }

    public static Result result(ResultEnum resultEnum) {
        return new Result(resultEnum.getCode(), resultEnum.getDesc());
    }

}
