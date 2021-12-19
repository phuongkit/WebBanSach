<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="DAO.CartDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="user/css/product-item.css">

<link rel="stylesheet" href="user/css/tai-khoan.css">
<script type="text/javascript" src="user/js/main.js"></script>
<link rel="stylesheet" href="user/fontawesome_free_5.13.0/css/all.css">

<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="user/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="user/slick/slick-theme.css" />
<script type="text/javascript" src="user/slick/slick.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<script
	src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script
	src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<link rel="apple-touch-icon" sizes="180x180"
	href="user/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="user/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="user/favicon_io/favicon-16x16.png">
<link rel="manifest" href="user/favicon_io/site.webmanifest">
</head>

<body>

	<!-- header  -->
	<jsp:include page="_header.jsp"></jsp:include>
	
	<jsp:include page="_menu.jsp"></jsp:include>
	
	<!-- khoi sach moi  -->
	<section class="_1khoi sachmoi bg-white">
		<div class="container">
			<div class="noidung" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
						<h1 class="header text-uppercase" style="font-weight: 400;">KẾT QUẢ TÌM KIẾM</h1>
					</div>
				</div>
				<div class="row" style="padding-bottom: 2rem;">
					<c:forEach items="${book}" var="nbs">
						<!-- 1 san pham -->
						
						<div class="col-3">
							<a href="book?action=&book_id=${nbs.id}"
								class="motsanpham" style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="${nbs.name}"> <img
								class="card-img-top anh"
								src="${"user/images/"}${nbs.image.name}"
								width="206px"
								height="206px"
								onerror="this.onerror=null;this.src='${"user/images/default.jpg"}';"
								alt="${nbs.name}">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">${nbs.name}</h3>
									<small class="tacgia text-muted">${nbs.author.name}</small>
									<div class="gia d-flex align-items-baseline">
										<c:set var="sales" value="${BookDAO.getSalesByBookNotExpired(nbs.id)}" />
										<c:choose>
											<c:when test="${sales != -1}">
												<div class="giamoi">${nbs.salePrice*(100-sales)/100}₫</div>
												<div class="giacu text-muted">${nbs.salePrice}₫</div>
												<div class="sale">-${sales}%</div>
											</c:when>
											<c:otherwise>
												<div class="giamoi text-muted">${nbs.salePrice}₫</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="danhgia">
										<ul class="d-flex" style="list-style: none;">
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star"></i></li>
											<li><span class="text-muted">0 nhận xét</span></li>
										</ul>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>

</html>