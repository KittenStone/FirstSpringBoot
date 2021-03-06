layui.use(['form', 'layer', 'table'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    //列表
    var tableIns = table.render({
        elem: '#chooseLessonList',
        url: '/chooseLesson/teachChooseList',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 20, 30],
        limit: 10,
        id: "chooseLessonListTable",
        cols: [[
            {type: "checkbox", fixed: "left", width: 50},
            {field: 'cname', title: '课程名称', minWidth: 100, align: "center"},
            {field: 'price', title: '课程价格', minWidth: 100, align: "center"},

            {
                field: 'weeks',
                title: '上课周次',
                minWidth: 100,
                align: "center"
            }, {field: 'times', title: '上课时间', minWidth: 200, align: "center"},
            {field: 'stuName', title: '选课学生', minWidth: 100, align: "center"},

            {field: 'status', title: '状态', minWidth: 100, align: "center"}


            ]]
    });

    //搜索
    $(".search_btn").on("click", function () {
        table.reload("chooseLessonListTable", {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                searchKey: $(".searchKey").val()
            }
        })
    });

    //添加
    function addChooseLesson(edit) {
        var title = "添加";
        if (edit) {
            title = "编辑";
        }
        layui.layer.open({
            title: title,
            type: 2,
            area: ["500px", "500px"],
            content: "info.html",
            success: function (layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                if (edit) {
                    body.find("#id").val(edit.id);
                    body.find("#lesScheId").val(edit.lesScheId);
                    body.find("#chooseUser").val(edit.chooseUser);
                    body.find("#comment").val(edit.comment);
                    body.find("#status").val(edit.status);
                    form.render();
                }
                setTimeout(function () {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        })
    }

    $(".add_btn").click(function () {
        addChooseLesson();
    });

    $(".exchange_btn").click(function () {

        var edit;

        var checkStatus = table.checkStatus('chooseLessonListTable'),
            data = checkStatus.data;
        if (data.length > 0 && data.length==1) {
            edit=data[0];

        } else {
            layer.msg("请选择需要修改的记录,且只能选择一条");
        }


        layui.layer.open({
            title: '调换课',
            type: 2,
            area: ["500px", "300px"],
            content: "exchange_info.html",
            success: function (layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                if (edit) {
                    body.find("#id").val(edit.id);

                    form.render();
                }
                setTimeout(function () {
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        })


    });


    $(".edit_btn").click(function () {
        var checkStatus = table.checkStatus('chooseLessonListTable'),
            data = checkStatus.data;
        if (data.length > 0) {
            addChooseLesson(data[0]);
        } else {
            layer.msg("请选择需要修改的记录");
        }
    });

    //批量删除
    $(".delAll_btn").click(function () {
        var checkStatus = table.checkStatus('chooseLessonListTable'),
            data = checkStatus.data,
            idArr = [];
        if (data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的记录？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/chooseLesson/delBatch", {
                    idArr: idArr.toString()
                }, function (data) {
                    layer.close(index);
                    tableIns.reload();
                    if (data.data) {
                        layer.msg("删除成功！");
                    } else {
                        layer.msg(data.msg);
                    }
                })
            })
        } else {
            layer.msg("请选择需要删除的记录");
        }
    })

})