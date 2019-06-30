package com.elementchain.base.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class PageResult<T> implements Serializable {

    private static ThreadLocal<PageResult> pageResultThreadLocal = ThreadLocal.withInitial(PageResult::new);

    /**
     * 查询页码
     */
    private Integer pageNum = 1;

    /**
     * 查询总页数
     */
    private Integer pageCount;

    /**
     * 查询总记录数
     */
    private Integer rowCount;

    /**
     * 查询结果集
     */
    private List<T> entityList;

    private PageResult() {
    }

    public static <T> PageResult<T> getCurrentPageResult(List<T> entityList) {
        PageResult<T> pageResult = pageResultThreadLocal.get();
        pageResult.setEntityList(entityList);
        return pageResult;
    }

    public static <T> PageResult<T> getCurrentPageResult() {
        return pageResultThreadLocal.get();
    }
}