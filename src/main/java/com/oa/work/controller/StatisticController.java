package com.oa.work.controller;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.work.entity.AffairStatistic;
import com.oa.work.entity.DutyStatistic;
import com.oa.work.service.AffairStatisticService;
import com.oa.work.service.DutyService;
import com.oa.work.service.DutyStatisticService;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/statistic")
public class StatisticController {

	@Autowired
	private AffairStatisticService affairStatisticService;

	@Autowired
	private DutyStatisticService dutyStatisticService;

	@Autowired
	private DutyService dutyService;

	@RightAnnotation(name="查看事务统计", desc="这是查看事务统计的权限")
	@RequestMapping("/affair/admin")
	public String affairAdmin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("pageNum", pageNum);
		return PageEnum.AFFAIR_STATISTIC_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/affair/page")
	public Result affairPage(PageCriteria<AffairStatistic> pageCriteria) {
		return new Result<>(affairStatisticService.selectPage(pageCriteria.setOrderBy("MONTH_ desc")));
	}

	@ResponseBody
	@RequestMapping("/affair/update")
	public void affairStatistic(String month) {
		//进行事务统计
		affairStatisticService.affairStatistic(affairStatisticService.selectCondition(new Criteria()
				.injectCriterion("month", "=", month)));
	}

	@RequestMapping("/duty/admin")
	public String toDutyAdmin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("pageNum", pageNum);
		return PageEnum.DUTY_STATISTIC_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/duty/page")
	public Result dutyPage(PageCriteria<DutyStatistic> pageCriteria) {
		return new Result<>(dutyStatisticService.selectPage(pageCriteria.setOrderBy("month desc")));
	}

	@ResponseBody
	@RequestMapping("/duty/update")
	public void dutyStatistic(String month) {
		//进行事务统计
		List<DutyStatistic> dutyStatisticList = dutyStatisticService.selectCondition(new Criteria()
				.injectCriterion("month", "=", month));
		for(DutyStatistic dutyStatistic: dutyStatisticList){
			dutyStatistic.setTotalNum(dutyService.countByCriteria(new Criteria()
					.injectCriterion("expiry_date", "like", dutyStatistic.getMonth() + "%")
					.injectCriterion("executor", "=", dutyStatistic.getExecutor())));
			dutyStatistic.setCompleteNum(dutyService.countByCriteria(new Criteria()
					.injectCriterion("expiry_date", "like", dutyStatistic.getMonth() + "%")
					.concatCriterion("(executor, status)", "=", "('"+dutyStatistic.getExecutor()+"', 2)")));
		}
		dutyStatisticService.batchUpdate(dutyStatisticList.toArray(new DutyStatistic[]{}));
	}

	@RequestMapping("/duty/export")
	public void exportDutyStatistic(HttpServletResponse response, String month) throws IOException {
		OutputStream out = null;
			byte[] bys = ("任务统计(" + month + ").xlsx").getBytes("UTF-8");
			response.setHeader("Content-Disposition","attachment; filename=" + new String(bys, 0, bys.length, "ISO8859-1"));
			out = response.getOutputStream();
			HSSFWorkbook workbook = new HSSFWorkbook(); // 声明一个工作薄
			HSSFSheet sheet = workbook.createSheet("事务统计");  // 生成一个表格
			//文字居中
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			//设置表头
			HSSFRow row = sheet.createRow(0);
			row.createCell(0).setCellValue("执行者");
			row.createCell(1).setCellValue("完成任务数");
			row.createCell(2).setCellValue("任务总数");
			row.createCell(3).setCellValue("月份");
			for(int i = 0; i < 4; i ++){
				row.getCell(i).setCellStyle(style);
			}

			List<DutyStatistic> list = dutyStatisticService.selectCondition(new Criteria()
					.injectCriterion("month", "=", month));
			int i = 1;
			for(DutyStatistic dutyStatistic: list){
				row = sheet.createRow(i);
				row.createCell(0).setCellValue(dutyStatistic.getExecutor());
				row.createCell(1).setCellValue(dutyStatistic.getCompleteNum());
				row.createCell(2).setCellValue(dutyStatistic.getTotalNum());
				row.createCell(3).setCellValue(month);
				for(int j = 0; j < 4; j ++){
					row.getCell(j).setCellStyle(style);
				}
				i ++;
			}
			//冻结第一行
			sheet.createFreezePane(0, 1, 0, 1);
			workbook.write(out);
			out.close();
	}
	
