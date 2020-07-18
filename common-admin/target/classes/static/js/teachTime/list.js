layui.use(['form', 'layer', 'table'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    //列表
    var tableIns = table.render({
        elem: '#teachTimeList',
        url: '/teachTime/listData',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 20, 30],
        limit: 10,
        id: "teachTimeListTable",
        cols: [[
            {type: "checkbox", fixed: "left", width: 50},
            {field: 'teachNum', title: '上课节次', minWidth: 100, align: "center"}, {
                field: 'startTime',
                title: '开始时间',
                minWidth: 100,
                align: "center"
            }, {field: 'endTime', title: '结束时间', minWidth: 100, align: "center"}]]
    });

    //搜索
    $(".search_btn").on("click", function () {
        table.reload("teachTimeListTable", {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                searchKey: $(".searchKey").val()
            }
        })
    });

    //添加
    function addTeachTime(edit) {
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
                    body.find("#teachNum").val(edit.teachNum);
                    body.find("#startTime").val(edit.startTime);
                    body.find("#endTime").val(edit.endTime);
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
        addTeachTime();
    });

    $(".edit_btn").click(function () {
        var checkStatus = table.checkStatus('teachTimeListTable'),
            data = checkStatus.data;
        if (data.length > 0) {
            addTeachTime(data[0]);
        } else {
            layer.msg("请选择需要修改的记录");
        }
    });

    //批量删除
    $(".delAll_btn").click(function () {
        var checkStatus = table.checkStatus('teachTimeListTable'),
            data = checkStatus.data,
            idArr = [];
        if (data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的记录？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/teachTime/delBatch", {
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