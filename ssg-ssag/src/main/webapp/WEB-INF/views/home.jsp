<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	function goTag(cat, name) {
		location.href="recipe/recipe_cat.ssg?cat=" + cat + "&category_name=" + name;
	}	
</script>

<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/home.css">
</head>
<body>
	<div class="main-background">
		<div class="pc-bg-left"></div>
		<div class="main-container">
			<jsp:include page="layout/header.jsp" />
			<div class="content-container">
				<div>
					<h4 class="home-recipe-title">지금 쓱-싹에서 인기 있는 레시피</h4>
					<div id="hotRecipeCarousel" class="carousel slide" data-bs-ride="carousel" data-touch="true" data-interval="2000">
					  <div class="carousel-inner">
					  	<c:forEach var="vo" items="${hotRecipe_list }" varStatus="status">
								<div class="carousel-item hot-recipe-card <c:if test="${status.first }">active</c:if>" onclick="goPage(${vo.recipe_id}, '${vo.recipe_name}')">
						      <div class="hot-recipe-img ccenter-layout" style="background-image: url(${vo.recipe_img }); no-repeat">
						        <h4 class="text-stroke">${vo.recipe_name }</h4>
						        <div>태그 태그</div>
						      </div>
						    </div>
							</c:forEach>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#hotRecipeCarousel" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#hotRecipeCarousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				</div>
				<div class="main-tag-container">
					<h4 class="home-recipe-title">태그로 알아보는 쓱-싹 레시피</h4>
					<div class="rcenter-layout">
						<div class="main-tag-card" onclick="goTag(1, '종류');">종류</div>
						<div class="main-tag-card" onclick="goTag(2, '건강');">건강</div>
								
					</div>
					<div class="rcenter-layout">
						<div class="main-tag-card" onclick="goTag(3, '테마');">테마</div>
						<div class="main-tag-card" onclick="goTag(4, '조리법');">조리법</div>		
					</div>
				</div>
			</div>
			<jsp:include page="layout/menu.jsp" />
		</div>
		<div class="pc-bg-right"></div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
