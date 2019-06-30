package com.oa.work.service.impl;

import com.elementchain.base.service.BaseServiceImpl;
import com.oa.work.entity.Duty;
import com.oa.work.mapper.DutyMapper;
import com.oa.work.service.DutyService;
import org.springframework.stereotype.Service;

@Service
public class DutyServiceImpl extends BaseServiceImpl<Duty, DutyMapper> implements DutyService {
}