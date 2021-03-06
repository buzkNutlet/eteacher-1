<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<title>教学系统教师pc端</title>
<link href="${context}/css/base.css" rel="stylesheet" type="text/css">
<link href="${context}/js/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${context}/js/jquery.min.js"></script>
<script type="text/javascript" src="${context}/js/turingLib/validator.js"></script>
<script type="text/javascript" src="${context}/js/json2form.js"></script>
<script type="text/javascript" src="${context}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var editFlag = '${editFlag?default("")}';
	$(function(){
		$('#noticeForm').validatorNormalInit(prepare);
		$('#title').validatorEmpty('通知标题');
		$('#content').validatorEmpty('通知内容');
		$('#courseId').validatorEmpty('课程');
		function prepare(){
			if($('#publishType2').is(':checked')){
				if($('#publishTime').val() == ''){
					alert('发布时间不能为空');
					return false;
				}
			}
			return true;
		}
		init();
	});
	function init(){
		if(editFlag){
			$.post('getWorkData',{workId:'${workId?default("")}'},function(data){
				$('#noticeForm').json2form({data:data});
				if(data.publishType == '01'){
					$('#publishType1').prop('checked',true);
				}
				else if(data.publishType == '03'){
					$('#publishTime').show();
				}
			},'json');
		}
	}
</script>
</head>
<body>
	<div class="maincont">
        <div class="title"><span>通知信息</span></div>
        <div class="enter-message">
            <form id="noticeForm" method="post" action="saveNotice">
            	<input type="hidden" id="isDraft" name="isDraft" value="" />
            	<input type="hidden" name="noticeId" value="${noticeId?default("")}" />
            	<div class="message-group">
                    <div class="message-left">通知标题：</div>
                    <div class="message-right">
                        <input id="title" name="title" maxlength="40" type="text" class="mess-control" />
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">通知内容：</div>
                    <div class="message-right">
                    	<textarea id="content" name="content" placeholder="通知内容" style="margin-bottom:10px;"></textarea>
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">选择课程：</div>
                    <div class="message-right">                	
                        <select id="courseId" name="courseId">
                            <option value="">--请选择课程--</option>
                            <#list courseList as course> 
								<option value="${course.courseId}" <#if course.courseId == courseId?default("")>selected="selected"</#if>>${course.courseName}</option>
							</#list>
                        </select>
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">发布方式：</div>
                    <div class="message-right">
                    	<div class="radio">
						  <label>
						    <input type="radio" id="publishType1" name="publishType" value="02" checked onclick="$('#publishTime').hide();$('#publishTime').val('')">立即发布
						  </label>
						  <label>
						    <input type="radio" id="publishType2" name="publishType" value="03" onclick="$('#publishTime').show();">预约发布
						  </label>
						  <input id="publishTime" name="publishTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" class="mess-control" placeholder="请选择发布时间" style="width:37%;display:none" />         
						</div>
                    </div>                   	
                </div> 
                <div class="btnsub">
                    <button type="submit" class="btn-submit" style="float:left;">发布</button>
                    <button type="button" class="btn-submit" style="float:right;" onclick="history.back();">返回</button>
                </div>
            </form> 
        </div>
    </div>
	<#include "/footer.ftl" />
</body>
</html>