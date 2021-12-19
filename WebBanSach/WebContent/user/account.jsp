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

	<!-- menu home  -->
	<jsp:include page="_menu.jsp"></jsp:include>

	<!-- nội dung của trang  -->
	<section class="account-page my-3">
		<div class="container">
			<div class="page-content bg-white">
				<div class="account-page-tab-content m-4">
					<!-- 2 tab: thông tin tài khoản, danh sách đơn hàng  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-taikhoan-tab"
								data-toggle="tab" href="#nav-taikhoan" role="tab"
								aria-controls="nav-home" aria-selected="true">Thông tin tài
								khoản</a> <a class="nav-item nav-link" id="nav-donhang-tab"
								data-toggle="tab" href="#nav-donhang" role="tab"
								aria-controls="nav-profile" aria-selected="false">Danh sách
								đơn hàng</a>
						</div>
					</nav>

					<!-- nội dung 2 tab -->
					<div class="tab-content">
							<!-- nội dung tab 1: thông tin tài khoản  -->
							<div class="tab-pane fade show active pl-4 " id="nav-taikhoan"
								role="tabpanel" aria-labelledby="nav-taikhoan-tab">
								<div class="offset-md-4 mt-3">
									<h3 class="account-header">Thông tin tài khoản</h3>
								</div>
								<form id="update-account" action="" method="post">
								<div class="hoten my-3 form-label-group">
									<div class="row">
										<label class="col-md-2 offset-md-2 " for="account-hoten">Họ
											tên</label> <input id="fullname" class="col-md-4" type="text" value="${fullname}"
											name="fullname" required autofocus>	
									</div>
								</div>
								<div class="hoten my-3">
									<div class="row">
										<label class="col-md-2 offset-md-2" for="account-hoten">Số
											điện thoại</label> <input id="phone" class="col-md-4" type="text"
											value="${phone}" name="phone" required>
									</div>
								</div>
								<div class="hoten my-3">
									<div class="row">
										<label class="col-md-2 offset-md-2" for="account-hoten">Địa
											chỉ email</label> <input id="email" class="col-md-4" type="text" name="email"
											value="${email}" required>
									</div>
								</div>
								<div class="hoten my-3">
									<div class="row">
										<label class="col-md-2 offset-md-2" for="account-hoten">Địa
											chỉ</label> <input id="address" class="col-md-4" type="text" value="${address}"
											name="address" required>
									</div>
								</div>
								<div class="email my-3">
									<div class="row">
										<label class="col-md-2 offset-md-2" for="account-email">Tên
											đăng nhập</label> <input class="col-md-4" type="text" name="username"
											disabled="disabled" value="${username}">
									</div>
								</div>
								<div class="thay-doi-mk">
									<div class="mkcu my-3">
										<div class="row">
											<label class="col-md-2 offset-md-2" for="account-mkcu">Mật
												khẩu cũ</label> <input id="oldpassword" class="col-md-4" type="password"
												name="oldpassword" >
										</div>
									</div>
									<div class="mkmoi my-3">
										<div class="row">
											<label class="col-md-2 offset-md-2" for="account-mkmoi">Mật
												khẩu mới</label> <input id="newpassword" class="col-md-4" type="password"
												name="newpassword">
										</div>
									</div>
									<div class="xacnhan-mkmoi my-3">
										<div class="row">
											<label class="col-md-2 offset-md-2"
												for="account-xacnhan-mkmoi">Xác nhận mật khẩu</label> <input
												id="confirm_newpassword" class="col-md-4" type="password" name="confirm_newpassword">
										</div>
									</div>
									<div class="capnhat my-3">
										<div class="row">
											<button type="submit"
												class="button-capnhat text-uppercase offset-md-4 btn btn-warning mb-4">Cập
												nhật</button>
										</div>
									</div>
									</form>
								</div>
							</div>
						<!-- nội dung tab 2: danh sách đơn hàng -->
						<div class="tab-pane fade py-3" id="nav-donhang" role="tabpanel"
							aria-labelledby="nav-donhang-tab">
							<div class="donhang-table">
								<table class="m-auto">
									<tr style="background-color: skyblue;">
										<th>Mã đơn hàng</th>
										<th>Ngày mua</th>
										<th>Sản phẩm</th>
										<th>Tổng tiền</th>
										<th>Phương thức vận chuyển</th>
										<th>Phương thức thanh toán</th>
										<th>Trạng thái đơn hàng</th>
									</tr>
									<c:forEach items="${orders}" var="order">
									<tr >
										<th>${order.id}</th>
										<th>${order.createdAt}</th>
										<c:set var="carts" value="${CartDAO.getCartByOrder(order.id)}" />
										<th>
										<c:forEach items="${carts}" var="cart">
										${cart.book.name}|${cart.quantity}</br>
										</c:forEach>
										</th>
										<th>${OrderDAO.getTotalMoneyByOrder(order.id)}</th>
										<th>${order.shippingMethod.name}</th>
										<th>${order.payment.name}</th>
										<th>${order.deliveryStatus.name}</th>
									</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer  -->
	<jsp:include page="_footer.jsp"></jsp:include>

</body>

</html>