<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.BookDAO"%>
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

<link rel="stylesheet" href="user/css/sach-moi-tuyen-chon.css">
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

	<!-- menu home  -->
	<jsp:include page="_menu.jsp"></jsp:include>

	<!-- breadcrumb  -->
	<section class="breadcrumbbar">
		<div class="container">
			<ol class="breadcrumb mb-0 p-0 bg-transparent">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
				<li class="breadcrumb-item active"><a
					href="">${bookgrenrename}</a></li>
			</ol>
		</div>
	</section>

	<!-- ảnh banner -->
	<!--<section class="banner">
		<div class="container">
			<a href="sach-moi-tuyen-chon.html"><img
				src="user/images/sach-moi-full-banner.jpg"
				alt="sach-moi-full-banner" class="img-fluid"></a>
		</div>
	</section>-->

	<!-- các sản phẩm  -->
	<section class="content my-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="items">
					<div class="row">
						<c:forEach items="${bookgrenres}" var="bg">
							<div class="col-lg-3 col-md-4 col-xs-6">
								<!-- 1 sản phẩm  -->
								<div class="card">
									<a href="book?action=&book_id=${bg.id}" class="motsanpham"
										style="text-decoration: none; color: black;"
										data-toggle="tooltip" data-placement="bottom"
										title="${bg.name}"> <img class="card-img-top anh" src="${"
										user/images/"}${bg.image.name}"
										onerror="this.onerror=null;this.src='${"user/images/default.jpg"}';"
										alt="${bg.name}">>
										<div class="card-body noidungsp mt-3">
											<h6 class="card-title ten">${bg.name}</h6>
											<small class="tacgia text-muted">${bg.author.name}</small>
											<div class="gia d-flex align-items-baseline">
												<c:set var="sales"
													value="${BookDAO.getSalesByBookNotExpired(bg.id)}" />
												<c:choose>
													<c:when test="${sales != -1}">
														<div class="giamoi">${bg.salePrice*(100-sales)/100}₫</div>
														<div class="giacu text-muted">${bg.salePrice}₫</div>
														<div class="sale">-${sales}%</div>
													</c:when>
													<c:otherwise>
														<div class="giamoi text-muted">${bg.salePrice}₫</div>
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
													<span class="text-muted">0 nhận xét</span>
												</ul>
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- pagination bar  -->
				<div class="pagination-bar my-3">
					<div class="row">
						<div class="col-12">
							<nav>
								<ul class="pagination justify-content-center">
									<!-- <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li> -->
									<li class="page-item active"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&rsaquo;</span>
											<span class="sr-only">Next</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											<span class="sr-only">Next</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>

				<!--het khoi san pham-->
			</div>
			<!--het div noidung-->
		</div>
		<!--het container-->
	</section>

	<!-- footer  -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>

</html>