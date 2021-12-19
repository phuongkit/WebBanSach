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

<link rel="stylesheet" href="user/css/gio-hang.css">
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

	<!-- giao diện giỏ hàng  -->
	<section class="content my-3">
		<div class="container">
			<div class="cart-page bg-white">
				<div class="row">
					<c:choose>
						<c:when test="${loginedUser==null}">
							<!-- giao diện giỏ hàng khi chưa đăng nhập  -->
							<div class="col-md-8 cart-empty" style="float: right;">
								<div class="py-3 pl-3">
									<h6 class="header-gio-hang">
										GIỎ HÀNG CỦA BẠN <span>(0 sản phẩm)</span>
									</h6>
									<div
										class="cart-empty-content w-100 text-center justify-content-center">
										<img src="user/images/shopping-cart-not-product.png"
											alt="shopping-cart-not-product">
										<p>Bạn chưa đăng nhập vào Web! Vui lòng đăng nhập trước!</p>
										<a href="${pageContext.request.contextPath}"
											class="btn nutmuathem mb-3">Về trang chủ</a>
									</div>
								</div>
							</div>
							<!-- giao diện phần thanh toán nằm bên phải  -->
							<div class="col-md-4 cart-steps pl-0">
								<div id="cart-steps-accordion" role="tablist"
									aria-multiselectable="true">
									<!-- đăng nhập hoặc đăng ký -->
									<div class="card">
										<div class="card-header cardheader" role="tab"
											id="step1header">
											<h5 class="mb-0">
												<a data-toggle="collapse"
													data-parent="#cart-steps-accordion" href="#step1contentid"
													aria-expanded="true" aria-controls="step1contentid"
													class="text-uppercase header"> <span class="label">KHÁCH
														HÀNG MỚI / ĐĂNG NHẬP</span> <i
													class="fa fa-chevron-right float-right"></i>
												</a>
											</h5>
										</div>
										<div id="step1contentid" class="collapse in" role="tabpanel"
											aria-labelledby="step1header" class="stepscontent">
											<div class="card-body p-0">
												<nav>
													<div class="nav nav-tabs dangnhap-dangky" id="nav-tab"
														role="tablist">
														<a
															class="nav-item nav-link active text-center text-uppercase"
															id="nav-dangnhap-tab" data-toggle="tab"
															href="#nav-dangnhap" role="tab"
															aria-controls="nav-dangnhap" aria-selected="true">Đăng
															nhập</a> <a
															class="nav-item nav-link text-center text-uppercase"
															id="nav-dangky-tab" data-toggle="tab" href="#nav-dangky"
															role="tab" aria-controls="nav-dangky"
															aria-selected="false">Đăng ký</a>
													</div>
												</nav>
												<div class="tab-content" id="nav-tabContent">
													<div class="tab-pane fade show active" id="nav-dangnhap"
														role="tabpanel" aria-labelledby="nav-dangnhap-tab">
														<form id="form-signin-cart" class="form-signin mt-2"
															method="POST"
															action="${pageContext.request.contextPath}/login">
															<div class="form-label-group">
																<input type="text" class="form-control"
																	placeholder="Nhập tên đăng nhập" name="username"
																	value="${user.username}" required autofocus>
															</div>
															<div class="form-label-group">
																<input type="password" id="inputPassword"
																	class="form-control" placeholder="Mật khẩu"
																	name="password" value="${user.password}" required>
															</div>
															<div class="custom-control custom-checkbox mb-3">
																<a href="#" class="float-right text-decoration-none"
																	style="color: #F5A623">Quên mật khẩu</a>
															</div>
															<button
																class="btn btn-lg btn-block btn-signin text-uppercase text-white"
																type="submit" style="background: #F5A623">Đăng
																nhập</button>

															<hr class="my-4">
															<!--<button
																class="btn btn-lg btn-google btn-block text-uppercase"
																type="submit">
																<i class="fab fa-google mr-2"></i> Đăng nhập bằng Google
															</button>
															<button
																class="btn btn-lg btn-facebook btn-block text-uppercase"
																type="submit">
																<i class="fab fa-facebook-f mr-2"></i> Đăng nhập bằng
																Facebook
															</button>-->
														</form>
													</div>
													<div class="tab-pane fade" id="nav-dangky" role="tabpanel"
														aria-labelledby="nav-dangky-tab">
														<form id="form-signup-cart" class="form-signin mt-2" method="POST"
														action="${pageContext.request.contextPath}/register">
															<div class="form-label-group">
																<input type="text" id="regFullName" class="form-control"
																	placeholder="Nhập họ và tên" name="regFullName" required
																	autofocus>
															</div>
															<div class="form-label-group">
																<input type="text" id="regPhone" class="form-control"
																	placeholder="Nhập số điện thoại" name="regPhone" required>
															</div>
															<div class="form-label-group">
																<input type="email" id="regEmail" class="form-control"
																	placeholder="Nhập địa chỉ email" name="regEmail" required>
															</div>

															<div class="form-label-group">
																<input type="text" id="regAddress" class="form-control"
																	placeholder="Nhập địa chỉ" name="regAddress" required>
															</div>

															<div class="form-label-group">
																<input type="text" id="regUsername" class="form-control"
																	placeholder="Nhập tên đăng nhập" name="regUsername"
																	required>
															</div>

															<div class="form-label-group">
																<input type="password" id="regPassword"
																	class="form-control" placeholder="Nhập mật khẩu"
																	name="regPassword" required>
															</div>
															<div class="form-label-group mb-3">
																<input type="password" id="regConfirmPassword"
																	class="form-control" name="regconfirm_password"
																	placeholder="Nhập lại mật khẩu" required>
															</div>
															<div class="custom-control custom-checkbox mb-3">
																<p class="text-center">Bằng việc đăng ký, bạn đã
																	đồng ý với DealBook về</p>
																<a href="#" class="text-decoration-none text-center"
																	style="color: #F5A623">Điều khoản dịch vụ & Chính
																	sách bảo mật</a>
															</div>
															<hr class="mt-3 mb-2">
															<button
																class="btn btn-lg btn-block btn-signin text-uppercase text-white mt-3"
																type="submit" style="background: #F5A623">Đăng
																ký</button>

														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:set var="countcart" value="${carts.size()}" />
							<c:choose>
								<c:when test="${countcart == 0}">
									<!-- giao diện giỏ hàng khi không có item  -->
									<div class="col-12 cart-empty">
										<div class="py-3 pl-3">
											<h6 class="header-gio-hang">
												GIỎ HÀNG CỦA BẠN <span>(0 sản phẩm)</span>
											</h6>
											<div
												class="cart-empty-content w-100 text-center justify-content-center">
												<img src="user/images/shopping-cart-not-product.png"
													alt="shopping-cart-not-product">
												<p>Chưa có sản phẩm nào trong giở hàng của bạn</p>
												<a href="index.html" class="btn nutmuathem mb-3">Mua
													thêm</a>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<!-- giao diện giỏ hàng khi có hàng (phần comment màu xanh bên dưới là phần 2 sản phẩm trong giỏ hàng nhưng giờ đã demo bằng jquery) -->
									<div class="col-md-8 cart">
										<div class="cart-content py-3 pl-3">
											<h6 class="header-gio-hang">
												GIỎ HÀNG CỦA BẠN <span>(${countcart} sản phẩm)</span>
											</h6>
											<div class="cart-list-items">
												<c:forEach items="${carts}" var="cart">
													<div class="cart-item d-flex">
														<c:set var="book" value="${cart.book}" />
														<div style="margin: auto auto; display: flex;">
															<input style="padding: 0 12px 0;" type="checkbox"
																value="Đặt hàng"> <label
																style="padding: 0 12px 16px;">Đặt</label>
														</div>
														<a
															href="${pageContext.request.contextPath}/book?action=&book_id=${book.id}"
															class="img"> <img src="${"
															user/images/"}${book.image.name}"
															class="img-fluid"
															alt="anhsp1">
														</a>
														<div class="item-caption d-flex w-100">
															<div class="item-info ml-3">
																<a
																	href="${pageContext.request.contextPath}/book?action=&book_id=${book.id}"
																	class="ten">${book.name}</a>
																<div class="soluong d-flex">
																	<div class="input-number input-group mb-3">
																		<div class="input-group-prepend">
																			<span class="input-group-text btn-spin btn-dec">-</span>
																		</div>
																		<input type="text" value="${cart.quantity}"
																			class="soluongsp  text-center">
																		<div class="input-group-append">
																			<span class="input-group-text btn-spin btn-inc">+</span>
																		</div>
																	</div>
																</div>
															</div>
															<div
																class="item-price ml-auto d-flex flex-column align-items-end">
																<c:set var="sales"
																	value="${BookDAO.getSalesByBookNotExpired(book.id)}" />
																<c:choose>
																	<c:when test="${sales != -1 }">
																		<div class="giamoi">${book.salePrice*(100-sales)/100}
																			₫</div>
																		<div class="giacu">${book.salePrice}₫</div>
																	</c:when>
																	<c:otherwise>
																		<div class="giamoi" style="color: black;">${book.salePrice*(100-sales)/100}
																			₫</div>
																	</c:otherwise>
																</c:choose>
																<span class="remove mt-auto"><i
																	class="far fa-trash-alt"></i></span>
															</div>
														</div>
													</div>
												</c:forEach>
												<hr>
											</div>
											<div class="row">
												<div class="col-md-3">
													<a href="${pageContext.request.contextPath}"
														class="btn nutmuathem mb-3">Mua thêm</a>
												</div>
												<!--<div class="col-md-5 offset-md-4">
													<div class="tonggiatien">
														<div class="group d-flex justify-content-between">
															<p class="label">Tạm tính:</p>
															<p class="tamtinh">328.000 ₫</p>
														</div>
														<div class="group d-flex justify-content-between">
															<p class="label">Giảm giá:</p>
															<p class="giamgia">0 ₫</p>
														</div>
														<div class="group d-flex justify-content-between">
															<p class="label">Phí vận chuyển:</p>
															<p class="phivanchuyen">0 ₫</p>
														</div>
														<div class="group d-flex justify-content-between">
															<p class="label">Phí dịch vụ:</p>
															<p class="phidicvu">0 ₫</p>
														</div>
														<div
															class="group d-flex justify-content-between align-items-center">
															<strong class="text-uppercase">Tổng cộng:</strong>
															<p class="tongcong">328.000 ₫</p>
														</div>
														<small class="note d-flex justify-content-end text-muted">
															(Giá đã bao gồm VAT) </small>
													</div>
												</div>-->
											</div>
										</div>
									</div>
									<!-- giao diện phần thanh toán nằm bên phải  -->
									<div class="col-md-4 cart-steps pl-0">
										<div id="cart-steps-accordion" role="tablist"
											aria-multiselectable="true">

											<!-- nhập địa chỉ giao hàng  -->
											<div class="card">
												<div class="card-header" role="tab" id="step2header">
													<h5 class="mb-0">
														<a data-toggle="collapse"
															data-parent="#cart-steps-accordion"
															href="#step2contentid" aria-expanded="true"
															aria-controls="step2contentid"
															class="text-uppercase header"><span class="steps">1</span>
															<span class="label">Địa chỉ giao hàng</span> <i
															class="fa fa-chevron-right float-right"></i> </a>
													</h5>
												</div>
												<div id="step2contentid" class="collapse in" role="tabpanel"
													aria-labelledby="step2header" class="stepscontent">
													<div class="card-body">
														<form class="form-diachigiaohang">
															<div class="form-label-group">
																<input type="text" id="inputName" class="form-control"
																	placeholder="Nhập họ và tên" value="${orderName}"
																	name="name" required autofocus>
															</div>
															<div class="form-label-group">
																<input type="text" id="inputPhone" class="form-control"
																	placeholder="Nhập số điện thoại" value="${orderPhone}"
																	name="phone" required>
															</div>
															<div class="form-label-group">
																<input type="text" id="inputAddress"
																	class="form-control"
																	placeholder="Nhập Địa chỉ giao hàng"
																	value="${orderAddress}" name="address" required>
															</div>
															<div class="form-label-group">
																<textarea type="text" id="inputNote"
																	class="form-control"
																	placeholder="Nhập ghi chú (Nếu có)" name="note"></textarea>
															</div>
														</form>
													</div>
												</div>

												<!-- bước 2: thanh toán đặt mua  -->
												<div class="card">
													<div class="card-header" role="tab" id="step3header">
														<h5 class="mb-0">
															<a data-toggle="collapse"
																data-parent="#cart-steps-accordion"
																href="#step3contentid" aria-expanded="true"
																aria-controls="step3contentid"
																class="text-uppercase header"><span class="steps">2</span>
																<span class="label">Thanh toán đặt mua</span> <i
																class="fa fa-chevron-right float-right"></i> </a>
														</h5>
													</div>
													<div id="step3contentid" class="collapse in"
														role="tabpanel" aria-labelledby="step3header"
														class="stepscontent">
														<div class="card-body" style="padding: 15px;">
															<div class="goigiaohang">
																<h6 class="header text-uppercase">Chọn gói giao
																	hàng</h6>
																<c:forEach items="${shippingMethods}"
																	var="shippingMethod">
																	<div class="option">
																		<input type="radio" name="goigiaohang" id="ghtc"
																			checked> <label for="ghtc">${shippingMethod.name}</label>
																		<p>${shippingMethod.description}</p>
																	</div>
																</c:forEach>
															</div>
															<hr>
															<div class="pttt">
																<h6 class="header text-uppercase">Chọn phương thức
																	thanh toán</h6>
																<c:forEach items="${payments}" var="payment">
																	<div class="option mb-2">
																		<input type="radio" name="pttt" id="cod" checked>
																		<label for="cod">${payment.name}</label>
																	</div>
																</c:forEach>
																<div>
																	<p class="mt-4">- Quý khách chỉ chuyển khoản khi
																		được xác nhận có đủ sách qua điện thoại từ DealBook.</p>
																	<p>- Thời gian chuyển khoản là trong tối đa 2 ngày
																		từ khi có xác nhận đủ sách.</p>
																	<p>
																		- Nội dung chuyển khoản cần ghi: <a href="#">[Mã
																			đơn hàng]</a> ; hoặc <a href="#">[số điện thoại dùng
																			đặt hàng]</a>
																	</p>
																	<p>
																		- Xem thông tin chuyển khoản của NetaBooks <a
																			href="#">tại đây</a>
																	</p>
																</div>
															</div>
															<hr>
															<button
																class="btn btn-lg btn-block btn-checkout text-uppercase text-white"
																style="background: #F5A623">Đặt mua</button>
															<p class="text-center note-before-checkout">(Vui lòng
																kiểm tra lại đơn hàng trước khi Đặt Mua)</p>
														</div>
													</div>
												</div>

											</div>

										</div>
									</div>
									<!-- het div cart-steps  -->
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- het row  -->
			</div>
			<!-- het cart-page  -->
		</div>
		<!-- het container  -->
	</section>
	<!-- het khoi content  -->

	<!-- footer  -->
	<jsp:include page="_footer.jsp"></jsp:include>



</body>

</html>