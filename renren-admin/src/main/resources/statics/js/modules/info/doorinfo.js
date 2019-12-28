$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'info/doorinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '房间ID', name: 'roomId', index: 'room_id', width: 80 },
			{ label: '门编号', name: 'doorId', index: 'door_id', width: 80 }, 			
			{ label: '蓝牙MAC地址', name: 'bltMac', index: 'BLT_MAC', width: 80 }, 			
			{ label: '管理员', name: 'userName', index: 'userName', width: 80 },
			// { label: '上次密码', name: 'prePwd', index: 'pre_pwd', width: 80 },
			// { label: '下次密码', name: 'nextPwd', index: 'next_pwd', width: 80 },
			{ label: '门的描述', name: 'description', index: 'description', width: 80 }, 			
			// { label: '更新时间', name: 'updatedAt', index: 'updated_at', width: 80 },
			// { label: '创建时间', name: 'createdAt', index: 'created_at', width: 80 },
			// { label: '', name: 'createdBy', index: 'created_by', width: 80 },
			// { label: '', name: 'lastModifiedBy', index: 'last_modified_by', width: 80 },
            { label: '二维码', name: 'qrCode', index: 'qr_code', width: 80 }
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
		doorInfo: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.doorInfo = {};
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
                var url = vm.doorInfo.id == null ? "info/doorinfo/save" : "info/doorinfo/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.doorInfo),
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
                        url: baseURL + "info/doorinfo/delete",
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
			$.get(baseURL + "info/doorinfo/info/"+id, function(r){
                vm.doorInfo = r.doorInfo;
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