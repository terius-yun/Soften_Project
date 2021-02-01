<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>텍스트 고민 없이 디자인만 하세요.</h1>
		<form action="TextOutputAction.do" method="post">
			<select name="purpose" required="required">
				<option value="">어디에 쓰실건가요?</option>
			    <option value="생활용품/잡화">생활용품/잡화</option>
			    <option value="전자제품">전자제품</option>
			    <option value="포스터/공모전">포스터/공모전</option>
<!-- 			    <option value="가게용품">가게용품</option> -->
<!-- 			    <option value="학원">학원</option> -->
<!-- 			    <option value="식품">식품</option> -->
			</select>
			<br><br><br>
			<select name="volume" required="required">
				<option value="">얼마나 필요하세요?</option>
			    <option value="little">조금만 필요해요.</option>
			    <option value="ordinary">적당히 필요해요</option>
			    <option value="extra">많이 필요해요</option>
			</select>
			<input type="submit" value="생성">
			
			<c:forEach var="text" items="${requestScope.text}">
				<p>${text}</p>
			</c:forEach>
		</form>
	</body>
</html>