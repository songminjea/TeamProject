---
민재씨 패키지명 
com.team.member.~~ 로 변경
MemverController -> 회원가입 수정 ,로그아웃 추가

MemberDAO -> 회원가입 수정

MemberDAOImpl -> 회원가입 수정

MemberService -> 회원가입 수정

MemberServiceImpl -> 회원가입 수정

MemberMapper -> 회원가입 수정

view/logout 추가

layout -> side-left: 회원수정버튼 추가, 회원이름,생년월일,이메일 변경

layout ->header : 환영합니다 부분 <a></a> 추가, 회원 로그아웃 부분 변경

servlet-context.xml  

->D://upload->(D:\upload) 변경

<!-- 파일업로드 위한 디렉토리 설정 -->

	<beans:bean id="uploadPath" class="java.lang.String">
	
		<beans:constructor-arg value ="D://upload->(D:\upload)"/>
		
	</beans:bean> 
	
---
com.team.main.Controller -> mainController 추가(왜인지 모르겠지만 빠져있었음)
servlet-context.xml, pom.xml -> tiles 속성 제거(안써서)
layout -> header.jsp -> 로고 누르면 main으로 이동, member.NAME -> member.ID로 변경
회원정보 몇군데 -> 주소 컨트롤러로 가게 수정했습니다. 
저는 8080이 아니라서 접속을 거부당해서...

-------------------------------
쪽지 리스트, 상세보기, 삭제 구현 

보내기도 분명 됬었는데 팝업창이 갑자기 안떠서 보내지를 못함 수정해야됨

login, main 타이틀명 변경

---

main.jsp, header.jsp 파일의  img src 경로 ${pageContext.request.contextPath}/~~~ 로 변경

배경화면 아래쪽이 짤려버려서 

main.jsp 의 <div class="main"> main 속성을 제거 후 

	<body class="w3-theme-l5 main"> 로 변경

팔로우 ajax 로 구현하고 테스트중

---

#변경
imgupload.jsp
uploadUtil.java
MediaUtil.java
gallerController.java
upload.js

#추가
galleryVo.java

---

Follow 리스트 대충 80% 구현

header,side-left

img src에 {pageContext.request.contextPath}/ 추가

side-left에 my group 버튼 누르면 로그인한 아이디의 팔로워,팔로잉 목록 보는 페이지로 이동.

---
