$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'info/roomorder/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '房间编号', name: 'roomId', index: 'room_id', width: 80 }, 			
			// { label: '预订的用户 id', name: 'userId', index: 'user_id', width: 80 },
			{ label: '预定者姓名', name: 'username', index: 'username', width: 80 },
			{ label: '预订原因', name: 'theme', index: 'theme', width: 80 }, 			
			{ label: '审核状态', name: 'status', index: 'status', width: 80 ,formatter:function (value) {
			    if (value === 0){
			        return '<span class="label label-default ">待审核</span>'
                } else if (value === 1){
                    return '<span class="label label-success">审核通过</span>'
                } else if (value === 2){
                    return '<span class="label label-danger ">审核未过</span>'
                } else if (value === 3){
                    return '<span class="label label-warning">已过期</span>'
                }

                }},
			{ label: '类型', name: 'tag', index: 'tag', width: 80 },
			{ label: '审核员', name: 'auditorName', index: 'auditor_name', width: 80 },
			{ label: '预定开始时间', name: 'startTime', index: 'start_time', width: 80 }, 			
			{ label: '预定结束时间 ', name: 'endTime', index: 'end_time', width: 80 }, 			
			{ label: '创建时间', name: 'createdAt', index: 'created_at', width: 80 }, 			
			{ label: '更新时间', name: 'updatedAt', index: 'updated_at', width: 80 }, 			
			// { label: 'createdBy', name: 'createdBy', index: 'created_by', width: 80 },
			{ label: '更新', name: 'lastModifiedBy', index: 'last_modified_by', width: 80 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
        queryKey:'',
        showList: true,
		title: null,
		roomOrder: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.roomOrder = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
		    $('#btnSaveOrUpdate').button('loading').delay(1000).queue(function() {
                var url = vm.roomOrder.id == null ? "info/roomorder/save" : "info/roomorder/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.roomOrder),
                    success: function(r){
                        if(r.code === 0){
                             layer.msg("操作成功", {icon: 1});
                             vm.reload();
                             $('#btnSaveOrUpdate').button('reset');
                             $('#btnSaveOrUpdate').dequeue();
                        }else{
                            layer.alert(r.msg);
                            $('#btnSaveOrUpdate').button('reset');
                            $('#btnSaveOrUpdate').dequeue();
                        }
                    }
                });
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			var lock = false;
            layer.confirm('确定要删除选中的记录？', {
                btn: ['确定','取消'] //按钮
            }, function(){
               if(!lock) {
                    lock = true;
		            $.ajax({
                        type: "POST",
                        url: baseURL + "info/roomorder/delete",
                        contentType: "application/json",
                        data: JSON.stringify(ids),
                        success: function(r){
                            if(r.code == 0){
                                layer.msg("操作成功", {icon: 1});
                                $("#jqGrid").trigger("reloadGrid");
                            }else{
                                layer.alert(r.msg);
                            }
                        }
				    });
			    }
             }, function(){
             });
		},
		getInfo: function(id){
			$.get(baseURL + "info/roomorder/info/"+id, function(r){
                vm.roomOrder = r.roomOrder;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'queryKey': vm.queryKey},
                page:page
            }).trigger("reloadGrid");
		}
	}
});