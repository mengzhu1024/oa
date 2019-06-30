$(function(){
    $("#uploadfile").fileinput({
        language: 'zh', //设置语言
        uploadUrl: "/doc/upload", //上传的地址
        //allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
        //额外参数
        uploadExtraData: function(previewId, index) {
            var data = {};
            data.disk = $("#select_disk").val();
            data.groupIds = [];
            var selectedNodes = ztreeObj.getCheckedNodes(true);
            selectedNodes.forEach(function (element) {
                if (element.level == 1) {
                    data.groupIds.push(element.id);
                }
            });
            return data;
        },
        uploadAsync: true, //默认异步上传
        showUpload: true, //是否显示上传按钮
        //显示移除按钮
        showRemove : true,
        //是否显示预览
        showPreview : true,
        //对指定格式的文件进行预览
        allowedPreviewTypes:['image', 'html', 'video', 'audio', 'flash'],
        showCaption: true,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式

        //是否显示拖拽区域
        dropZoneEnabled: true,
        /*minImageWidth: 50,
        minImageHeight: 50,//图片的最小高度
        maxImageWidth: 1000,//图片的最大宽度
        maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        minFileCount: 0,
        maxFileCount: 10,表示允许同时上传的最大文件个数*/
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
        //msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
    }).on("filebatchuploadcomplete", function(e, data) {
        $.messager.alert("提示", "文件上传成功！", "info");
        $("#uploadfile").fileinput('clear');
    });

    //定义一些变量
    var ztreeObj;
    var setting = {
        view: {
            dblClickExpand: true,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true
            }
        },
        check: {
            enable: true
        }
    };

    //加载部门树，构建ztree节点
    var departmentNodes = [];
    $.get("/dep/loginer-dep", function(result) {
        var department = result.data;
        var obj = {};
        //id、name、pId是必须属性
        obj.id = department.id;
        obj.name = department.name;
        obj.pId = "0";
        departmentNodes.push(obj);
        var groupList = department.groupList;
        for(var i in groupList){
            var obj2 = {};
            obj2.id = groupList[i].id;
            obj2.name = groupList[i].name;
            obj2.pId = obj.id;
            departmentNodes.push(obj2);
        }
        ztreeObj = $.fn.zTree.init($("#departmentGroupTree"), setting, departmentNodes);
    });

    //如果当前没有可用的盘符，用弹出框提示
    if($("#select_disk").children("option").length == 0){
        $("#uploadfile").prop("disabled", "disabled");
        $.messager.alert("提示……", "当前没有可用的盘符，请与管理员联系", "info");
    }
});