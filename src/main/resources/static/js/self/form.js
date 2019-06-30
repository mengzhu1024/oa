$("document").ready(function(){
	$.fn.extend({
		//定义一些变量
		mergeModel: false,//合并模式
		/*进入合并模式后固定点（第一次点击的点）、非固定点（没有松开ctrl键点击的点）、
		起点（从左上到右下第一个点）、终点（从左上到右下最后一个点）*/
		$fixedTd: null,
		$unfixedTd: null,
		$firstTd: null,
		$lastTd: null,
		//选中的单元格
		$selectedTds: null,
		//选中的行
		$selectedTr: null,
		//单元格点击效果
		tdClick: function (){
			$("#table_form tbody tr td").css("backgroundColor", "white");
			$("#table_form tbody tr td").attr("isselected", "false");
			if($.fn.mergeModel){
				$.fn.$unfixedTd = $(this);
				var fixedRownum = parseInt($.fn.$fixedTd.attr("rownum"));
				var fixedColnum = parseInt($.fn.$fixedTd.attr("colnum"));
				var unfixedRownum = parseInt($.fn.$unfixedTd.attr("rownum"));
				var unfixedColnum = parseInt($.fn.$unfixedTd.attr("colnum"));
				//从左上到右下重新设置$.fn.$firstTd, $.fn.$lastTd
				$.fn.$firstTd = $("#table_form tbody tr td[rownum='"+Math.min(fixedRownum, unfixedRownum)+"'][colnum='"+Math.min(fixedColnum, unfixedColnum)+"']");
				$.fn.$lastTd = $("#table_form tbody tr td[rownum='"+Math.max(fixedRownum, unfixedRownum)+"'][colnum='"+Math.max(fixedColnum, unfixedColnum)+"']");
				//alert($.fn.$firstTd.attr("rownum") + " " + $.fn.$firstTd.attr("colnum") + " " + $.fn.$lastTd.attr("rownum") + " " + $.fn.$lastTd.attr("colnum"));
				$.each($("#table_form tbody tr td"), function(){
					if(parseInt($(this).attr("colnum")) >= parseInt($.fn.$firstTd.attr("colnum")) && 
							parseInt($(this).attr("rownum")) >= parseInt($.fn.$firstTd.attr("rownum")) &&
							parseInt($(this).attr("colnum")) < parseInt($.fn.$lastTd.attr("colnum")) + parseInt($.fn.$lastTd.attr("colspan")) && 
							parseInt($(this).attr("rownum")) < parseInt($.fn.$lastTd.attr("rownum")) + parseInt($.fn.$lastTd.attr("rowspan"))) {
						$(this).css("backgroundColor", "#F5F5F5");
						$(this).attr("isselected", "true");
					}
				});
			}else{
				//在非合并模式状态记录$.fn.$fixedTd
				$.fn.$fixedTd = $(this);
				$(this).css("backgroundColor", "#F5F5F5");
				$(this).attr("isselected", "true");
			}
			//显示相关的按钮
			if($("#table_form tbody tr td[isselected='true']").length == 1){
				//如果只有一个单元格被选中，设置插入按钮、删除按钮、控件按钮可用；合并按钮不可用。
				$("button[id^='button_insert'], button[id^='button_delete_'], button[id^='button_control_']").removeAttr("disabled");
				$("#button_merge").attr("disabled", "disabled");
				//如果该单元格的行跨数与列跨数不为1，设置取消合并按钮可用
				if($(this).prop("rowspan") > 1 || $(this).prop("colspan") > 1){
					$("#button_unmerge").removeAttr("disabled");
				}else{
					$("#button_unmerge").attr("disabled", "disabled");
				}
			}else{
				$("button[id^='button_insert'], button[id^='button_delete_'], button[id^='button_control_']").attr("disabled", "disabled");
				$("#button_unmerge").attr("disabled", "disabled");
				$("#button_merge").removeAttr("disabled");
			}
			
			//给$.fn.$selectedTds、$.fn.$selectedTr赋值
			$.fn.$selectedTds = $("#table_form tbody tr td[isselected='true']");
			if($.fn.$selectedTds.length == 1){
				$.fn.$selectedTr = $.fn.$selectedTds.parent("tr");
			}
		},
		
		//单元格获取焦点效果
		tdFocusin: function (){
			$("#table_form tbody tr td").css("backgroundColor", "white");
			$("#table_form tbody tr td").attr("isselected", "false");
			$(this).css("backgroundColor", "#F5F5F5");
			$(this).attr("isselected", "true");
		},
		
		//单元格合并效果
		merge: function(){
			if($("#table_form tbody tr td[isselected='true'][rowspan!='1']").length + 
					$("#table_form tbody tr td[isselected='true'][colspan!='1']").length){
				$.messager.alert("提示", "已经合并过的单元格不能合并", "error");
				return false;
			}
			if($("#table_form tbody tr td[isselected='true']:gt(0)").children().length){
				if($.fn.$selectedTds.children(":input[controlType='1'][joincaculate!='']").length){
					$.messager.confirm("操作提示……", "单元格中包含计算控件，如果合并，则会删除所有的计算控件和参与计算的"+
							"控件，且仅保留第一个单元格中的内容，您确定继续吗？", function(sure){
						if(sure){
							$(":input[controlType='9']").remove();
							$(":input[controlType='1'][joincaculate!='']").attr("joincaculate", "");
							$("#table_form tbody tr td[isselected='true']:gt(0)").empty();
							$("#table_form tbody tr td[isselected='true']:not(:first)").remove();
							$.fn.$firstTd.prop("colspan", parseInt($.fn.$firstTd.prop("colspan")) + parseInt($.fn.$lastTd.attr("colnum")) - parseInt($.fn.$firstTd.attr("colnum")));
							$.fn.$firstTd.prop("rowspan", parseInt($.fn.$firstTd.prop("rowspan")) + parseInt($.fn.$lastTd.attr("rownum")) - parseInt($.fn.$firstTd.attr("rownum")));
							//调用click，恢复按钮状态
							$.fn.$firstTd.click();
						}
					});
				}else {
					$.messager.confirm("操作提示……", "如果合并则仅保留第一个单元格中的内容，您确定继续吗？", function(sure){
						if(sure){
							$("#table_form tbody tr td[isselected='true']:gt(0)").empty();
							$("#table_form tbody tr td[isselected='true']:not(:first)").remove();
							$.fn.$firstTd.prop("colspan", parseInt($.fn.$firstTd.prop("colspan")) + parseInt($.fn.$lastTd.attr("colnum")) - parseInt($.fn.$firstTd.attr("colnum")));
							$.fn.$firstTd.prop("rowspan", parseInt($.fn.$firstTd.prop("rowspan")) + parseInt($.fn.$lastTd.attr("rownum")) - parseInt($.fn.$firstTd.attr("rownum")));
							//调用click，恢复按钮状态
							$.fn.$firstTd.click();
						}
					});
				};
			}else{
				$("#table_form tbody tr td[isselected='true']:not(:first)").remove();
				$.fn.$firstTd.prop("colspan", parseInt($.fn.$firstTd.prop("colspan")) + parseInt($.fn.$lastTd.attr("colnum")) - parseInt($.fn.$firstTd.attr("colnum")));
				$.fn.$firstTd.prop("rowspan", parseInt($.fn.$firstTd.prop("rowspan")) + parseInt($.fn.$lastTd.attr("rownum")) - parseInt($.fn.$firstTd.attr("rownum")));
				//调用click，恢复按钮状态
				$.fn.$firstTd.click();
			}
		},
		
		//单元格取消合并效果
		unmerge: function(){
			//记录起始、终止行，起始、终止列。
			var startRow = parseInt($.fn.$selectedTds.attr("rownum"));
			var endRow = parseInt($.fn.$selectedTds.attr("rownum")) + parseInt($.fn.$selectedTds.attr("rowspan")) - 1;
			var startCol = parseInt($.fn.$selectedTds.attr("colnum"));
			var endCol = parseInt($.fn.$selectedTds.attr("colnum")) + parseInt($.fn.$selectedTds.attr("colspan")) - 1;
			$.fn.$selectedTds.prop("colspan", 1);
			$.fn.$selectedTds.prop("rowspan", 1);
			for(var i = startRow; i <= endRow; i ++){
				var $td2 = "";
				//给第一行追加单元格。调用选中单元格的after方法，新添加的单元格会把已存在的单元格挤到后面，故这里倒序遍历
				if(i == startRow){
					//给第一行追加单元格。调用选中单元格的after方法，新添加的单元格会把已存在的单元格挤到后面，故这里倒序遍历
					//由于选中的单元格在第一行，这里比下面的行少添加一个，故j >= startCol + 1;
					for(var j = endCol; j >= startCol + 1; j --){
						//创建新的单元格并绑定点击、获取焦点事件
						$td2 = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
						$td2.attr("rownum", startRow);
						$td2.attr("colnum", j);
						//测试代码
						//$td2.text($td2.attr("rownum") + " " + $td2.attr("colnum"));
						$td2.click($.fn.tdClick);
						$td2.focusin($.fn.tdClick);
						$td2.css("backgroundColor", "#F5F5F5");
						$td2.attr("isselected", "true");
						//通过选中的单元格追加新的单元格
						$.fn.$selectedTds.after($td2);
					};
				}else{
					//给下面的行追加单元格
					//记录每一行最左面的单元格。如果合并的单元格包含最左侧的，则$td1为空，通过这一行prepend；
					//如果合并的单元格在中间，则$td1存在，通过$td1追加。
					var $td1 = $("#table_form tbody tr td[rownum='"+i+"'][colnum='"+(startCol - 1)+"']");
					if($td1.length == 1){
						for(var j = endCol; j >= startCol; j --){
							//创建新的单元格并绑定点击、获取焦点事件
							$td2 = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
							$td2.attr("rownum", i);
							$td2.attr("colnum", j);
							//测试代码
							//$td2.text($td2.attr("rownum") + " " + $td2.attr("colnum"));
							$td2.click($.fn.tdClick);
							$td2.focusin($.fn.tdFocusin);
							$td2.css("backgroundColor", "#F5F5F5");
							$td2.attr("isselected", "true");
							//通过每一行的第一个单元格追加新的单元格
							$td1.after($td2);
						};
					}else{
						var $tr = $("#table_form tbody tr[rownum='"+i+"']");
						for(var j = endCol; j >= startCol; j --){
							//创建新的单元格并绑定点击、获取焦点事件
							$td2 = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
							$td2.attr("rownum", i);
							$td2.attr("colnum", j);
							//测试代码
							//$td2.text($td2.attr("rownum") + " " + $td2.attr("colnum"));
							$td2.click($.fn.tdClick);
							$td2.focusin($.fn.tdFocusin);
							$td2.css("backgroundColor", "#F5F5F5");
							$td2.attr("isselected", "true");
							//追加新的单元格
							$tr.prepend($td2);
						};
					};
				};
			}
			$("button[id^='button_insert'], button[id^='button_control_'], button[id^='button_delete_']").attr("disabled", "disabled");
			$("#button_unmerge").attr("disabled", "disabled");
			$("#button_merge").removeAttr("disabled");
		},
		
		//在上方插入
		insertTop: function(){
			var index = parseInt($.fn.$selectedTr.attr("rownum")) - 2;
			//给之后的行、单元格重新定义rownum属性
			if(index < 0){
				$.each($("#table_form tbody tr"), function(){
					$(this).attr("rownum", parseInt($(this).attr("rownum")) + 1);
					$(this).children("td").attr("rownum", $(this).attr("rownum"));
					//测试代码
					/* $.each($(this).children("td"), function(){
						$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
					}); */
				});
			}else{
				$.each($("#table_form tbody tr:gt("+index+")"), function(){
					$(this).attr("rownum", parseInt($(this).attr("rownum")) + 1);
					$(this).children("td").attr("rownum", $(this).attr("rownum"));
					//测试代码
					/* $.each($(this).children("td"), function(){
						$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
					}); */
				});
			}
			$tr = $("<tr align='center'></tr>");
			var rownum = parseInt($.fn.$selectedTr.attr("rownum")) - 1;
			$tr.attr("rownum", rownum);
			//记录刚刚插入的colnum;
			var colnum = 1;
			$.each($.fn.$selectedTr.children("td"), function(i, n){
				for(var j = 1; j<= parseInt($(this).attr("colspan")); j ++){
					$td = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
					$td.attr("rownum", rownum);
					$td.attr("colnum", colnum);
					//测试代码
					//$td.text($td.attr("rownum") + " " + $td.attr("colnum"));
					$td.click($.fn.tdClick);
					$td.focusin($.fn.tdFocusin);
					$tr.append($td);
					colnum ++;
				};
			});
			$tr.css("cursor", "default");
			$.fn.$selectedTr.before($tr);
		},
		
		//在下方插入
		insertBottom: function(){
			//执行after的tr
			var $targetTr = $("#table_form tbody tr[rownum='"+(parseInt($.fn.$selectedTds.attr("rownum")) + parseInt($.fn.$selectedTds.attr("rowspan")) - 1) +"']");
			var index = parseInt($targetTr.attr("rownum")) - 1;
			//给之后的行、单元格重新定义rownum属性
			$.each($("#table_form tbody tr:gt("+index+")"), function(){
				$(this).attr("rownum", parseInt($(this).attr("rownum")) + 1);
				$(this).children("td").attr("rownum", $(this).attr("rownum"));
				//测试代码
				/* $.each($(this).children("td"), function(){
					$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
				}); */
			});
			$tr = $("<tr align='center'></tr>");
			var rownum = parseInt($.fn.$selectedTr.attr("rownum")) + parseInt($.fn.$selectedTds.attr("rowspan"));
			$tr.attr("rownum", rownum);
			//记录刚刚插入的colnum;
			var colnum = 1;
			$.each($.fn.$selectedTr.children("td"), function(i, n){
				for(var j = 1; j<= parseInt($(this).attr("colspan")); j ++){
					$td = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
					$td.attr("rownum", rownum);
					$td.attr("colnum", colnum);
					//测试代码
					//$td.text($td.attr("rownum") + " " + $td.attr("colnum"));
					$td.click($.fn.tdClick);
					$td.focusin($.fn.tdFocusin);
					$tr.append($td);
					colnum ++;
				}
			});
			$tr.css("cursor", "default");
			$targetTr.after($tr);
		},
		
		//在左侧插入
		insertLeft: function(){
			var selectedColnum = $.fn.$selectedTds.attr("colnum");
			var $selectedTc = $("#table_form tbody tr td[colnum='"+$.fn.$selectedTds.attr("colnum")+"']");
			$.each($selectedTc, function(){
				var $td = "";
				for(var i = 0; i < parseInt($(this).attr("rowspan")); i ++){
					$td = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
					$td.attr("rownum", parseInt($(this).attr("rownum")) + i);
					$td.attr("colnum", selectedColnum);
					//测试代码
					//$td.text($td.attr("rownum") + " " + $td.attr("colnum"));
					$td.click($.fn.tdClick);
					$td.focusin($.fn.tdFocusin);
					if($(this).attr("rowspan") == "1"){
						$(this).before($td);
					}else{
						if($(this).attr("colnum") == "1"){
							$("#table_form tbody tr[rownum='"+(parseInt($(this).attr("rownum")) + i)+"']").prepend($td);
						}else{
							$("#table_form tbody tr[rownum='"+(parseInt($(this).attr("rownum")) + i)+"']").children("td[colnum='"+(parseInt($(this).attr("colnum")) - 1)+"']").after($td);
						}
					}
				}
				
				//更新插入单元格之后单元格的colnum。
				for(var i = parseInt($(this).attr("rowspan")) - 1; i >=0 ; i --){
					var $tds = $("#table_form tbody tr td[rownum='"+(parseInt($td.attr("rownum")) - i)+"'][colnum='"+$td.attr("colnum")+"']").nextAll();
					$.each($tds, function(){
						$(this).attr("colnum", parseInt($(this).attr("colnum")) + 1);
						//
						//$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
					});
				}
			});
			//给单元格重新设置宽度
			$("#table_form tbody tr td").css("width", $("#table_form").width()/$("#table_form tbody tr:first td").length);
		},
		
		//在右侧插入
		insertRight: function(){
			var selectedColnum = $.fn.$selectedTds.attr("colnum");
			var $selectedTc = $("#table_form tbody tr td[colnum='"+$.fn.$selectedTds.attr("colnum")+"']");
			$.each($selectedTc, function(){
				var $td = "";
				for(var i = 0; i < parseInt($(this).attr("rowspan")); i ++){
					$td = $("<td rowspan='1' colspan='1' contenteditable='true'></td>");
					$td.attr("rownum", parseInt($(this).attr("rownum")) + i);
					$td.attr("colnum", parseInt(selectedColnum) + parseInt($(this).attr("colspan")));
					//测试代码
					//$td.text($td.attr("rownum") + " " + $td.attr("colnum"));
					$td.click($.fn.tdClick);
					$td.focusin($.fn.tdFocusin);
					if(i == 0){
						$(this).after($td);
					}else{
						if((parseInt($(this).attr("colnum")) - 1) == 0){
							$("#table_form tbody tr[rownum='"+(parseInt($(this).attr("rownum")) + i)+"']").prepend($td);
						}else{
							$("#table_form tbody tr[rownum='"+(parseInt($(this).attr("rownum")) + i)+"']").children("td[colnum='"+(parseInt($(this).attr("colnum")) - 1)+"']").after($td);
						}
					}
				}
				
				//更新插入单元格之后单元格的colnum。
				for(var i = parseInt($(this).attr("rowspan")) - 1; i >=0 ; i --){
					var $tds = $("#table_form tbody tr td[rownum='"+(parseInt($td.attr("rownum")) - i)+"'][colnum='"+$td.attr("colnum")+"']").nextAll();
					$.each($tds, function(){
						$(this).attr("colnum", parseInt($(this).attr("colnum")) + 1);
						//测试代码
						//$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
					});
				}
			});
			//给单元格重新设置宽度
			$("#table_form tbody tr td").css("width", $("#table_form").width()/$("#table_form tbody tr:first td").length);
		},
		
		//删除整行
		deleteRow: function(){
			//如果是合并单元格，得到相关的行
			var $relativeTr = $.fn.$selectedTr.nextAll("tr:lt("+parseInt($.fn.$selectedTds.attr("rowspan") - 1)+")");
			var index = parseInt($.fn.$selectedTr.attr("rownum")) - 1;
			
			//给之后的行、单元格重新定义rownum属性
			$.each($("#table_form tbody tr:gt("+index+")"), function(){
				$(this).attr("rownum", parseInt($(this).attr("rownum")) - 1 - $relativeTr.length);
				$(this).children("td").attr("rownum", $(this).attr("rownum"));
				//测试代码
				/* $.each($(this).children("td"), function(){
					$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
				}); */
			});
			$.fn.$selectedTr.remove();
			$relativeTr.remove();
		},
		
		//删除整列
		deleteCol: function(){
			var colspan = parseInt($.fn.$selectedTds.attr("colspan"));
			//删除对应的列单元格
			for(var i = 0; i < colspan; i ++){
				$("#table_form tbody tr td[colnum='"+(parseInt($.fn.$selectedTds.attr("colnum")) + i) +"']").remove();
			}
			//给右侧单元格的colnum重新赋值
			$.each($("#table_form tbody tr td"), function(){
				if($(this).attr("colnum") >= parseInt($.fn.$selectedTds.attr("colspan")) + colspan){
					$(this).attr("colnum", $(this).attr("colnum") - colspan);
					//测试代码
					//$(this).text($(this).attr("rownum") + " " + $(this).attr("colnum"));
				}
			});
			//给单元格重新设置宽度
			$("#table_form tbody tr td").css("width", $("#table_form").width()/$("#table_form tbody tr:first td").length);
		},
		//操作控件
		//定义一些变量
		controlType: null,//控件类型
		code_reg: /[a-zA-Z]+[0-9]*/gi,//控件简码正则表达式
		space_reg: /\s+/gi,//空格正则表达式
		caculate_reg: /[\+\-\*\/\(\)]+/gi,//运算符号正则表达式
		$control: null,//待添加的控件
		
		//空间按钮点击效果
		buttonControlClick: function() {
			//根据不同的控件类型显示不同的输入项目
			$.fn.controlType = $(this).prop("id").split("_")[2];
			$.fn.showInputItem($.fn.controlType);
			//重置输入框内容
			$("#table_control tr td").children(":input[type='text']").val("");
			$("textarea").val("");
			$(":input[name='width']").val("80");
			$(":input[name='height']").val("3");
			$(":input[name='decimalBit']").val("2");
			$("#window_addControl").window("open");
			
			$("#button_sureUpdate").hide();
			$("#button_sureAdd").show();
		},
		
		//显示添加控件输入项目
		showInputItem: function(controlType){
			$("#tr_decimalBit").hide();
			if(controlType < 3){
				$("#tr_selectItem").hide();
				$("#tr_formula").hide();
				$("#tr_height").hide();
				$("#tr_dateType").hide();
				$("#tr_defaultValue").show();
				if(controlType == 2){
					$("#tr_height").show();
				}
			}else if(controlType < 6){
				$("#tr_defaultValue").hide();
				$("#tr_formula").hide();
				$("#tr_height").hide();
				$("#tr_dateType").hide();
				$("#tr_selectItem").show();
			}else if(controlType < 9 || controlType >= 10 && controlType <= 12){
				$("#tr_defaultValue").hide();
				$("#tr_selectItem").hide();
				$("#tr_formula").hide();
				$("#tr_height").hide();
				if(controlType < 9){
					$("#tr_dateType").show();
					if(controlType == 6){
						$("#span_dateType").text("日期");
					}else if(controlType == 7){
						$("#span_dateType").text("时间");
					}else{
						$("#span_dateType").text("日期时间");
					}
				}else{
					$("#tr_dateType").hide();
				};
			}else if(controlType == 9){
				$("#tr_selectItem").hide();
				$("#tr_defaultValue").hide();
				$("#tr_height").hide();
				$("#tr_dateType").hide();
				$("#tr_decimalBit").show();
				$("#tr_formula").show();
			}else{
				$("#tr_height").hide();
				$("#tr_dateType").hide();
			};
		},
		
		//右键控件属性
		selectControlType: null,
		selectControlCode: null,
		//控件右键菜单响应
		contContextmenu: function (obj, controlType) {
			$("input[name='name']").val($(obj).attr("name"));
			$("input[name='code']").val($(obj).attr("code"));
			$("input[name='width']").val(Math.round($(obj).width()*100/$(obj).parent("td").width()));
			$.fn.selectControlCode = $(obj).attr("code");
			$.fn.selectControlType = $(obj).attr("controlType");
			//给相应的文本框、文本域赋值
			if(controlType < 3){
				$(":input[name='defaultValue']").val($(obj).attr("defaultValue"));
			}else if(controlType < 6){
				$("#textarea_selectItem").val("");
				if(controlType == 3){
					$.each($(obj).children("option"), function(){
						$("#textarea_selectItem").val($("#textarea_selectItem").val() + $(this).val() + "\n");
					});
				}else if(controlType == 4){
					var $radio = $("div[code='" + $(obj).attr("code") + "']>:radio");
					$.each($radio, function(){
						$("#textarea_selectItem").val($("#textarea_selectItem").val() + $(this).val() + "\n");
					});
				}else if(controlType == 5){
					var $checkbox = $("div[name='" + $(obj).attr("name") + "']>:checkbox");
					$.each($checkbox, function(){
						$("#textarea_selectItem").val($("#textarea_selectItem").val() + $(this).val() + "\n");
					});
				};
			}else if(controlType < 9){
				if($(obj).attr("dateType")){
					$(":radio[name='radio_dateType'][value='1']").prop("checked", "checked");
				}else{
					$(":radio[name='radio_dateType'][value='0']").prop("checked", "checked");
				}
			}else if(controlType == 9){
				$("#textarea_formula").val($(obj).prop("placeholder"));
				$(":input[name='decimalBit']").val($(obj).attr("decimalBit"));
			}
			$("#div_contextmenu").css("left", event.clientX);
			$("#div_contextmenu").css("top", event.clientY);
			$("#div_contextmenu").show();
		},
		saveOrUpdateControl: function() {
			var buttonText = $(this).text().trim();
			//检查控件的公共属性（名称、简码）
			var name = $(":input[name='name']").val().trim();
			$(":input[name='name']").val(name);
			if(name == ""){
				$.messager.alert("提示", "控件名称不能为空", "error");
				$(":input[name='name']").focus();
				return false;
			}
			
			var code = $(":input[name='code']").val().trim();
			$(":input[name='code']").val(code);
			var result = $.fn.code_reg.exec(code) != code;
			$.fn.code_reg.compile($.fn.code_reg);
			if(!code && result){
				$.messager.alert("提示", "控件简码只能包含子母(至少一个)、数字", "error");
				$(":input[name='code']").focus();
				return false;
			}
			if(buttonText == "确定增加"){
				if($("[code='"+code+"']").length > 0){
					$.messager.alert("提示", "控件简码已存在", "error");
					$(":input[name='code']").focus();
					return false;
				};
			}else if(buttonText == "确定修改"){
				//排除自身简码
				if(code!= $.fn.selectControlCode){
					//如果简码发生变化，则不能修改成已经存在的简码
					if($("[code='"+code+"']").length > 0){
						$.messager.alert("提示", "控件简码已存在", "error");
						$(":input[name='code']").focus();
						return false;
					}
					//如果简码发生变化，且参与运算，则不能修改简码
					var $selectControl = $("[code='"+$.fn.selectControlCode+"']");
					if($selectControl.attr("joincaculate")){
						//如果是参与运算的单行文本
						$.messager.alert("提示", "该控件是参与计算的控件，控件名称有：" + $selectControl.attr("joincaculate").split("_") +",不能修改简码！", "error");
						return false;
					};
				};
			}
			
			var controlType = buttonText == "确定增加"? $.fn.controlType: $.fn.selectControlType;
			//检查控件的非公共属性
			//检查选项列表
			if(controlType > 2 && controlType < 6){
				//添加下拉列表、单选按钮、复选框控件
				var selectItem = $("#textarea_selectItem").val().trim();
				$("#textarea_selectItem").val(selectItem);
				if(selectItem == ""){
					$.messager.alert("提示", "选项条目不能为空", "error");
					$("#textarea_selectItem").focus();
					return false;
				};
			}else if(controlType == 9){
				//检查公式
				var formula = $("#textarea_formula").val().replace($.fn.space_reg, "");
				$("#textarea_formula").val(formula);
				if(formula == ""){
					$.messager.alert("提示", "公式格式不正确", "error");
					$("#textarea_formula").focus();
					return false;
				}
				var controlCodes = formula.split($.fn.caculate_reg);
				//弹出数组空值
				if(!controlCodes[0]){
					controlCodes.shift();
				}
				if(!controlCodes[controlCodes.length - 1]){
					controlCodes.pop();
				}
				//检测控件是否存在
				for(var i = 0; i < controlCodes.length; i ++){
					if(!Number(controlCodes[i]) && $("[controlType='1'][code='"+controlCodes[i]+"']").length == 0){
						$.messager.alert("提示", "单行文本控件" + controlCodes[i] + "不存在", "error");
						$("#textarea_formula").focus();
						return false;
					};
				}
				//进行一次运算测试，如果通不过，则进行提示
				var str = formula.replace($.fn.code_reg, "2");
				try{
					$.messager.alert("提示", "公式检测：如果变量都为2，计算结果为：" + eval(str), "info");
				}catch (e){
					$.messager.alert("提示", "公式格式不正确", "error");
					$("#textarea_formula").focus();
					return false;
				}
				
				if(buttonText == "确定修改"){
					var $selectControl = $("[code='"+$.fn.selectControlCode+"']");
					var oldControlCodes = $selectControl.prop("placeholder").split($.fn.caculate_reg);
					if(!oldControlCodes[0]){
						oldControlCodes.shift();
					}
					if(!oldControlCodes[oldControlCodes.length - 1]){
						oldControlCodes.pop();
					}
					//给旧的参与计算控件去掉该计算控件的值
					for(var i = 0; i < oldControlCodes.length; i ++){
						var $oldControl = $("[code='"+oldControlCodes[i]+"']");
						if($oldControl.attr("joincaculate").split("_").length == 1){
							//如果只参与了一个控件计算
							$oldControl.attr("joincaculate", "");
						}else{
							if($oldControl.attr("joincaculate").indexOf($selectControl.attr("code")) == 0){
								//如果在计算控件的首位
								$oldControl.attr("joincaculate", $oldControl.attr("joincaculate").replace($selectControl.attr("code") + "_", ""));
							}else if($oldControl.attr("joincaculate").indexOf($selectControl.attr("code")) > 0){
								//如果在计算控件的中间或末尾
								$oldControl.attr("joincaculate", $oldControl.attr("joincaculate").replace("_" + $selectControl.attr("code") , ""));
							};
						};
					}
					$selectControl.prop("placeholder", formula);
				}
				//给参与计算的文本框更新属性
				for(var i = 0; i < controlCodes.length; i ++){
					//修改joincaculate属性
					var $joincaculate = $("[code='"+controlCodes[i]+"']");
					if($joincaculate.attr("joincaculate") == ""){
						//如果该控件还没有参与运算
						$joincaculate.attr("joincaculate", code);
					}else{
						//如果该控件已经参与运算
						$joincaculate.attr("joincaculate", $joincaculate.attr("joincaculate") + "_" + code);
					};
				};
			}

			if(buttonText == "确定增加"){
				//设计控件
				if($.fn.controlType == 1){
					//添加单行文本控件
					$.fn.$control = $("<input type='text' name='" + name + "' code='"+code+"' defaultValue='" + 
							$(":input[name='defaultValue']").val().trim()+ "' placeholder='请输入" + name +
							"' joincaculate='' value='"+$(":input[name='defaultValue']").val().trim() + "'"+
							" oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'>");
				}else if($.fn.controlType == 2){
					//添加多行文本控件
					$.fn.$control = $("<textarea name='"+name+"' code='"+code+"' defaultValue='" + 
					$(":input[name='defaultValue']").val().trim() + "' placeholder='请输入" + name + 
					"' rows='"+$(":input[name='height']").val()+"' oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'>"+
					$(":input[name='defaultValue']").val().trim()+"</textarea>");
				}else if($.fn.controlType < 6){
					var strs = $("#textarea_selectItem").val().split($.fn.space_reg);
					if($.fn.controlType == 3){
						//添加下拉列表
						$.fn.$control = $("<select name='" + name + "' code='"+code+
						"' oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'><select>");
						for(var i in strs){
							var $option = $("<option value='"+strs[i]+"'>"+strs[i]+"</option>");
							$.fn.$control.append($option);
						};
					}else if($.fn.controlType == 4){
						//如果是单选按钮，则先用一个div容器添加单选按钮，再添加该div
						$.fn.$control = $("<div name='" + name + "' code='"+code+
								"' oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'></div>");
						for(var i in strs){
							//给radio的name属性赋值code
							var $radio = $("<input type='radio' name='"+code+"' value='" + strs[i] + "'>" + strs[i] + "</input>");
							$radio.css("cursor", "pointer");
							$.fn.$control.append($radio);
							$.fn.$control.append("&nbsp;&nbsp;&nbsp;");
						};
					}else if($.fn.controlType == 5){
						//如果是复选框，则先用一个div容器添加单选按钮，再添加该div
						$.fn.$control = $("<div name='" + name + "' code='"+code+
								"' oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'></div>");
						for(var i in strs){
							var $checkbox = $("<input type='checkbox' name='"+code+
									"' value='" + strs[i] + "'>" + strs[i] + "</input>");
							$checkbox.css("cursor", "pointer");
							$.fn.$control.append($checkbox);
							$.fn.$control.append("&nbsp;&nbsp;&nbsp;");
						};
					};
				}else if($.fn.controlType < 9){
					//设计日期、时间控件
					var dateType = $(":radio[name='radio_dateType']:checked").val();
					$.fn.$control = $("<input type='text' name='"+name+"' code='"+code + "' id=" + code +
							"' readonly oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'>");
					var now = new Date();
					if(dateType == 0){
						$.fn.$control.removeAttr("dateType");
					}
					if($.fn.controlType == 6){
						if(dateType == "0"){
							$.fn.$control.val(now.format("yyyy-MM-dd"));
						}else{
							$.fn.$control.prop("placeholder", "请选择" + name);
							$.fn.$control.attr("dateType", "date");
						};
					}else if($.fn.controlType == 7){
						if(dateType == "0"){
							$.fn.$control.val(now.format("hh:mm:ss"));
						}else{
							$.fn.$control.prop("placeholder", "请选择" + name);
							$.fn.$control.attr("dateType", "time");
						};
					}else if($.fn.controlType == 8){
						if(dateType == "0"){
							$.fn.$control.val(now.format("yyyy-MM-dd hh:mm:ss"));
						}else{
							$.fn.$control.prop("placeholder", "请选择" + name);
							$.fn.$control.attr("dateType", "datetime");
						};
					};
				}else if($.fn.controlType == 9){
					//设计计算控件
					$.fn.$control = $("<input type='text' name='"+name+"' code='"+code + "' placeholder='"+
							$("#textarea_formula").val()+"' decimalBit="+$(":input[name='decimalBit']").val()+
							"' readonly oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'>");
				}else if($.fn.controlType == 10){
					//设计会签字段
					var loginer = $(":hidden[name='loginer']").val();
					$.fn.$control = $("<input type='text' name='"+name+"' code='"+code + "' value='"+loginer+
							"' readonly "+ "oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'>");
				}else if($.fn.controlType == 11){
					$.fn.$control = $("<input type='text' name='"+name+"' code='"+code + 
							"' placeholder='请选择员工' oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'>");
				}else if($.fn.controlType == 12){
					$.fn.$control = $("<select name='" + name + "' code='"+code+
							"' oncontextmenu='$.fn.contContextmenu(this, "+$.fn.controlType+")'><select>");
				}
				$.fn.$control.css("background-color", "yellow");
				$.fn.$control.css("width", $("input[name='width']").val() + "%");
				if($.fn.controlType != 2){
					$.fn.$control.css("height", "30");
				}
				$.fn.$control.attr("controlType", $.fn.controlType);
				$.fn.$selectedTds.append($.fn.$control);
			}else if(buttonText == "确定修改"){
				//得到需要修改的控件
				var $selectControl = $("[code='"+$.fn.selectControlCode+"']");
				$selectControl.attr("name", $("input[name='name']").val().trim());
				$selectControl.attr("code", $("input[name='code']").val().trim());
				$selectControl.css("width", $("input[name='width']").val() + "%");
				if($.fn.selectControlType < 3){
					$selectControl.attr("defaultValue", $(":input[name='defaultValue']").val().trim());
					$selectControl.val($(":input[name='defaultValue']").val());
					if($.fn.selectControlType == 2){
						$selectControl.prop("rows", $(":input[name='height']").val());
					}else{
						$selectControl.attr("placeholder", "请输入" + $("input[name='name']").val().trim());
					};
				}else if($.fn.selectControlType < 6){
					var strs = $("#textarea_selectItem").val().trim().split($.fn.space_reg);
					$selectControl.empty();
					if($.fn.selectControlType == 3){
						for(var i in strs){
							var $option = $("<option value='"+strs[i]+"'>"+strs[i]+"</option>");
							$selectControl.append($option);
						};
					}else if($.fn.selectControlType == 4){
						for(var i in strs){
							var $radio = $("<input type='radio' name='"+code+
									"' value='" + strs[i] + "'>" + strs[i] + "</input>");
							$radio.css("cursor", "pointer");
							$selectControl.append($radio);
							$selectControl.append("&nbsp;&nbsp;&nbsp;");
						};
					}else if($.fn.selectControlType == 5){
						for(var i in strs){
							var $checkbox = $("<input type='checkbox' name='"+code+
									"' value='" + strs[i] + "'>" + strs[i] + "</input>");
							$checkbox.css("cursor", "pointer");
							$selectControl.append($checkbox);
							$selectControl.append("&nbsp;&nbsp;&nbsp;");
						};
					};
				}else if($.fn.selectControlType < 9){
					var dateType = $(":radio[name='radio_dateType']:checked").val();
					$selectControl.prop("id", code);
					if(dateType == 0){
						$selectControl.removeAttr("dateType");
					}
					var now = new Date();
					if($.fn.selectControlType == 6){
						if(dateType == "0"){
							$selectControl.val(now.format("yyyy-MM-dd"));
						}else{
							$selectControl.val("");
							$selectControl.prop("placeholder", "请选择" + name);
							$selectControl.attr("dateType", "date");
						};
					}else if($.fn.selectControlType == 7){
						if(dateType == "0"){
							$selectControl.val(now.format("hh:mm:ss"));
						}else{
							$selectControl.val("");
							$selectControl.prop("placeholder", "请选择" + name);
							$selectControl.attr("dateType", "time");
						};
					}else if($.fn.selectControlType == 8){
						if(dateType == "0"){
							$selectControl.val(now.format("yyyy-MM-dd hh:mm:ss"));
						}else{
							$selectControl.val("");
							$selectControl.prop("placeholder", "请选择" + name);
							$selectControl.attr("dateType", "datetime");
						};
					};
				}else if($.fn.selectControlType == 9){
					$selectControl.attr("decimalBit", $(":input[name='decimalBit']").val());
				}
			}
			$("#window_addControl").window("close");
		},
		
		linkDeleteClick: function(){
			var $selectControl = $("[code='"+$.fn.selectControlCode+"']");
			//如果删除计算控件，给旧的参与计算控件去掉该计算控件的值
			if($selectControl.attr("controlType") == 9){
				var oldControlCodes = $selectControl.prop("placeholder").split($.fn.caculate_reg);
				if(!oldControlCodes[0]){
					oldControlCodes.shift();
				}
				if(!oldControlCodes[oldControlCodes.length - 1]){
					oldControlCodes.pop();
				}
				//给旧的参与计算控件去掉该计算控件的值
				for(var i = 0; i < oldControlCodes.length; i ++){
					if(!Number(oldControlCodes[i])){
						var $oldControl = $("[code='"+oldControlCodes[i]+"']");
						if($oldControl.attr("joincaculate").split("_").length == 1){
							$oldControl.attr("joincaculate", "");
						}else{
							if($oldControl.attr("joincaculate").indexOf($selectControl.attr("name")) == 0){
								$oldControl.attr("joincaculate", $oldControl.attr("joincaculate").replace($selectControl.attr("code") + "_", ""));
							}else if($oldControl.attr("joincaculate").indexOf($selectControl.attr("name")) > 0){
								$oldControl.attr("joincaculate", $oldControl.attr("joincaculate").replace("_" + $selectControl.attr("code") , ""));
							};
						};
					};
				}
				$selectControl.remove();
			}else if($selectControl.attr("joincaculate")){
				$.messager.alert("提示", "该控件是参与计算的控件，控件名称有：" + $selectControl.attr("joincaculate").split("_") +",不能删除！", "error");
			}else{
				$selectControl.remove();
			};
		},
		handleDateControl: function() {
			//处理当前日期控件
			var now = new Date();
			$.each($("[controlType='6']:enabled"), function() {
				if(!$(this).attr("dateType")){
					$(this).val(now.format("yyyy-MM-dd"));
				}
			});
			
			$.each($("[controlType='7']:enabled"), function() {
				if(!$(this).attr("dateType")){
					$(this).val(now.format("hh:mm:ss"));
				}
			});
			
			$.each($("[controlType='8']:enabled"), function() {
				if(!$(this).attr("dateType")){
					$(this).val(now.format("yyyy-MM-dd hh:mm:ss"));
				}
			});
		}
	});
});