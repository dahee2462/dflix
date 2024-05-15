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

## 📗 DB설계
<img src="https://github.com/dahee2462/dflix/blob/master/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EB%AC%B8%EC%84%9C/04.%EC%82%B0%EC%B6%9C%EB%AC%BC%20%EC%A0%9C%EC%B6%9C/04.%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%84%A4%EA%B3%84%EC%84%9C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-05-14%20114807.png" height="650px">

## 📌 주요기능
### 1️⃣ 로그인
 ✔️ 스프링 시큐리티를 활용한 인증과 권한부여

🖥️ 코드
<details>
<summary>security-context.xml</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/security-context.png" height="500px">
</details>
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

📷 뷰
<details>
<summary>login</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/login.png" height="500px">
</details>


### 2️⃣ 회원가입
 ✔️ Ajax를 활용하여 중복확인
 
 ✔️ 유효성검사
 
 ✔️ 비밀번호 Bcrypte를 사용하여 암호화
 
 🖥️ 코드
<details>
<summary>아이디 중복확인 Ajax, 유효성검사 부분(JSP)</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/join-ajax.png" height="500px">
</details>
<details>
<summary>User Controller</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/User%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC.png" height="500px"><br><br>
  * BCrypt로 암호화하여 저장
</details>
<details>
<summary>User Service</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/User%EC%84%9C%EB%B9%84%EC%8A%A4.png" height="100px">
</details>
<details>
<summary>User ServiceImpl</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserSVCImpl.png" height="300px">
</details>
<details>
<summary>UserMapper</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/UserMapper%20.png" height="500px">
</details>
📷 뷰
<details>
<summary>join</summary>
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/join.png" height="600px">
<img src="https://github.com/dahee2462/dflix/blob/master/%EC%9E%90%EB%A3%8C/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7/id%EC%A4%91%EB%B3%B5%ED%99%95%EC%9D%B8.png" height="100px">
</details>

### 3️⃣ 아이디 찾기
✔️ Ajax를 활용하여 일치하는 회원정보 조회 -> alert창으로 아이디 출력










