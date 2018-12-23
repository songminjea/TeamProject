<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <!-- 스프링 프레임웍에서 제공해주는 form태그 사용을 위한 선언 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="panel-body">
   <form:form role="form" commandName="loginCommand" action="/login" method="post">
        <fieldset>
            <div class="form-group">
                <form:input type="text" class="form-control" placeholder="ID" path="id"/>
            </div>
            <div class="form-group">
                 <form:password class="form-control" placeholder="Password" path="pwd"/>
            </div>
            <div class="checkbox">
                <label>
                    <form:checkbox path="rememberId"/>아이디 기억
                </label>
            </div>
                <button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
        </fieldset>
    </form:form>
</div>
</body>
</html>