layui.use(['form','layer','table'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    //列表
    var tableIns = table.render({
        elem: '#courseList',
        url : '/course/listData',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,20,30],
        limit : 10,
        id : "courseListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
			            			                        {field: 'cname', title: '课程名称', minWidth:100, align:"center"},             			                        {field: 'subid', title: '学科名称', minWidth:100, align:"center"},             			                        {field: 'lessonnum', title: '节次号', minWidth:100, align:"center"},             			                        {field: 'price', title: '价格', minWidth:100, align:"center"},             			                        {field: 'comment', title: '备注', minWidth:100, align:"center"}            			        ]]
    });

    //搜索
    $(".search_btn").on("click",function(){
        table.reload("courseListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                searchKey: $(".searchKey").val()
            }
        })
    });

    //添加
    function addCourse(edit){
        var title = "添加";
        if (edit){
            title = "编辑";
        }
        layui.layer.open({
            title : title,
            type : 2,
            area : ["500px","500px"],
            content : "info.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
					                    body.find("#cid").val(edit.cid);
					                    body.find("#cname").val(edit.cname);
					                    body.find("#subid").val(edit.subid);
					                    body.find("#lessonnum").val(edit.lessonnum);
					                    body.find("#price").val(edit.price);
					                    body.find("#comment").val(edit.comment);
					                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
    }

    $(".add_btn").click(function(){
        addCourse();
    });

    $(".edit_btn").click(function(){
        var checkStatus = table.checkStatus('courseListTable'),
            data = checkStatus.data;
        if(data.length > 0){
            addCourse(data[0]);
        }else{
            layer.msg("请选择需要修改的记录");
        }
    });

    //批量删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('courseListTable'),
            data = checkStatus.data,
            idArr = [];
        if(data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的记录？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/course/delBatch",{
                    idArr : idArr.toString()
                },function(data){
                    layer.close(index);
                    tableIns.reload();
                    if (data.data){
                        layer.msg("删除成功！");
                    } else {
                        layer.msg(data.msg);
                    }
                })
            })
        }else{
            layer.msg("请选择需要删除的记录");
        }
    })

})