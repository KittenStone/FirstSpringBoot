layui.use(['form','layer'],function(){
    var form = layui.form
    layer = parent.layer === undefined ? layui.layer : top.layer,
    $ = layui.jquery;


    //选择课程
    $.post("/course/selectListData",{

    },function(data){
        var roleList = data.data;
        roleList.forEach(function(e){
            $("#courseSelect").append("<option value='"+e.cid+"'>"+e.cname+"</option>");
        });
        $("#courseSelect").val($("#courseId").val());//默认选中
        form.render('select');//刷新select选择框渲染
    });



    //选择老师
    $.post("/user/selectListData",{
        roleId : 4
    },function(data){
        var roleList = data.data;
        roleList.forEach(function(e){
            $("#teacherSelect").append("<option value='"+e.id+"'>"+"教师-"+e.name+"</option>");
        });
        $("#teacherSelect").val($("#teacherId").val());//默认选中
        form.render('select');//刷新select选择框渲染
    });


    //选择周次
    $.post("/teachWeek/selectListData",{

    },function(data){
        var roleList = data.data;
        roleList.forEach(function(e){
            $("#weekSelect").append("<option value='"+e.id+"'>第 "+e.weeks+" 周</option>");
        });
        $("#weekSelect").val($("#weekId").val());//默认选中
        form.render('select');//刷新select选择框渲染
    });


    //选择节次
    $.post("/teachTime/selectListData",{

    },function(data){
        var roleList = data.data;
        roleList.forEach(function(e){
            $("#timeSelect").append("<option value='"+e.id+"'>第 "+e.teachNum+" 节 "+e.startTime+" - "+e.endTime+" </option>");
        });
        $("#timeSelect").val($("#timeId").val());//默认选中
        form.render('select');//刷新select选择框渲染
    });


    form.on("submit(addLessonSchedule)",function(data){
        //弹出loading
        var index = top.layer.msg('数据保存中，请稍候...',{icon: 16,time:false,shade:0.8});
        if ($("#id").val()==="") {
            $.post("/lessonSchedule/add",data.field,function(res){
                if (res.data){
                    layer.close(index);
                    layer.msg("调换课成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                } else {
                    layer.msg(res.msg);
                }
            })
        } else {
            $.post("/chooseLesson/exchangeLesson",data.field,function(res){
                if (res.data){
                    layer.close(index);
                    layer.msg("调换课成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                } else {
                    layer.msg(res.msg);
                }
            })
        }
        return false;
    })

})