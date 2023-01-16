<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
</head>
<body>
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
			<h2>${currentUser.name }님이 관심 있는 레시피</h2>
			<h3>레시피 구경하고 장바구니에 ssag 담아보세요~!</h3>
			
			<form name="rForm" action="recipe_tag.ssg" method="get">
				<input type="hidden" name="tag_id" value="${recipeVO.tag_id }">
				<input type="hidden" name="tag_name" value="${recipeVO.tag_name }">
			</form>
			
			<table border="1">
				<tr>
					<td></td>
					<td>ID</td>
					<td>이름</td>
					<td>난이도</td>
					<td>좋아요</td>
					<td colspan="2">이미지</td>
				</tr>
				<c:forEach var="vo" items="${list_my }" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${vo.recipe_id }</td>
					<td>${vo.recipe_name }</td>
					<td>${vo.level }</td>
					<td>${vo.cnt }</td>
					<td><img src = "${vo.recipe_img }" width="200" height="200" ></td>
					<td><input type="button" value="상세보기" onclick="goPage(2, ${vo.recipe_id}, '${vo.recipe_name}')"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>

</body>
<script>
	function goPage(pg, id, name) {
		if (pg == 1) {
			location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;		
		} else if (pg == 2) {	// 다음 페이지로 이동
			location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;
		} else if (pg == 3) {	// 이전 페이지로 이동
			location.href = "recipe_cat.ssg?cat=" + id + "&category_name=" + name;
		}
	}
	
	function srch_sort() {
		rForm.submit();	// form 자체를 통째로 전송
	}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
