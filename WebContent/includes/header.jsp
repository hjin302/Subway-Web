<%@page import="com.shop.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<div id="header">
		<div id="gtop"></div>
			<div class="util_menu">
				<%if(member==null){ %>
			   		<a id="memberMenu2" href="/member/login.jsp">로그인</a>
			   		<a id="memberMenu1" href="/member/regist.jsp">회원가입</a>
			    <%}else{ %>
			   		<a id="memberMenu2" href="/member/logout">로그아웃</a>
			   		<a id="memberMenu1" href="/shop/cart.jsp">장바구니</a>
			    <%}%>
				
				<a href="#" id="global_icon"><img src="/images/global.png" width="20px" height="20px"></a>
			</div>
			<a href="/"><img src="/images/main_logo.jpg" width="230px" height="115px"></a>
		<div id="gnb">
			<ul>
                <li> 
                    <a class="dp1"  href="/member/product/list">메뉴소개</a>
                </li>
                <li>
                    <a class="dp1" href="/notice/list" >공지사항</a>
                </li>
                <li>
                    <a class="dp1" href="/event/list" >이벤트</a>
                </li>
                <li>
                    <a class="dp1" href="/addStore/list" >가맹점</a>
                </li>
                <li>
                    <a class="dp1" href="/member/mypage" >MY-SUB</a>
                </li>
            </ul>
		</div>
	</div>
		<div id="space"></div>