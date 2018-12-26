---
# <12/26>
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





