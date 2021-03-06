<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<title>教学系统教师pc端</title>
<link href="${context}/css/base.css" rel="stylesheet" type="text/css">
<link href="${context}/js/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${context}/js/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${context}/js/jquery.min.js"></script>
<script type="text/javascript" src="${context}/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${context}/js/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${context}/js/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
	var workTable;
	$(function(){
		workTable = $('#workTable').bootstrapTable({
		    url: 'getWorkListData',
		    queryParams : function(params){
		    	params.termId = $('#termSelect').val();
		    	params.courseId = $('#courseSelect').val();
		    	return params;
		    },
		    striped : true,
		    toolbar : '#toolbar',
		    columns: [{
		        title: '序号',
		        align: 'center',
		        formatter : function (value, row, index){
		        	return index + 1;
		        }
		    },{
		        field: 'courseName',
		        halign: 'center',
		        title: '课程名称'
		    }, {
		        field: 'content',
		        halign: 'center',
		        title: '作业内容'
		    }, {
		        align: 'center',
		        valign: 'middle',
		        title: '状态',
		        formatter : function (value, row, index){
		        	if(row.publishType == '01'){
		        		return '<span class="label label-primary">编辑</span>';
		        	}
		        	else{
		        		return '<span class="label label-success">发布</span>';
		        	}
		        	//return '<span class="label label-danger">过期</span>';
		        }
		    }, {
		        title: '操作',
		        align: 'center',
		        formatter : function (value, row, index){
		        	return '<i style="cursor: pointer;" title="编辑" class="glyphicon glyphicon-edit"></i> &nbsp;'
		        		 + '<i style="cursor: pointer;" title="删除" class="glyphicon glyphicon-trash"></i>';
		        },
		        events : {
		        	'click .glyphicon-edit': function (e, value, row, index) {
			            window.location.href = 'viewEditWork?workId=' + row.workId;
			        },
			        'click .glyphicon-trash': function (e, value, row, index) {
			        	if(confirm("确定删除")){
			            	$.post('deleteWork',{workId : row.workId},function(data){
				            	workTable.bootstrapTable('refresh');
				            });
			            }
			        }
		        }
		    } ]
		});
	});
	function updateCourseSelect(termId){
		$.post('${context}/course/getCourseListData',{termId:termId},function(data){
			var list = data.data;
			$('#courseSelect').empty();
			$('#courseSelect').append('<option value="">全部</option>');
			$.each(list,function(i,n){
				$('#courseSelect').append('<option value="'+n.courseId+'">'+n.courseName+'</option>');
			});
		},'json')
	}
	function add(){
		window.location.href = 'viewAddWork?termId=' + $('#termSelect').val() + '&courseId=' + $('#courseSelect').val();
	}
</script>
</head>
<body>
	<div class="maincont">
        <div class="title"><span>作业列表</span></div>
        <div class="enter-message">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
            	<tbody>
                	<tr>
                    	<td width="12%" align="left" valign="middle"><label for="xueqi" style="line-height:36px; margin-bottom:0;">学期名称：</label></td>
                        <td width="30%">
                        	<select id="termSelect" class="select-control" onchange="updateCourseSelect(this.value)">                            
                                <#list termList as term> 
									<option value="${term.termId}" <#if term.termId == termId?default("")>selected="selected"</#if>>${term.termName}</option>
								</#list>   
                            </select>                                
                        </td>
                        <td width="12%" align="left" valign="middle"><label for="kecheng" style="line-height:36px; margin-bottom:0;">课程名称：</label></td>
                        <td width="36%">
                        	<select id="courseSelect" class="select-control">
                        		<option value="">全部</option>
                        		<#list courseList as course> 
									<option value="${course.courseId}" <#if course.courseId == courseId?default("")>selected="selected"</#if>>${course.courseName}</option>
								</#list>
                        	</select>                                
                        </td>
                        <td width="10%">
                        	<button type="button" class="btn btn-default btn-sm" onclick="workTable.bootstrapTable('refresh');">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
							</button>
						</td>
                    </tr>                        
                </tbody>
            </table>
            <div id="toolbar">
			    <button type="button" class="btn btn-default btn-sm" title="新增" onclick="add();">
			        <i class="glyphicon glyphicon-plus"></i> 新增
			    </button>
			</div>                          
            <table id="workTable"></table>
        </div>
    </div>
	<#include "/footer.ftl" />
</body>
</html>