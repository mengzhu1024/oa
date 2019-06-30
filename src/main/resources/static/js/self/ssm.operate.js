//定义操作对象
var operator = {
	valid: true,
	//做一个校验增强方法
	validExt: function(){
		
	},
	//是否自定义提交，默认为否
	userdefined: false,
	//自定义提交方法
	userdefinedSubmit: function(){
		
	},
	sureOperate: function(){
		operator.valid = true;
		$("span[id^='span_valid']").hide();
		$("[id^='valid_']").css("borderColor", "#CCCCCC");
		$.each($("[id^='valid_']"), function(){
			//获得校验类型
			var type = $(this).prop("id").split("_")[1];
			if(type == "text"){
				//校验文本
				var value = $(this).val().trim();
				$(this).val(value);
				if(value == ""){
					$(this).css("borderColor", "red");
					$(this).parent("td").next("td").children("span").show();
					operator.valid = false;
				}
			}else if(type == "select"){
				//校验下拉列表
				if(!$(this).val()){
					$(this).css("borderColor", "red");
					$(this).parent("td").next("td").children("span").show();
					operator.valid = false;
				}
			}else if(type == "number"){
				var value = $(this).val();
				if(!value.trim() || Number(value) != 0 && !Number(value)){
					$(this).css("borderColor", "red");
					$(this).parent("td").next("td").children("span").show();
					operator.valid = false;
				}
			}else if(type == "int"){
				//校验整数
				var value = $(this).val();
				if(parseInt(value) != value){
					$(this).css("borderColor", "red");
					$(this).parent("td").next("td").children("span").show();
					operator.valid = false;
				}
			}else if(type == "box"){
				var param = $(this).prop("id").split("_")[2];
				$(":hidden[name='"+param+"']").val($(this).prop("checked"));
			}
		});
		operator.validExt();
		if(operator.valid){
			if(operator.userdefined){
				operator.userdefinedSubmit();
			}else{
				$.post($("#form_operateEntity").prop("action"), $("#form_operateEntity").serialize(), function (result) {
					if (result.code == 0) {
                        $("#button_return").click();
					}else {
                        $.messager.alert("提示", result.msg, "error");
					}
                });
			}
		}
	}
};
$("document").ready(function(){
	//文本框禁用缓存
	$(":input[type=text]").prop("autocomplete", "off");
	
	$("#table_operateEntity tr").css("cursor", "default");
	$("#table_operateEntity tr").prop("align", "center");

	$("span[id^='span_valid']").css("font-size", "12px;");
	$("span[id^='span_valid']").css("color", "red");
	$("span[id^='span_valid']").hide();
	
	//添加box型校验的隐藏域
	$.each($("[id^='valid_box']"), function(){
		var param = $(this).prop("id").split("_")[2];
		$("#form_operateEntity").append($("<input type='hidden' name='"+param+"' value='"+$(this).prop("checked")+"'>"));
	});
	
	$("#button_sureOperate").click(operator.sureOperate);
	
	//封装batchAdd方法
	$("#button_batchAdd").click(function(){
		var valid = true;
		var $data = [];
		var url = $(this).attr("url");
		var returnUrl = $(this).attr("returnUrl");
		$("#table_batchAdd tbody tr td").css("borderColor", "#DDDDDD");
		var len = $("#table_batchAdd thead tr td[id]").length;
		
		//自定义js类，读取公共属性
		function SelfObject(){
			var t = this;
			$.each($(":hidden[name ^='common_']"), function() {
				t[$(this).prop("name").split("_")[1]] = $(this).val();
			});
		}
		$.each($("#table_batchAdd tbody tr"), function(i, n){
			var obj = new SelfObject();
			//设置id
			obj.id = uuid();
			for(var j = 0; j < len; j ++){
				var $td = $(this).children("td:eq("+j+")");
				var $htd = $("#table_batchAdd thead td:eq("+j+")");
				var prop = $htd.prop("id").split("_")[1];
				var value = $td.text().trim();
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
					}else if(type == "select"){
						//校验下拉列表
						value = $td.children("select").val();
						if(!value){
							$td.css("borderColor", "red");
							valid = false;
						}
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
				url: url,
				contentType: "application/json;charset=utf-8",
				data: $data,
				success:function(){
					if(returnUrl.indexOf("?") < 0){
						location.href = returnUrl + "?pageNum="+ $(":hidden[name='pageNum']").val();
					}else{
						location.href = returnUrl + "&pageNum="+ $(":hidden[name='pageNum']").val();
					}
				}
			});
		}else{
			$.messager.alert("提示", "数据格式不正确", "error");
		}
	});
	
	//批量添加表格操作
	$("#table_batchAdd tr").css("cursor", "default");
	
	var $tr = $("#table_batchAdd tbody tr:first").clone();
	$("#button_addRow").click(function(){
		$("#table_batchAdd").append($tr);
		$tr = $tr.clone();
	});
	
	//日期格式文本框
	$.each($("[datetype]"), function(i, n){
		laydate.render({
			trigger: "click",
			elem: "#" + $(this).prop("id"),
			type: $(this).attr("datetype")
		});
	});
	
	//返回按钮事件
	$("#button_return").click(function() {
		var url = $(this).attr("url");
		if(url.indexOf("?") > 0){
			location.href = url + "&pageNum=" + $(":hidden[name='pageNum']").val();
		}else{
			location.href = url + "?pageNum=" + $(":hidden[name='pageNum']").val();
		}
	});
});

//删除一行
function deleteRow(button_delete){
	$(button_delete).parent("td").parent("tr").remove();
}