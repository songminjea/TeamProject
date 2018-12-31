# 변경
imgupload.jsp
uploadUtil.java
MediaUtil.java
gallerController.java
upload.js

# 추가
galleryVo.java

---

Follow 리스트 대충 80% 구현

=======
header,side-left

img src에 {pageContext.request.contextPath}/ 추가

side-left에 my group 버튼 누르면 로그인한 아이디의 팔로워,팔로잉 목록 보는 페이지로 이동.

---
쪽지 보내기 구현 완료
(디테일한 부분은 추후 수정할 예정)
tiles.xml, layout.jsp -> 분명히 뺐는데 다시 들어와있길래 없애버림. 필요없음.
멀티채팅 id, name값 적용함. 팝업 형태로 바꿨는데, 위치를 좀 바꿀지 생각 중임. 디테일한 부분은 수정해야 함.
header -> multichat만 남겨두고 chat는 삭제함. 한 아이콘에서 드롭다운형식으로 1:1 이나 1:N형식 채팅으로 항목 나눌듯.
servlet-context, java -> 채팅 관련 자바파일, 설정 삭제. 현재 멀티채팅 기능은 mvc 안써서.
시간 되면 mvc로도 구현해보겠음.

---------------------------
로그인, 메인페이지 css 적용 시작
로그인 페이지 -> 페이지 이동시 컨트롤러로 가게 주소 수정
회원 프로필 이미지가 없을 경우 기본 이미지가 뜨게 설정
css 폴더의 이미지 -> img 폴더로 이동
--------------------------
# <12/30>

<최지원 해야할 것 메모>

어제까지 잘뜨던 배경 이미지가 갑자기 안떠서 수정해야 함. 이유를 모르겠음

알림 -> 구현 db, el태그 활용 쪽지랑 비슷하게. 

실시간은 웹소켓 써야되서 힘들것도 같음.

제가 참고할 사이트 적어놓은것

//http://highlighttt.tistory.com/12 

//https://www.youtube.com/watch?v=gQyRxPjssWg

---

### 로그인 관련

- main 으로 접속할시 LoginInterceptor를 통해서 로그인 안되어있을 경우 login 페이지로 이동하게 변경 

	- LoginInterceptor 사용 안되고 있길래 전체 주석처리하고 마음대로 바꿨습니다.
	필요할때 다시 살려서 쓰시면 될거같아요.

- *servlet-context*에 인터셉터 맵핑에 main 추가

- *loginController* 로그인 성공시 ```return "main" -> return "redirect:main"``` 으로 변경

- *memberController* 로그아웃 매핑을 loginController로 이동.

- *logout.jsp* 삭제

- *loginController* > loginSuccess 에서 ```return "redirect:login"; -> return "login";``` 로 변경

### gallery 관련

- *list* 추가

- *gallery.js* 추가 (ajax 처리용 / handlebar 사용해서 출력.)

- 글 목록 보는건  이미지 출력만 처리하면 끝

- **{id}/gallery** 로 접속하면 화면 출력


### 기타 등등
- header.jsp 로그인 안되어있으면 로그인 버튼 뜨게 바꿈


- main2.css 

```a{ text-decoration: none; }``` 추가

# <12/30 끝>
---
