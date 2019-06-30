package com.oa.auth.service.impl;

import com.elementchain.base.service.BaseServiceImpl;
import com.oa.auth.entity.Right;
import com.oa.auth.mapper.RightMapper;
import com.oa.auth.service.RightService;
import com.oa.utils.StringUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RightServiceImpl extends BaseServiceImpl<Right, RightMapper> implements RightService {

	@Override
	public Integer insert(Right right) {
		Integer[] nums = getLastPosAndCode();
		right.setPos(nums[0]);
		right.setCode(nums[1]);
		right.setId(StringUtil.randomUUID());
		return baseMapper.insert(right);
	}

	@Override
	public Integer batchInsert(List<Right> rightList) {
		Integer[] nums = getLastPosAndCode();
		Integer lastCode = nums[0];
		Integer lastPos = nums[1];
		//重写Right的toString方法，根据url去除数据表里已经有的Right
		List<Right> rightList2 = baseMapper.selectAll();
		rightList.removeAll(rightList2);
		int i = 0;
		for (Right right : rightList) {
			right.setId(StringUtil.randomUUID());
			right.setCode(lastCode);
			right.setPos(lastPos);
			i += baseMapper.insert(right);
			if (lastCode < 1 << 30) {
				lastCode <<= 1;
			} else {
				lastPos++;
				lastCode = 1;
			}
		}
		return i;
	}

	private Integer[] getLastPosAndCode() {
		Right maxRight = baseMapper.selectMaxRight();
		Integer[] nums = new Integer[2];
		nums[0] = 0;
		nums[1] = 1;
		if (maxRight != null) {
			nums[0] = maxRight.getPos();
			nums[1] = maxRight.getCode();
			if (nums[1] < 1 << 30) {
				nums[1] <<= 1;
			} else {
				nums[0]++;
				nums[1] = 1;
			}
		}
		return nums;
	}
}