# 🎬 DFLIX :: 영화 예매 사이트 🎬
영화 예매를 위한 스프링3.0 MVC 기반 사이트입니다.

## ⏱️ 개발기간
* 2024/03/18 - 2024/04/16

## 🧑‍🤝‍🧑 팀원소개
|이름|담당기능|
|------|---|
|**이준택 (팀장)**|공공데이터 API Scheduler, 메인페이지 박스오피스, 영화 예매 페이지|
|**전용휘**|DB설계, 고객센터 CRUD, 극장시간표 CRUD, 극장 상영정보 조회|
|**정다희**|Spring Security, 회원 CRUD, 아이디찾기, 나의 예매내역 조회, 영화 목록 및 상세페이지|

## ⚙️ 개발환경
|개발환경|개발언어|개발도구|
|---|---|---|
|tomcat 9.0|HTML|Eclipse 2021_11|
MySQL 8.0.35|CSS3|STS 3(Spring Toll Suite)|
JDK 13.0.2|Javascript|StarUML|
GitHub|JQuery|ERMaster|
AWS |JAVA(JSP, JDBC)|FileZila|
Docker|Springframework 4.3.4||
<!--
## 💾 배포파일
[참조링크 URL](http://13.125.224.121/dflix/)
-->

## 📑 PPT
[참조링크 URL](https://www.canva.com/design/DAGF1QTOk5E/4yzUCz1FobAsmjJ4bjJ9ag/view?utm_content=DAGF1QTOk5E&utm_campaign=designshare&utm_medium=link&utm_source=editor)

## 📗 DB설계
<img src="https://github.com/dahee2462/dflix/blob/master/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EB%AC%B8%EC%84%9C/04.%EC%82%B0%EC%B6%9C%EB%AC%BC%20%EC%A0%9C%EC%B6%9C/04.%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%84%A4%EA%B3%84%EC%84%9C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-05-14%20114807.png" height="650px">

## 📌 주요기능
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/dflix%20%EC%84%9C%EB%B9%84%EC%8A%A4%EA%B5%AC%EC%84%B1%EB%8F%84.png" height="400px">

## 1️⃣ 로그인

 ✔️ 스프링 시큐리티를 활용한 인증과 권한부여

🖥️ 코드<br><br>
security-context.xml<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/security-context.png" height="400px">
<details>
<summary>UserAuthenticationService</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserAuthenticationService.png" height="500px">
</details>
<details>
<summary>UserLoginSuccessHandler</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserLoginSuccessHandler.png" height="500px">
</details>
<details>
<summary>UserLoginFailureHandler</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserLoginFailureHandler.png" height="200px">
</details>
<details>
<summary>UserDeniedHandler</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserDeniedHandler.png" height="200px">
</details>

📷 뷰<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/login.png" height="300px">

## 2️⃣ 회원가입

 ✔️ Ajax를 활용하여 중복확인
 
 ✔️ 유효성검사
 
 ✔️ 비밀번호 Bcrypte를 사용하여 암호화
 
 🖥️ 코드<br><br>
아이디 중복확인 Ajax, 유효성검사 부분(JSP)<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/join-ajax.png" height="400px">

<details>
<summary>Controller</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/User%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC.png" height="500px"><br><br>
  * BCrypt로 암호화하여 저장
</details>
<details>
<summary>Service</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/User%EC%84%9C%EB%B9%84%EC%8A%A4.png" height="100px">
</details>
<details>
<summary>ServiceImpl</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserSVCImpl.png" height="300px">
</details>
<details>
<summary>Mapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserMapper%20.png" height="500px">
</details>
📷 뷰<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/join.png" height="400px">
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/id%EC%A4%91%EB%B3%B5%ED%99%95%EC%9D%B8.png" height="100px">


## 3️⃣ 아이디 찾기

✔️ Ajax를 활용하여 일치하는 회원정보 조회 -> alert창으로 아이디 출력

 🖥️ 코드<br><br>
아이디 찾기 Ajax (JSP) <br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/findIdAjax.png" height="300px">

<details>
<summary>Controller</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/findIdController.png" height="200px">
</details>
<details>
<summary>DAO</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/findIdDAO.png" height="100px">
</details>
<details>
<summary>Mapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/findIdMapper.png" height="100px">
</details>
📷 뷰<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%95%84%EC%9D%B4%EB%94%94%EC%B0%BE%EA%B8%B0.png" height="300px">
입력값이 일치하면 alert창으로 아이디 출력<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%95%84%EC%9D%B4%EB%94%94%EC%B0%BE%EA%B8%B0%EC%95%8C%EB%A6%BC%EC%B0%BD.png" height="100px">

## 4️⃣ 회원정보 수정, 회원탈퇴

🖥️ 코드
<details>
<summary>MyInfo Controller</summary>
 비밀번호 확인 컨트롤러<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%B9%84%EB%B2%88%ED%99%95%EC%9D%B8%20%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC.png" height="400px"><br><br>
회원정보 수정 컨트롤러<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%EB%B3%80%EA%B2%BD%20%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC.png" height="400px"><br><br>
회원탈퇴 컨트롤러<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4%20%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC.png" height="400px">
</details>

<details>
<summary>MyInfo Mapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/MyInfoMapper.png" height="200px">
</details>
📷 뷰
<details>
<summary>비밀번호 확인</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%B9%84%EB%B2%88%ED%99%95%EC%9D%B8.png" height="300px"><br><br>
비밀번호 불일치시<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%B9%84%EB%B2%88%20%EB%B6%88%EC%9D%BC%EC%B9%98.png" height="100px"><br><br>
비밀번호 일치시 회원정보변경 페이지로 이동<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%EB%B3%80%EA%B2%BD.png" height="400px"><br><br>
 완료시 DB 업데이트, 회원탈퇴도 동일
</details>

## ⏹️ 극장시간표 관리(관리자)

📷 뷰
<details>
<summary>극장 시간표 관리</summary>
 <br><br>
 극장 시간표 추가<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EA%B7%B9%EC%9E%A5%EC%8B%9C%EA%B0%84%ED%91%9C%20%EC%B6%94%EA%B0%80%20%ED%99%94%EB%A9%B4.png" height="400px"><br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EA%B7%B9%EC%9E%A5%EC%8B%9C%EA%B0%84%ED%91%9C%20%EC%B6%94%EA%B0%80%20%ED%99%94%EB%A9%B42.png" height="400px"><br><br>
 극장 시간표 목록 조회<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EA%B7%B9%EC%9E%A5%EC%8B%9C%EA%B0%84%ED%91%9C%EA%B4%80%EB%A6%AC%20%EB%AA%A9%EB%A1%9D%EC%A1%B0%ED%9A%8C%20%ED%99%94%EB%A9%B4.png" height="400px">
</details>

## ⏹️ 영화 예매

📷 뷰
<details>
<summary>영화 예매</summary>
 <br><br>
 영화 예매 <br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4%20%ED%99%94%EB%A9%B4.png" height="400px"><br><br>
 좌석 선택<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%A2%8C%EC%84%9D%EC%84%A0%ED%83%9D%20%ED%99%94%EB%A9%B4.png" height="400px"><br><br>
 예매 완료<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%88%EB%A7%A4%EC%99%84%EB%A3%8C%20%ED%99%94%EB%A9%B4.png" height="400px">
</details>

## 6️⃣ 나의 예매내역 조회

🖥️ 코드
<details>
<summary>나의 예매 조회(JSP)</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%82%98%EC%9D%98%EC%98%88%EB%A7%A4%EC%A1%B0%ED%9A%8C%20jsp.png" height="500px"><br><br>
 <img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%82%98%EC%9D%98%EC%98%88%EB%A7%A4%EC%A1%B0%ED%9A%8C%20jsp2.png" height="200px">
</details>
<details>
<summary>나의 예매 조회 Controller</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%82%98%EC%9D%98%EC%98%88%EB%A7%A4%EC%A1%B0%ED%9A%8C%20controller.png" height="500px">
</details>
<details>
<summary>나의 예매 조회 Mapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%82%98%EC%9D%98%EC%98%88%EB%A7%A4%EC%A1%B0%ED%9A%8C%20mapper.png" height="300px">
</details>
📷 뷰<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EB%82%98%EC%9D%98%20%EC%98%88%EB%A7%A4%EB%82%B4%EC%97%AD%20%EC%A1%B0%ED%9A%8C%20%ED%99%94%EB%A9%B4.png" height="400px">


## 7️⃣ 박스오피스, 상영예정작 목록 조회

✔️ 영화API 사용하여 영화정보 조회

✔️ 페이징

🖥️ 코드
<details>
<summary>JSP</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%EC%B0%A8%ED%8A%B8%20jsp.png" height="500px"><br><br>
영화 목록 조회<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EC%B0%A8%ED%8A%B8%20%ED%8E%98%EC%9D%B4%EC%A7%95%20jsp.png" height="300px"><br><br>
페이징
</details>
<details>
<summary>Controller</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EB%AA%A9%EB%A1%9D%20%EC%A1%B0%ED%9A%8C%20controller.png" height="400px">
</details>
<details>
<summary>Mapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%EB%AA%A9%EB%A1%9D%20%EC%A1%B0%ED%9A%8C%20mapperj.png" height="200px">
</details>

📷 뷰<br><br>

<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EB%AA%A9%EB%A1%9D%20%EC%A1%B0%ED%9A%8C%20%ED%99%94%EB%A9%B4.png" height="500px">

## 8️⃣ 영화 상세 조회

✔️ 영화API 사용하여 영화정보 조회

✔️ Ajax를 사용하여 댓글구현

✔️ 댓글 CRUD

🖥️ 코드
<details>
<summary>JSP</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EB%B7%B0%20jsp.png" height="400px"><br><br>
영화 상세보기<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EB%8C%93%EA%B8%80%20jsp.png" height="400px"><br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EB%8C%93%EA%B8%80%20jsp2.png" height="400px"><br><br>
댓글
</details>
<details>
<summary>Controller</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EC%83%81%EC%84%B8%20controller.png" height="150px">
</details>
<details>
<summary>Mapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EC%83%81%EC%84%B8%20mapper.png" height="300px">
</details>
📷 뷰<br><br>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/%EC%98%81%ED%99%94%20%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0%20%ED%99%94%EB%A9%B4.png" height="650px">













