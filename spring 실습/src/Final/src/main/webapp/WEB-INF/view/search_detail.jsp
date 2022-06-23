<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kim-yeji
  Date: 2022/06/11
  Time: 7:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${empty authInfo}">
    <% request.setCharacterEncoding("UTF-8"); %>
    <nav class="navbar">
        <div class="navbar-container container">
            <input type="checkbox">
            <div class="hamburger-lines">
                <span class="line line1"></span>
                <span class="line line2"></span>
                <span class="line line3"></span>
            </div>
            <ul class="menu-items">
                <li><a href="/search/all">전체 상품 조회</a></li>
                <li>
                    <a href="/login">로그인</a>
                </li>
                <li>
                    <a href="/register">회원가입</a>
                </li>
            </ul>
            <h1 class="logo"><a href="/">숭실쇼핑몰</a></h1>
        </div>
    </nav>
</c:if>
<c:if test="${! empty authInfo}">
    <nav class="navbar">
        <div class="navbar-container container">
            <input type="checkbox">
            <div class="hamburger-lines">
                <span class="line line1"></span>
                <span class="line line2"></span>
                <span class="line line3"></span>
            </div>
            <ul class="menu-items">
                <li>${authInfo.userid}님</li>
                <li><a href="/search/all">전체 상품 조회</a></li>
                <li><a href="/search/buy">구매이력 조회</a></li>
                <li><a href="/userInfo/${authInfo.userid}">회원정보 조회</a></li>
                <li><a href="/modifyUserInfo/${authInfo.userid}">회원정보 수정</a></li>
                <li><a href="/logout">로그아웃</a></li>
                <li><a href="/remove">회원탈퇴</a></li>
            </ul>
            <h1 class="logo"><a href="/">숭실쇼핑몰</a></h1>
        </div>
    </nav>
</c:if>
<section style="padding: 100px 60px 20px 60px">
    <br>
    <div style="margin: auto; padding: 10px 10px 10px 10px; width: 700px;height: 700px;">
        <div style="float: left;width: 250px; height: 300px;"><img
                src=${searchDetailResult.photo} onError="this.style.visibility='hidden'" alt="상품 상세 이미지">
        </div>
        <div style="float: right; width: 300px;height: 200px;">
            <ul style="line-height: 150%">
                <li>카테고리: ${searchDetailResult.category}</li>
                <li>이름: ${searchDetailResult.name}</li>
                <li>가격: ${searchDetailResult.price}원</li>
                <li>등록 일자: ${searchDetailResult.reg_time}</li>
                <li>판매 횟수: ${searchDetailResult.buying_count}</li>
            </ul>

            <c:if test="${! empty authInfo}">
                <form action='/search/${searchDetailResult.id}/buy' method="post">
                    <button type='submit'
                            onclick='alert("${searchDetailResult.name}을 구매하시겠습니까?")'>구매하기</button>
                </form>
            </c:if>
        </div>
    </div>


</section>
</body>
</html>


<style>
    *,
    *::after,
    *::before {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

    .html {
        font-size: 62.5%;
    }

    .navbar input[type="checkbox"],
    .navbar .hamburger-lines {
        display: none;
    }

    .container {
        max-width: 1200px;
        width: 90%;
        margin: auto;
    }

    .navbar {
        box-shadow: 0px 5px 10px 0px #aaa;
        position: fixed;
        width: 100%;
        background: #fff;
        color: #000;
        opacity: 0.85;
        z-index: 100;
    }

    .navbar-container {
        display: flex;
        justify-content: space-between;
        height: 64px;
        align-items: center;
    }

    .menu-items {
        order: 2;
        display: flex;
    }

    .logo {
        order: 1;
        font-size: 2.3rem;
    }

    .menu-items li {
        list-style: none;
        margin-left: 1.5rem;
        font-size: 1.3rem;
    }

    .navbar a {
        color: #444;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease-in-out;
    }

    .navbar a:hover {
        color: #117964;
    }

    @media (max-width: 768px) {
        .navbar {
            opacity: 0.95;
        }

        .navbar-container input[type="checkbox"],
        .navbar-container .hamburger-lines {
            display: block;
        }

        .navbar-container {
            display: block;
            position: relative;
            height: 64px;
        }

        .navbar-container input[type="checkbox"] {
            position: absolute;
            display: block;
            height: 32px;
            width: 30px;
            top: 20px;
            left: 20px;
            z-index: 5;
            opacity: 0;
            cursor: pointer;
        }

        .navbar-container .hamburger-lines {
            display: block;
            height: 28px;
            width: 35px;
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 2;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .navbar-container .hamburger-lines .line {
            display: block;
            height: 4px;
            width: 100%;
            border-radius: 10px;
            background: #333;
        }

        .navbar-container .hamburger-lines .line1 {
            transform-origin: 0% 0%;
            transition: transform 0.3s ease-in-out;
        }

        .navbar-container .hamburger-lines .line2 {
            transition: transform 0.2s ease-in-out;
        }

        .navbar-container .hamburger-lines .line3 {
            transform-origin: 0% 100%;
            transition: transform 0.3s ease-in-out;
        }

        .navbar .menu-items {
            padding-top: 100px;
            background: #fff;
            height: 100vh;
            max-width: 300px;
            transform: translate(-150%);
            display: flex;
            flex-direction: column;
            margin-left: -40px;
            padding-left: 40px;
            transition: transform 0.5s ease-in-out;
            box-shadow: 5px 0px 10px 0px #aaa;
            overflow: scroll;
        }

        .navbar .menu-items li {
            margin-bottom: 1.8rem;
            font-size: 1.1rem;
            font-weight: 500;
        }

        .logo {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 2.5rem;
        }

        .navbar-container input[type="checkbox"]:checked ~ .menu-items {
            transform: translateX(0);
        }

        .navbar-container input[type="checkbox"]:checked ~ .hamburger-lines .line1 {
            transform: rotate(45deg);
        }

        .navbar-container input[type="checkbox"]:checked ~ .hamburger-lines .line2 {
            transform: scaleY(0);
        }

        .navbar-container input[type="checkbox"]:checked ~ .hamburger-lines .line3 {
            transform: rotate(-45deg);
        }

    }

    @media (max-width: 500px) {
        .navbar-container input[type="checkbox"]:checked ~ .logo {
            display: none;
        }
    }
</style>


