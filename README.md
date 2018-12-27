
#변경
imgupload.jsp
uploadUtil.java
MediaUtil.java
gallerController.java
upload.js

#추가
galleryVo.java


---
민재씨 패키지명 
com.team.member.~~ 로 변경


#삭제
com.team.login.DTO.MemberVO 



---
#변경 
com.team.login.DAO.MemberDAO -> com.team.login.DAO.LoginDAO

com.team.login.DAO.MemberDAOImpl  -> com.team.login.DAO.LoginDAOImpl

	/mybatis/mybatis-config.xml
	<typeAlias alias="MemberVO" type="com.team.login.DTO.MemberVO" /> 
	-> 

com.team.member.VO.MemberVO 
변수명 대문자로 변경

signUp.jsp 
form의 name값들 대문자로 변경

memberMapper.xml
파라미터값들 대문자로 변경


---

.gitignore 적용

프로젝트 불러온 후 

프로젝트 우클릭  - maven - update project 해야함.

---







