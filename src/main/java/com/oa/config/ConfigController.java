package com.oa.config;

import com.oa.domain.Result;
import com.oa.utils.Constant;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: huwenlong
 * @date: 2019-05-20 10:29
 */
@RestController
@RequestMapping("/config")
public class ConfigController {

    @GetMapping("/root-path")
    public Result getRootPath() {
        return new Result<>(Constant.ROOT_PATH);
    }

    @GetMapping("/temp-path")
    public Result getTempPath() {
        return new Result<>(Constant.TEMP_PATH);
    }

    @GetMapping("/ip-port")
    public Result getIpPort() {
        return new Result<>(Constant.IP_PORT);
    }
}
