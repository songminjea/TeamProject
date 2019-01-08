# <01/02>

### css
- 로그인, 게시글, 쪽지 변경

### 로그인 관련

### 회원 정보 관련

### 팔로우 관련
- 팔로우 목록 페이지 무한 스크롤링 추가.
- 팔로우 추천 목록 고침.

### 갤러리 관련

### 게시판 관련
- 헤더 좌측 상단 아이콘 누르면 게시판으로 이동되도록 변경(공용 DB에도 테이블 만들어주세요)

### 쪽지 관련
- 이동 경로 ${member.ID}/~ 로 변경(회원 정보 수정에서 쪽지를 누르면 페이지 이동 오류가 발생하므로)
- 갑자기 보낸 쪽지 리스트 확인이 또 잘 안됨........^^
- 쪽지 삭제 여부 확인 후 삭제되도록 함
- 읽지 않은 쪽지 앞에는 NEW문구가 뜨도록 한다. 
- 사이드 쪽에 회원 정보 안 뜨던 것 뜨게 변경 

### 채팅 관련
-
### 기타 등등

-
# <01/02> 끝
---

# <01/03>

### css
- 사이드(팔로우 부분), 회원 가입, 쪽지 상세 보기 변경
- 센터 부분 중앙 배열 -> left로 변경
- jsp에 작성한 css -> signup.css로 옮김
- main2에 css 몇개 추가. (팔로우버튼 크기조절, 검색창 모양)

### 로그인 관련
- 네이버, 구글 로그인 취소시 이동 경로 ${member.ID}/login으로 변경

### 회원 정보 관련
- joinOk.jsp 삭제(안 쓰는 거 같아서 지웠습니다.)
- 멤버 검색 추가. (member/search.jsp)
- 멤버 검색 관련 service,dao,mapper 추가

### 팔로우 관련
- 

### 갤러리 관련

### 게시판 관련
- 이동 경로 ${member.ID}/~ 로 변경 
- 헤더쪽 검색창 추가 ```<%-- 검색창 --%>```
- 헤더 오른쪽 회원 정보 ```col-md-4``` -> ```col-md-2``` 로 변경

### 쪽지 관련
- 답장 보내기 구현 중....

### 채팅 관련
-
### 기타 등등

-
# <01/03> 끝
---

# <01/04>

### css
- 헤더, 회원정보 수정, 쪽지 리스트, 채팅창, 
  회원정보 검색 결과 없을 시 나오는 창, 네이버, 구글 로그인 페이지 수정
- 헤더 상단에 고정
- 화면 상단으로 이동하는 버튼 우측 하단에 추가
- header.jsp 변경
  - 반응형 태그 구성 md-5 / md-2 / md-5 로 변경
  - 로그아웃 상태일때 우측상단에 로그인 버튼 뜨게 변경
- main2.css
  - ```a:hover{	text-decoration: none !important; ```
### 로그인 관련
- header 부분 import 없애고 따로 로고만 띄우게 변경

### 회원 정보 관련
- 회원 검색시 자신을 제외하고 검색되도록 변경
- 컨트롤러 리턴값 -> main에서 center만 변경되도록 함.
- 회원정보수정 페이지 이동시 {ID}/mypage
  - 로그인된 ID 와 현재 주소의 아이디가 다를때 메인화면으로 이동시킴.
  - 로그인 되어있지않을때 로그인화면으로 이동시킴.
- 회원검색결과 스크롤링 구현

### 팔로우 관련
- 

### 갤러리 관련
- 로그인했을때만 글쓰기 버튼 보이게 표시 (side-left.jsp)

### 게시판 관련
- 게시판 공용 DB에 구현
- mybatis-config.xml에 DealDTO Alias 지정
- 각 페이지 이동 경로 ${member.ID}/~ 로 변경, .do 삭제(이동 경로명 통일하려고) 
- 컨트롤러 리턴값 -> main에서 center만 변경되도록 함.(몇 개만)
- Mapper 테이블명, 컬럼명 -> 대문자로 변경(몇 개만)
- 자바스크립트 함수 main으로 이동(몇 개만)
-

### 쪽지 관련
- 읽지 않은 쪽지가 있으면 헤더 좌측 상단에 알림이 뜨도록 함.
- 컨트롤러 리턴값 -> main에서 center만 변경되도록 함.
- 또 쪽지 리스트가.......안보여서 일단 방치중
- 쪽지 답장 보내기 구현

### 채팅 관련
- 채팅 DB 구현(필요할 것 같아서 만듬. 해보고 필요없으면 지울거임.) 
- 채팅 관련 자바 파일 생성

### 기타 등등
-

# <01/04> 끝

---

# <01/07>

### css
- 팔로우 리스트 버튼 색상 변경
- 쪽지 리스트, 상세 내용 변경

### 회원 정보 관련
- mypageOk 리턴값 main.jsp?center=member/mypage로 변경(css 안먹혀서 바꿨습니다)

### 팔로우 관련
- 

### 갤러리 관련
- 

### 게시판 관련
- 

### 쪽지 관련
- 받은 쪽지 리스트는 제대로 받아옴.
- 보낸 쪽지 리스트는 수정중....
- 페이징, 검색 기능 구현중...
- mybatis-config.xml에 MessageSearch Alias 지정

### 채팅 관련
- 엔터키 인식하여 메시지 전송(전송 버튼 일일이 안 눌러도 됨)
- mybatis-config.xml에 ChatVO Alias 지정
- 채팅관련 내용 DB 저장, 채팅 중 리스트, 채팅할 회원 검색 기능 구현중...

### 기타 등등
-

# <01/07> 끝
