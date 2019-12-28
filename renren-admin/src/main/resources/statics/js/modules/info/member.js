$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'info/member/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 30, key: true },
			{ label: '姓名', name: 'username', index: 'username', width: 60 },
			{ label: '学号', name: 'stuid', index: 'stuid', width: 60 },
			{ label: '注册状态', name: 'status', index: 'status', width: 60, formatter:function(value,option,row){
			    return value === 0 ?
                    '<span class="label label-danger">未激活</span>' :
                    '<span class="label label-success">已激活</span>';
                } },
			{ label: '手机号', name: 'telephone', index: 'telephone', width: 80 }, 			
			{ label: '用户等级', name: 'rank', index: 'rank', width: 80 , formatter:function(value,option,row){
                    if(value === 2){
                        return  '普通用户';
                    } else if(value ===1){
                        return  '维护员';
                    }else if(value ===0){
                        return  '超级管理员';
                    } else {
                        return  value;
                    }
                } },
			// { label: '密码hash值', name: 'password', index: 'password', width: 80 },
			// { label: '个推 cid', name: 'cid', index: 'cid', width: 80 },
			// { label: 'help_token', name: 'helpToken', index: 'help_token', width: 80 },
			{ label: '注册时间', name: 'createTime', index: 'create_time', width: 110 },
			{ label: '最近登录', name: 'lastLoginTime', index: 'last_login_time', width: 110 }
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
	    queryKey: '',
		showList: true,
		title: null,
		member: {}
	},
	methods: {
        query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.member = {};
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
                var url = vm.member.id == null ? "info/member/save" : "info/member/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.member),
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
                        url: baseURL + "info/member/delete",
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
			$.get(baseURL + "info/member/info/"+id, function(r){
                vm.member = r.member;
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