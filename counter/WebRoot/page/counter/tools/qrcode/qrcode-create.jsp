<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>客服二维码管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/admin.css">
  </head>
  
  <body>
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal">
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
            <div class="am-u-sm-9">
              <input type="text" id="user-name" placeholder="姓名 / Name">
              <small>输入你的名字，让我们记住你。</small>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-email" placeholder="输入你的电子邮件 / Email">
              <small>邮箱你懂得...</small>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-phone" placeholder="输入你的电话号码 / Telephone">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-QQ" placeholder="输入你的QQ号码">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-weibo" class="am-u-sm-3 am-form-label">微博 / Twitter</label>
            <div class="am-u-sm-9">
              <input type="email" id="user-weibo" placeholder="输入你的微博 / Twitter">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
            <div class="am-u-sm-9">
              <textarea class="" rows="5" id="user-intro" placeholder="输入个人简介"></textarea>
              <small>250字以内写出你的一生...</small>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary">保存修改</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
