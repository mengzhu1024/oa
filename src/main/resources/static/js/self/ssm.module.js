//定义分页对象
var pager = {
	//表格的列数
	colnum: null,
	
	//可编辑的列
	editcol: null,
	
	//当前页
	pageNum: null,
	
	//总页数
	pageCount: null,
	
	//表格第一行数据
	$firstTr: null,
	
	showPageExt: function(){
	},
	
	showPage: function(){
		var pageNum = pager.pageNum;
		var pageCount = pager.pageCount;
		$("#link_page1").text(pageNum-1);
		$("#link_page2").text(pageNum);
		$("#link_page3").text(pageNum+1);
		$("#ul_page li").addClass("disabled");
		$("#li_page2").removeClass("disabled");
		if(pageCount == 2){
			//如果只有两页
			if(pageNum==1){
				$("#li_page3").removeClass("disabled");
				$("#li_backward").removeClass("disabled");
				$("#li_last").removeClass("disabled");
			}else{
				$("#li_page1").removeClass("disabled");
				$("#li_forward").removeClass("disabled");
				$("#li_first").removeClass("disabled");
			}
		}else if(pageCount == 3){
			//如果只有三页
			if(pageNum == 1){
				$("#li_page3").removeClass("disabled");
				$("#hide_li2").removeClass("disabled");
				$("#li_backward").removeClass("disabled");
				$("#li_last").removeClass("disabled");
			}else if(pageNum == 2){
				$("#li_page1").removeClass("disabled");
				$("#li_forward").removeClass("disabled");
				$("#li_first").removeClass("disabled");
				$("#li_page3").removeClass("disabled");
				$("#li_backward").removeClass("disabled");
				$("#li_last").removeClass("disabled");
			}else{
				$("#li_page1").removeClass("disabled");
				$("#hide_li1").removeClass("disabled");
				$("#li_forward").removeClass("disabled");
				$("#li_first").removeClass("disabled");
			}
		}else if(pageCount>3){
			//如果超过3页
			$("#ul_page li").removeClass("disabled");
			//如果当前页是第一页
			if(pageNum==1){
				$("#li_first").addClass("disabled");
				$("#li_forward").addClass("disabled");
				$("#hide_li1").addClass("disabled");
				$("#li_page1").addClass("disabled");
			}
			//如果当前页是第二页
			else if(pageNum==2){
				$("#hide_li1").addClass("disabled");
			}
			//如果不是第二页且小于倒数第二页
			else if(pageNum<pageCount-1){
				//没有任何操作
			}else if(pageNum==pageCount-1){
				$("#hide_li2").addClass("disabled");
			}else if(pageNum==pageCount){
				$("#li_page3").addClass("disabled");
				$("#hide_li2").addClass("disabled");
				$("#li_backward").addClass("disabled");
				$("#li_last").addClass("disabled");
			}
		}
		//分页后这里设置特殊格式。
		$("#table_entity").css("cursor", "default");
		$("#table_entity tr").prop("align", "center");
		
		//表格第一列选中效果
		$("#table_entity tbody tr td:nth-child("+pager.colnum+"n+1)").click(function(){
			var $tr = $(this).parent("tr");
			var $checkbox = $tr.children("td:first").children(":checkbox");
			$checkbox.prop("checked", !$checkbox.prop("checked"));
			var editcol = pager.editcol;
			if($checkbox.prop("checked")){
				$tr.addClass("color1");
				if(editcol){
					var editcols = editcol.split("_");
					for(var i in editcols){
						var $td = $tr.children("td:eq("+editcols[i]+")");
						if($td.children(":checkbox").length == 0){
							$td.prop("contenteditable", true);
						}else{
							$td.children(":checkbox").removeAttr("disabled");
						}
					}
				}
			}else{
				$tr.removeClass("color1");
				if(editcol){
					var editcols = editcol.split("_");
					for(var i in editcols){
						var $td = $tr.children("td:eq("+editcols[i]+")");
						if($td.children(":checkbox").length == 0){
							$td.prop("contenteditable", false);
						}else{
							$td.children(":checkbox").prop("disabled", "disabled");
						}
					}
				}
			}
		});
		
		$(":checkbox[name='box_id']").click(function(){
			$(this).prop("checked", !$(this).prop("checked"));
		});
		
		//重新绑定click事件
		$("li[id^='li_']:not(#li_page2)").unbind("click", pager.pageLinkClick);
		$("li[id^='li_']:not(#li_page2):not(.disabled)").click(pager.pageLinkClick);
		pager.showPageExt();
	},
	
	getSearchData: function() {
		var $data = $("#form_select").serialize();
		$data += "&pageSize=" + $("#select_pageSize").val();
		//拼接条件查询
		var i = 0;
		$.each($("[param][relation]"), function() {
			var value = $(this).val().trim().replace("'", "");
			if(value){
				$data += "&criteria[" + i + "].param=" + $(this).attr("param") +
				"&criteria[" + i + "].relation=" + $(this).attr("relation") +
				"&criteria[" + i + "].value=" + value;
				if($(this).attr("injection")){
					$data += "&criteria[" + i + "].injection=false";
				}
				i ++;
			}
		});
		return $data;
	},
	
	submitForm: function(){
		var $data = $("#form_select").serialize();
		$data += "&pageSize=" + $("#select_pageSize").val();
		//拼接条件查询
		var i = 0;
		$.each($("[param][relation]"), function() {
			var value = $(this).val().trim().replace("'", "");
			if(value){
				$data += "&criteria[" + i + "].param=" + $(this).attr("param") +
				"&criteria[" + i + "].relation=" + $(this).attr("relation") +
				"&criteria[" + i + "].value=" + value;
				if($(this).attr("injection")){
					$data += "&criteria[" + i + "].injection=false";
				}
				i ++;
			}
		});
		$.ajax({
			type:"post",
			url: $("#form_select").prop("action"),
			data: $data,
			success: function(result){
				var code = result.code;
				if(code != 0) {
                    $.messager.alert("提示", result.msg, "error");
                    return;
				}
				var pageCriteria = result.data;
				if($(pageCriteria).find("#form_login").html() != null){
					//如果返回的是登录页面代码，表示当前session已失效，则跳转到登录页面
					location.href = "/emp/logout?loginInfo='登录已过期，请重新登录'";
				}else{
					$("#table_entity tbody").empty();
					var entityList = pageCriteria.entityList;
					var $htds = $("#table_thead tr:last td");
					for(var i = 0; i < entityList.length; i ++){
						//复制一行，填充数据，插入表格
						var $tr = $(pager.$firstTr).clone(true);
						$.each($htds, function(j, n){
							if($(this).prop("id")){
								var pro = $(this).prop("id").split("_")[1];
								var $td = $tr.children("td:eq("+j+")");
								//如果是index，则表格中的文本是数字序列
								if(pro == "index"){
									$td.text(i + 1);
								}else{
									//如果是属性，则链式搜索找到该属性的值
									var pros = pro.split(".");
									var value = entityList[i][pros[0]];
									for(var k = 1; k < pros.length; k ++){
										value = value[pros[k]];
									}

									//处理title
									if($(this).prop("title")){
										$td.prop("title", (entityList[i][pro]));
									}

									//字符串截取
									var len = parseInt($(this).attr("len"));
									if(len){
										value = value.length < len? value: value.substring(0, len - 1) + "...";
									}

									//处理分支表达式
									if($(this).attr("switch")){
										var branches = $(this).attr("switch").split(";");
										for(var k in branches){
											if(value == branches[k].split(":")[0]){
												value = branches[k].split(":")[1];
											}
										}
									}

									//处理时间数据
									if($(this).attr("formatPattern") && value){
										value = new Date(value).format($(this).attr("formatPattern"));
									}

									//处理带有input的单元格
									if($td.children(":input").length == 0){
										$td.text(value);
                                    }else{
										if($(this).attr("valid") == "valid_box"){
											//如果校验类型是box，给复选框设置选中状态
											$td.children(":checkbox").prop("checked", entityList[i][pro]);
										}else{
											//根据input的name属性进行赋值
											var $input = $td.children(":input");
											$.each($input, function(){
												$(this).val(entityList[i][$(this).prop("name").split("_")[1]]);
											});
											//如果单元格没有box。填充文本和被冲掉的input
											if($td.children(":checkbox").length == 0){
												$td.text(value);
												$td.append($input);
											}
										}
									}
								}
							}
						});
						$("#table_entity tbody").append($tr);
					}
					$("#span_rowCount").text(pageCriteria.rowCount);
					$("#span_pageNum").text(pageCriteria.pageNum);
					//根据查询结果给pager对象赋值
					pager.pageNum = pageCriteria.pageNum;
					$(":hidden[name='pageNum']").val(pager.pageNum);
					$("#span_pageCount").text(pageCriteria.pageCount);
					pager.pageCount = pageCriteria.pageCount;
					$("#input_pageNum").val(pageCriteria.pageNum);
					pager.showPage();
				}
			}
		});
	},

	pageLinkClick: function(){
		var text = $(this).text();
		var pageNum = pager.pageNum;
		if(text == "首页"){
			pageNum = 1;
		}else if(text == "上一页"){
			pageNum --;
		}else if(text == "下一页"){
			pageNum ++;
		}else if(text == "尾页"){
			pageNum = pager.pageCount;
		}else{
			pageNum = text;
		}
		$(":hidden[name='pageNum']").val(pageNum);
		pager.submitForm();
	},

	pageJumpClick: function(){
		var pageNum = pager.pageNum;
		var jumpPageNum = parseInt($("#input_pageNum").val());
		if (jumpPageNum < 1 || jumpPageNum > pager.pageCount) {
			$.messager.alert("提示", "没有该页面", "info");
			return false;
		}
		if(pageNum != jumpPageNum){
			pageNum = jumpPageNum;
			pager.submitForm();
		}
	}
};
$("document").ready(function(){
	//设置表格样式
	$("#table_thead").css("margin-bottom", "0px");
	$("#div_entity").css("width", $("#table_thead").width());
	$("#div_entity").css("max-height", window.parent.document.getElementById("tabs").offsetHeight * 0.65);
	$.each($("#table_thead tr:last td:not(:last)"), function(i, n) {
		$("#table_entity tbody tr:first").children("td:eq("+i+")").css("width", $(n).css("width"));
	});

	//初始化pager变量
	pager.colnum = parseInt($("#table_thead tr:last td").length);
	pager.editcol = $("#table_thead").attr("editcol");
	//获取当前页
	pager.pageNum = parseInt($(":hidden[name='pageNum']").val()),
	//复制tbody的第一行及绑定的事件
	pager.$firstTr = $("#table_entity tbody tr:first").clone(true);

	//给pageSize下拉框绑定事件
	$("#select_pageSize").change(function() {
		$(":hidden[name='pageSize']").val($(this).val());
		pager.submitForm();
	});

	//跳转查询
	$("#button_jump").click(pager.pageJumpClick);

	$("#input_pageNum").keyup(function(){
		if(parseInt($(this).val()) != $(this).val()){
			$(this).val("1");
		}
	});

	//日期格式文本框
	$.each($("[datetype]"), function(i, n){
		var id = $(this).prop("id");
		laydate.render({
			trigger: "click",
			elem: "#" + id,
			type: $(this).attr("datetype"),
			done: function(value, date, endDate){
				if(id.indexOf("search_") == 0){
					document.getElementById(id).value = value;
					pager.submitForm();
				}
			}
		});
	});

	//条件查询
	$("[id ^='search_']").change(function(){
		$(this).val($(this).val().replace(space_reg, "").replace("'", ""));
		pager.submitForm();
	});

	//执行一次查询
	pager.submitForm();

	//功能模块
	//封装添加方法
	$("#button_add").click(function() {
		var url = $(this).attr("url");
		if(url.indexOf("?") > 0){
			location.href = url + "&pageNum=" + pager.pageNum;
		}else{
			location.href = url + "?pageNum=" + pager.pageNum;
		}
	});

	//封装批量添加方法
	$("#button_batchAdd").click(function() {
		var url = $(this).attr("url");
		if(url.indexOf("?") > 0){
			location.href = url + "&pageNum=" + pager.pageNum;
		}else{
			location.href = url + "?pageNum=" + pager.pageNum;
		}
	});

	//封装批量修改方法
	$("#button_batchUpdate").click(function(){
		var $boxes = $(":checkbox[name='box_id']:checked");
		if($boxes.length == 0){
			$.messager.alert("提示", "请选中一行数据", "info");
		}else{
			var $data = [];
			var valid = true;
			$("#table_entity tbody tr td").css("borderColor", "#DDDDDD");
			$.each($boxes, function(i, n){
				var $tr = $(this).parent("td").parent("tr");
				var obj = new Object();
				obj.id = $(this).val();
				var editcols = $("#table_thead").attr("editcol").split("_");
				for(var j in editcols){
					var $td = $tr.children("td:eq("+editcols[j]+")");
					var $htd = $("#table_thead td:eq("+editcols[j]+")");
					var prop = $htd.prop("id").split("_")[1];
					var value = $td.text();
					//如果数据需要校验则进行校验
					if($htd.attr("valid")){
						var type = $htd.attr("valid").split("_")[1];
						if(type == "text"){
							value = value.trim();
							//校验文本
							if(value == ""){
								$td.css("borderColor", "red");
								valid = false;
							}
						}else if(type == "number"){
							//校验小数
							if(!value.trim() || Number(value) != 0 && !Number(value)){
								$td.css("borderColor", "red");
								valid = false;
							}
						}else if(type == "int"){
							//校验整数
							if(parseInt(value) != value){
								$td.css("borderColor", "red");
								valid = false;
							}
						}else if(type == "box"){
							//如果是复选框，则把赋值为true、false
							value = $td.children(":checkbox").prop("checked");
						}
					}
					//拼接传递参数
					obj[prop] = value;
				}
				$data.push(obj);
			});
			//对象转换为json格式
			$data = JSON.stringify($data);
			if(valid){
				$.ajax({
					type: "post",
					url: $(this).attr("url"),
					contentType: "application/json;charset=utf-8",
					data: $data,
					success:function(result){
						if(result.code == 200){
							$.messager.alert("提示", "权限不足", "error");
						}else if (result.code == 1) {
							$.messager.alert("提示", "系统异常", "error");
						}
						else{
							pager.submitForm();
						}
					}
				});
			}else{
				$.messager.alert("提示", "数字格式不正确", "info");
			}
		}
	});

	//封装批量删除方法
	$("#button_batchDelete").click(function(){
		var url = $(this).attr("url");
		var $boxes = $(":checkbox[name='box_id']:checked");
		if($boxes.length == 0){
			$.messager.alert("提示", "请选中一行数据", "info");
		}else{
			$.messager.confirm("删除提示……", "确定删除吗？", function(sure){
				if(sure){
					var $data = [];
					$.each($boxes, function(i, n) {
						var obj = new Object();
						obj.id = $(this).val();
						//读取删除时候需要记录的内容
						$.each($(this).parent("td").children(":hidden[monitor]"), function() {
							var prop = $(this).prop("name").split("_")[1];
							obj[prop] = $(this).val();
						});
						$data.push(obj);
					});
					//对象转换为json格式
					$data = JSON.stringify($data);
					$.ajax({
						type: "post",
						url: url,
						contentType: "application/json;charset=utf-8",
						data: $data,
						success:function(result){
							if(result.code == 200){
								$.messager.alert("提示", "权限不足", "error");
							}else if (result.code == 1) {
								$.messager.alert("提示", "系统异常", "error");
							}
							else{
								pager.submitForm();
							}
						}
					});
				}
			});
		}
	});

	//刷新方法
	$("#button_refresh").click(function(){
		pager.submitForm();
	});
});

