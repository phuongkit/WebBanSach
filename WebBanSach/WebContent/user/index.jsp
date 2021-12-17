<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="servlets.user.homeServlet"%>
<%@page import="DAO.BookDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Dealbook-Mua sách trực tuyến giá rẻ nhất</title>
<meta name="description"
	content="Mua sách online hay, giá tốt nhất, combo sách hot bán chạy, giảm giá cực khủng cùng với những ưu đãi như miễn phí giao hàng, quà tặng miễn phí, đổi trả nhanh chóng. Đa dạng sản phẩm, đáp ứng mọi nhu cầu.">
<meta name="keywords"
	content="nhà sách online, mua sách hay, sách hot, sách bán chạy, sách giảm giá nhiều">
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

<script
	src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>

<link rel="stylesheet" href="user/css/home.css">
<link rel="stylesheet" href="user/css/tai-khoan.css">
<script type="text/javascript" src="user/js/main.js"></script>
<link rel="stylesheet" href="user/fontawesome_free_5.13.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="user/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="user/slick/slick-theme.css" />
<script type="text/javascript" src="user/slick/slick.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link rel="canonical" href="http://dealbook.xyz/">
<meta name="google-site-verification"
	content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
<link rel="apple-touch-icon" sizes="180x180"
	href="user/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="user/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="user/favicon_io/favicon-16x16.png">
<link rel="manifest" href="user/favicon_io/site.webmanifest">
<style>
img[alt="www.000webhost.com"] {
	display: none;
}
</style>
</head>

<body>

	<!-- header  -->
	<jsp:include page="_header.jsp"></jsp:include>

	<!-- menu home  -->
	<jsp:include page="_menuHome.jsp"></jsp:include>

	<!-- khoi sach moi  -->
	<section class="_1khoi sachmoi bg-white">
		<div class="container">
			<div class="noidung" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
						<h1 class="header text-uppercase" style="font-weight: 400;">SÁCH
							MỚI TUYỂN CHỌN</h1>
						<a href="sach-moi-tuyen-chon.html"
							class="btn btn-warning btn-sm text-white">Xem tất cả</a>
					</div>
				</div>
				<div class="khoisanpham" style="padding-bottom: 2rem;">
					<c:forEach items="${newBooks}" var="nbs">
						<!-- 1 san pham -->
						<div class="card">
							<a href="Lap-trinh-ke-hoach-kinh-doanh-hieu-qua.html"
								class="motsanpham" style="text-decoration: none; color: black;"
								d	ata-toggle="tooltip" data-placement="bottom"
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

	<!-- khoi sach combo hot  -->
	<section class="_1khoi combohot mt-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header -->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
						<h2 class="header text-uppercase" style="font-weight: 400;">SÁCH BÁN CHẠY</h2>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
				</div>
				<div class="khoisanpham">
					<c:forEach items="${bestSellingBooks}" var="bsb">
						<!-- 1 san pham -->
						<div class="card">
							<a href="Lap-trinh-ke-hoach-kinh-doanh-hieu-qua.html"
								class="motsanpham" style="text-decoration: none; color: black;"
								d	ata-toggle="tooltip" data-placement="bottom"
								title="${bsb.name}"> <img
								class="card-img-top anh"
								src="${"user/images/"}${bsb.image.name}"
								width="206px"
								height="206px"
								onerror="this.onerror=null;this.src='${"user/images/default.jpg"}';"
								alt="${bsb.name}">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">${bsb.name}</h3>
									<small class="tacgia text-muted">${bsb.author.name}</small>
									<div class="gia d-flex align-items-baseline">
										<c:set var="sales" value="${BookDAO.getSalesByBookNotExpired(bsb.id)}" />
										<c:choose>
											<c:when test="${sales != -1}">
												<div class="giamoi">${bsb.salePrice*(100-sales)/100}₫</div>
												<div class="giacu text-muted">${bsb.salePrice}₫</div>
												<div class="sale">-${sales}%</div>
											</c:when>
											<c:otherwise>
												<div class="giamoi text-muted">${bsb.salePrice}₫</div>
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

	<!-- khoi sach sap phathanh  -->
	<section class="_1khoi sapphathanh mt-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
						<h2 class="header text-uppercase" style="font-weight: 400;">COMBO SÁCH HOT - SÁCH GIẢM GIÁ</h2>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
				</div>
				<div class="khoisanpham">
					<c:forEach items="${bestDiscountBooks}" var="bdb">
						<!-- 1 san pham -->
						<div class="card">
							<a href="Lap-trinh-ke-hoach-kinh-doanh-hieu-qua.html"
								class="motsanpham" style="text-decoration: none; color: black;"
								d	ata-toggle="tooltip" data-placement="bottom"
								title="${bdb.name}"> <img
								class="card-img-top anh"
								src="${"user/images/"}${bdb.image.name}"
								width="206px"
								height="206px"
								onerror="this.onerror=null;this.src='${"user/images/default.jpg"}';"
								alt="${bdb.name}">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">${bdb.name}</h3>
									<small class="tacgia text-muted">${bdb.author.name}</small>
									<div class="gia d-flex align-items-baseline">
										<c:set var="sales" value="${BookDAO.getSalesByBookNotExpired(bdb.id)}" />
										<c:choose>
											<c:when test="${sales != -1}">
												<div class="giamoi">${bdb.salePrice*(100-sales)/100}₫</div>
												<div class="giacu text-muted">${bdb.salePrice}₫</div>
												<div class="sale">-${sales}%</div>
											</c:when>
											<c:otherwise>
												<div class="giamoi text-muted">${bdb.salePrice}₫</div>
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