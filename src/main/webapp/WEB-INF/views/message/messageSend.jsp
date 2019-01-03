<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${member.ID!= null}">
	<div id="sendForm" title="메세지 전송">
	  <form name="messageSendOk" onsubmit="return messageCheck();">
	    <table width="90%" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" border="0">
	    	<tr>
		   	 	<td><input class="messageText" type="hidden" name="MESSAGE_SENDER" id="MESSAGE_SENDER" value="${member.ID}"></td>
		    </tr>
		    <tr>
		   	 	<td class="send_text_td">작성자</td>
		   	 	<td><input class="messageText" type="text" name="SENDER" id="SENDER" value="${member.ID}(${member.NAME})" readonly="readonly"></td>
		    </tr>
		    <tr>
		   	 	<td class="send_text_td">받는 사람</td>
		   	 	<td><input class="messageText" type="text" name="MESSAGE_RECEIVER" id="MESSAGE_RECEIVER" ></td>
		    </tr>
		    <tr>
		   	 	<td class="send_text_td">제목</td>
		   	 	<td><input class="messageText" type="text" name="MESSAGE_SUBJECT" id="MESSAGE_SUBJECT" ></td>
		    </tr>
	      	<tr>
	      		<td class="send_text_td">내용</td>
	      		<td><textarea id = "messageArea" rows="15" cols="48" name="MESSAGE_CONTENT" id="MESSAGE_CONTENT" placeholder="1000자 이내로 입력해 주세요." maxlength="1000"></textarea></td>
	      	</tr>
	      	<tr align="center">
	      		<td colspan="2">
	      			<input type="submit" value="보내기" id="sendBtn">
					<input type="button" value="창닫기" id="closeBtn" onclick="window.close()">
				</td>
	      	</tr>	      
	    </table>
	  </form>
	</div>
</c:if>