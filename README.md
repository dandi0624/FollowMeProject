# :small_orange_diamond: Follow Me 인스타마켓 판매회사를 위한 그룹웨어 :small_orange_diamond:


## :bookmark_tabs: 소개
그룹웨어 <b>Follow Me</b>는 인스타마켓 판매회사를 위한 그룹웨어입니다. <br/>
20-30인으로 구성된 소규모 회사에 적합한 그룹웨어로, 그룹웨어의 기본적인 기능인 전자결재, 일정관리 외에 <br/>
재택근무 및 자율좌석제가 가능한 업종인을 감안한 좌석 예약 기능,  <br/>
자유로운 분위기에서 소통할 수 있는 소셜 피드 기능 등을 추가했습니다. 



## :sparkles: 목표
- 이 프로젝트의 목표는 Spring Framework를 사용하여 그룹웨어 시스템의 주요 기능인 일정 관리, 전자결재, 커뮤니케이션 등과 같은 기능을 구현하는 것입니다.  <br/>
- 이를 통해 웹 애플리케이션의 기본 개념과 아키텍처를 이해하고, 실제 업무에서 활용 가능한 협업 도구를 개발하는 능력을 기르는 것을 목표로 합니다.  <br/>
- 또한, 백엔드 개발 역량을 향상시키고 효율적인 코드 작성과 시스템 설계 능력을 배양하는 것을 목표로 합니다.

## :key: 기능
1. 사용자
   - 로그인 : 로그인, 임시 비밀번호 발급
   - 마이페이지 : 프로필 이미지 변경, 전자서명 관리, 인사정보 관리, 급여계좌 실명인증, 자격증 정보 관리
   - 쪽지함 : 쪽지 수신/발신
   - 메일 : 메일 수신/발신
   - 알림 : 근태 관련 알림
2. 게시판
   - 전자게시판 : 게시판별 구분, 최신 공지글 구분
   - 조직도 : 개별 직원정보 조회
   - 소셜피드 : 피드 글 작성/수정/삭제, 댓글 작성/삭제
   - 전자결재 : 전자결재 양식별 기안/승인/반려/회수
3. 관리
   - 일정관리 : 일정 추가/수정/삭제, 일정 카테고리별 조회
   - 근태관리 : 출/퇴근 처리, 개인별 근태현황 조회, 전체 근태현황 조회, 휴가 신청
   - 자산관리 : 차량/좌석 예약/변경/취소, 예약현황 조회, 내역 엑셀 다운로드
   - 인사관리 : 직원정보 등록/수정/삭제/조회, 내역 엑셀 다운로드, 직원정보 검색
4. 메인페이지
   - 출/퇴근 처리
   - 전자결재함 링크 연결
   - 게시판 최신글 불러오기
   - To-do 리스트 등록/삭제
   - 네이버 뉴스 API 연결

   
## :feet: 스택
| 언어 | DB | IDE | 빌드 | 기술 |
| --- | --- | --- | --- | --- |
|<img src="https://img.shields.io/badge/java-%23ED8B00.svg?style=flat-square&logo=openjdk&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/html5-%23E34F26.svg?style=flat-square&logo=html5&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/css3-%231572B6.svg?style=flat-square&logo=css3&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/javascript-%23323330.svg?style=flat-square&logo=javascript&logoColor=%23F7DF1E">|<img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white">|<img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=flat-square&logo=visual-studio-code&logoColor=white">|<img src="https://img.shields.io/badge/Apache%20Maven-C71A36?style=flat-square&logo=Apache%20Maven&logoColor=white">|<img src="https://img.shields.io/badge/spring-%236DB33F.svg?style=flat-square&logo=spring&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/Mybatis-181717.svg?style=flat-square&logo=Mybatis&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/jquery-%230769AD.svg?style=flat-square&logo=jquery&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/bootstrap-%238511FA.svg?style=flat-square&logo=bootstrap&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/JSP-3776AB.svg?style=flat-square&logo=JSP&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/JSON-3776AB.svg?style=flat-square&logo=JSON&logoColor=white">|



## :thought_balloon: DB구성
<img width="461" alt="FollowMe_ERD" src="https://github.com/Lee-Da-Ye/FollowMeProject/assets/148595981/e2b0fbfc-5fb6-4bd9-9056-62629cd42be9">


## :dizzy: 화면구현
- 로그인 화면
   - 로그인 전 [비밀번호 재설정] 버튼 클릭을 통해 임시 비밀번호 발급 가능
   - [사번저장]을 통해 한번 로그인 한 사용자의 사번을 저장 가능
<img width="70%" alt="loginpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/f7625222-2c54-4599-bc1a-b10ca2db55fc">

 <br/> <br/>

- 메인페이지
   - 로그인 시 메인 페이지에서 근태관리, 최근 공지글 확인, 오늘의 뉴스 등을 확인
   - 근태관리, 오늘의 결재 건으로 이동, 오늘의 To-do 등록 등의 기능을 수행 가능함
<img width="70%" alt="mainpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/508efe1e-e572-4f5f-a958-ff8beb08c0f4">

- 좌석예약페이지
   - 직원은 좌석 예약 가능 여부 조회 및 예약 신청을 할 수 있음
   - 대표는 좌석 예약 상세 조회가 가능하며, 좌석별 상태 변경을 할 수 있음
<img width="70%" alt="seatreservaionpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/da793174-63f3-4de7-a2b0-6263a6316e40">

<br/> <br/>

- 전자결재페이지
   - 전자결재는 진행중 / 승인 / 반려 / 회수 / 참조 / 미처리 결재함으로 구분됨
   - 작성 문서에 따라 자동으로 결재라인이 지정되며, 최종 결재자만 의견 작성 가능함
<img width="70%" alt="documentpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/216c88cc-6406-4321-be3e-a98f7dde5c26">

<br/> <br/>

- 일정관리페이지
   - 일정관리 페이지에서는 전체 / 회사 / 부서 / 개인 일정을 구분해서 조회 가능함
   - 구글 공휴일 캘린더를 연동해 일정에서 공휴일을 확인할 수 있게 함
<img width="70%" alt="callendarpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/0f38f854-9c3f-467d-8612-79b6fc21f68f">

<br/> <br/>

- 이메일
   - 받은메일 / 보낸메일 / 휴지통으로 구분해 이메일 조회 가능함
   - 실제 이메일계정을 연결하여 송신 / 수신이 가능함
<img width="70%" alt="boardpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/5122284b-1865-424e-9886-fcc024a84058">

<br/> <br/>

- 전자게시판
   - 전체글 / 공지사항 / 사내소식으로 구분해 게시글 조회 가능함
   - 오른쪽 상단에 최신 공지글은 별도로 확인할 수 있게 구분하였음
<img width="70%" alt="boardpage" src="https://github.com/dandi0624/08_spring-workspace/assets/153481807/f3595e71-6b31-410a-bff6-f8ca61f6cb6f">