	@RequestMapping("/affair/export")
	public void exportAffairStatistic(HttpServletResponse response, String month) throws IOException {
		OutputStream out = null;
		byte[] bys = ("事务统计(" + month + ").xlsx").getBytes("UTF-8");
		response.setHeader("Content-Disposition","attachment; filename=" + new String(bys, 0, bys.length, "ISO8859-1"));
		out = response.getOutputStream();
		HSSFWorkbook workbook = new HSSFWorkbook(); // 声明一个工作薄
		HSSFSheet sheet = workbook.createSheet("事务统计");  // 生成一个表格
		//文字居中
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		//设置表头
		HSSFRow row = sheet.createRow(0);
		row.createCell(0);
		//合并单元格(起始行, 终止行, 起始列, 终止列 )
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 3, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 5, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 7, 8));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 9, 10));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 11, 12));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 13, 14));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 15, 16));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 17, 18));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 19, 20));
		row.createCell(1).setCellValue("日常事务");
		row.getCell(1).setCellStyle(style);
		row.createCell(3).setCellValue("行政事务");
		row.getCell(3).setCellStyle(style);
		row.createCell(5).setCellValue("物资流程");
		row.getCell(5).setCellStyle(style);
		row.createCell(7).setCellValue("经济事务");
		row.getCell(7).setCellStyle(style);
		row.createCell(9).setCellValue("营销流程");
		row.getCell(9).setCellStyle(style);
		row.createCell(11).setCellValue("公司日常流程");
		row.getCell(11).setCellStyle(style);
		row.createCell(13).setCellValue("工程流程");
		row.getCell(13).setCellStyle(style);
		row.createCell(15).setCellValue("卓之印");
		row.getCell(15).setCellStyle(style);
		row.createCell(17).setCellValue("通罗物流");
		row.getCell(17).setCellStyle(style);
		row.createCell(19).setCellValue("合计");
		row.getCell(19).setCellStyle(style);
		row.createCell(21);

		row = sheet.createRow(1);
		row.createCell(0).setCellValue("员工");
		row.createCell(1).setCellValue("发起");
		row.createCell(2).setCellValue("审批");
		row.createCell(3).setCellValue("发起");
		row.createCell(4).setCellValue("审批");
		row.createCell(5).setCellValue("发起");
		row.createCell(6).setCellValue("审批");
		row.createCell(7).setCellValue("发起");
		row.createCell(8).setCellValue("审批");
		row.createCell(9).setCellValue("发起");
		row.createCell(10).setCellValue("审批");
		row.createCell(11).setCellValue("发起");
		row.createCell(12).setCellValue("审批");
		row.createCell(13).setCellValue("发起");
		row.createCell(14).setCellValue("审批");
		row.createCell(15).setCellValue("发起");
		row.createCell(16).setCellValue("审批");
		row.createCell(17).setCellValue("发起");
		row.createCell(18).setCellValue("审批");
		row.createCell(19).setCellValue("发起");
		row.createCell(20).setCellValue("审批");
		row.createCell(21).setCellValue("月份");
		for(int i = 0; i < 22; i ++){
			row.getCell(i).setCellStyle(style);
		}

		List<AffairStatistic> list = affairStatisticService.selectCondition(new Criteria()
				.injectCriterion("MONTH_", "=", month));
		int i = 2;
		for(AffairStatistic affairStatistic: list){
			row = sheet.createRow(i);
			row.createCell(0).setCellValue(affairStatistic.getEmp());
			row.createCell(1).setCellValue(affairStatistic.getStartNum1());
			row.createCell(2).setCellValue(affairStatistic.getHandleNum1());
			row.createCell(3).setCellValue(affairStatistic.getStartNum2());
			row.createCell(4).setCellValue(affairStatistic.getHandleNum2());
			row.createCell(5).setCellValue(affairStatistic.getStartNum3());
			row.createCell(6).setCellValue(affairStatistic.getHandleNum3());
			row.createCell(7).setCellValue(affairStatistic.getStartNum4());
			row.createCell(8).setCellValue(affairStatistic.getHandleNum4());
			row.createCell(9).setCellValue(affairStatistic.getStartNum5());
			row.createCell(10).setCellValue(affairStatistic.getHandleNum5());
			row.createCell(11).setCellValue(affairStatistic.getStartNum6());
			row.createCell(12).setCellValue(affairStatistic.getHandleNum6());
			row.createCell(13).setCellValue(affairStatistic.getStartNum7());
			row.createCell(14).setCellValue(affairStatistic.getHandleNum7());
			row.createCell(15).setCellValue(affairStatistic.getStartNum8());
			row.createCell(16).setCellValue(affairStatistic.getHandleNum8());
			row.createCell(17).setCellValue(affairStatistic.getStartNum9());
			row.createCell(18).setCellValue(affairStatistic.getHandleNum9());
			row.createCell(19).setCellValue(affairStatistic.getStartNum10());
			row.createCell(20).setCellValue(affairStatistic.getHandleNum10());
			row.createCell(21).setCellValue(month);
			for(int j = 0; j < 22; j ++){
				row.getCell(j).setCellStyle(style);
			}
			i ++;
		}

		//冻结第一行
		sheet.createFreezePane(0, 1, 0, 1);
		workbook.write(out);
		out.close();
	}
}
