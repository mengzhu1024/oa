package com.oa.procedure.service.impl;

import com.elementchain.base.service.BaseServiceImpl;
import com.oa.procedure.entity.Control;
import com.oa.procedure.mapper.ControlMapper;
import com.oa.procedure.service.ControlService;
import org.springframework.stereotype.Service;

@Service
public class ControlServiceImpl extends BaseServiceImpl<Control, ControlMapper> implements ControlService{
}