//封装表格末尾的操作按钮方法
//封装编辑方法
function buttonEditClick(button_edit, url) {
	var id = $(button_edit).parent("td").parent("tr").children("td:first").children(":hidden[name='hidden_id']").val();
	if(url.indexOf("?") > 0){
		location.href = url + "&id=" + id + "&pageNum=" + pager.pageNum;
	}else{
		location.href = url + "?id=" + id + "&pageNum=" + pager.pageNum;
	}
}

//封装delete方法
function buttonDeleteClick(button_delete, url){
	$.messager.confirm("删除提示……", "确定删除吗？", function(sure){
		if(sure){
			var $td = $(button_delete).parent("td").parent("tr").children("td:first");
			var $data = [];
			var obj = new Object();
			obj.id = $td.children(":hidden[name='hidden_id']").val();
			//读取删除时候需要记录的内容
			$.each($td.children(":hidden[monitor]"), function() {
				var prop = $(this).prop("name").split("_")[1];
				obj[prop] = $(this).val();
			});
			$data.push(obj);
			//对象转换为json格式
			$data = JSON.stringify($data);
			$.ajax({
				type: "post",
				url: url,
				contentType: "application/json;charset=utf-8",
				data: $data,
				success:function(result){
					if(result.code == 200){
						$.messager.alert("提示", "权限不足", "error");
					}else if (result.code == 1) {
						$.messager.alert("提示", "系统异常", "error");
					}
					else{
						pager.submitForm();
					}
				}
			});
		}
	});
}
var space_reg = /\s+/gi;