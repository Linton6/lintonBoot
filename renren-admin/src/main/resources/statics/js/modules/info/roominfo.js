$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'info/roominfo/listAll',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '编号', name: 'roomId', index: 'room_id', width: 80 },
			{ label: '描述', name: 'description', index: 'description', width: 80 },
			{ label: '管理员', name: 'userName', index: 'owner', width: 80 },
			{ label: '类别', name: 'tag', index: 'tag', width: 80
                ,formatter:function(value,option,row){
                    if(value === 'lab'){
                        return  '实验室';
                    } else if(value ==='meeting'){
                        return  '会议室';
                    }else if(value ==='floor'){
                        return  '楼层';
                    } else if(value ==='dorm'){
                        return  '宿舍';
                    } else {
                        return  value;
                    }
                }
                }, 	 // lab, meeting, dining, activity
			{ label: '建筑', name: 'building', index: 'building', width: 80, formatter:function(value,option,row){
			    if(value === 'QGY'){
			        return  '前工院';
                } else if(value ==='DNY'){
                    return  '东南院';
                }else if(value === 'ZDY'){
                    return  '中大院';
                } else {
                    return  value;
                }
                }},
			{ label: '楼层号', name: 'floor', index: 'floor', width: 60 },
			{ label: '房间号', name: 'room', index: 'room', width: 80 }, 			
			// { label: '创建者', name: 'createdBy', index: 'created_by', width: 70 },
			{ label: '创建时间', name: 'createdAt', index: 'created_at', width: 140 }
			// { label: '更新时间', name: 'updatedAt', index: 'updated_at', width: 70 },
			// { label: '更新人员', name: 'lastModifiedBy', index: 'last_modified_by', width: 70 }
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
		roomInfo: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.roomInfo = {};
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
                var url = vm.roomInfo.id == null ? "info/roominfo/save" : "info/roominfo/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.roomInfo),
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
                        url: baseURL + "info/roominfo/delete",
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
			$.get(baseURL + "info/roominfo/info/"+id, function(r){
                vm.roomInfo = r.roomInfo;
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