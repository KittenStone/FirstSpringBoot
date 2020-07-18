layui.use(['form', 'layer', 'table'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    //列表
    var tableIns = table.render({
        elem: '#payinfoList',
        url: '/payinfo/listData',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 20, 30],
        limit: 10,
        id: "payinfoListTable",
        cols: [[
            {type: "checkbox", fixed: "left", width: 50},

            {field: 'name', title: '支付用户名', minWidth: 100, align: "center"},
            {
                field: 'payamount',
                title: '支付金额',
                minWidth: 100,
                align: "center"
            }, {
                field: 'paytime',
                title: '支付时间',
                minWidth: 100,
                align: "center"
            }]]
    });

    //搜索
    $(".search_btn").on("click", function () {
        table.reload("payinfoListTable", {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                searchKey: $(".searchKey").val()
            }
        })
    });

    //添加
    function addPayinfo(edit) {
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
                    body.find("#studentid").val(edit.studentid);
                    body.find("#adminuserid").val(edit.adminuserid);
                    body.find("#paymethod").val(edit.paymethod);
                    body.find("#payamount").val(edit.payamount);
                    body.find("#payaccount").val(edit.payaccount);
                    body.find("#paytime").val(edit.paytime);
                    body.find("#confirmtime").val(edit.confirmtime);
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
        addPayinfo();
    });

    $(".edit_btn").click(function () {
        var checkStatus = table.checkStatus('payinfoListTable'),
            data = checkStatus.data;
        if (data.length > 0) {
            addPayinfo(data[0]);
        } else {
            layer.msg("请选择需要修改的记录");
        }
    });

    //批量删除
    $(".delAll_btn").click(function () {
        var checkStatus = table.checkStatus('payinfoListTable'),
            data = checkStatus.data,
            idArr = [];
        if (data.length > 0) {
            for (var i in data) {
                idArr.push(data[i].id);
            }
            layer.confirm('确定删除选中的记录？', {icon: 3, title: '提示信息'}, function (index) {
                $.get("/payinfo/delBatch", {
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