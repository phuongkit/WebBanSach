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

	<!-- giao di???n gi??? h??ng  -->
	<section class="content my-3">
		<div class="container">
			<div class="cart-page bg-white">
				<div class="row">
					<c:choose>
						<c:when test="${loginedUser==null}">
							<!-- giao di???n gi??? h??ng khi ch??a ????ng nh???p  -->
							<div class="col-md-8 cart-empty" style="float: right;">
								<div class="py-3 pl-3">
									<h6 class="header-gio-hang">
										GI??? H??NG C???A B???N <span>(0 s???n ph???m)</span>
									</h6>
									<div
										class="cart-empty-content w-100 text-center justify-content-center">
										<img src="user/images/shopping-cart-not-product.png"
											alt="shopping-cart-not-product">
										<p>B???n ch??a ????ng nh???p v??o Web! Vui l??ng ????ng nh???p tr?????c!</p>
										<a href="${pageContext.request.contextPath}"
											class="btn nutmuathem mb-3">V??? trang ch???</a>
									</div>
								</div>
							</div>
							<!-- giao di???n ph???n thanh to??n n???m b??n ph???i  -->
							<div class="col-md-4 cart-steps pl-0">
								<div id="cart-steps-accordion" role="tablist"
									aria-multiselectable="true">
									<!-- ????ng nh???p ho???c ????ng k?? -->
									<div class="card">
										<div class="card-header cardheader" role="tab"
											id="step1header">
											<h5 class="mb-0">
												<a data-toggle="collapse"
													data-parent="#cart-steps-accordion" href="#step1contentid"
													aria-expanded="true" aria-controls="step1contentid"
													class="text-uppercase header"> <span class="label">KH??CH
														H??NG M???I / ????NG NH???P</span> <i
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
															aria-controls="nav-dangnhap" aria-selected="true">????ng
															nh???p</a> <a
															class="nav-item nav-link text-center text-uppercase"
															id="nav-dangky-tab" data-toggle="tab" href="#nav-dangky"
															role="tab" aria-controls="nav-dangky"
															aria-selected="false">????ng k??</a>
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
																	placeholder="Nh???p t??n ????ng nh???p" name="username"
																	value="${user.username}" required autofocus>
															</div>
															<div class="form-label-group">
																<input type="password" id="inputPassword"
																	class="form-control" placeholder="M???t kh???u"
																	name="password" value="${user.password}" required>
															</div>
															<div class="custom-control custom-checkbox mb-3">
																<a href="#" class="float-right text-decoration-none"
																	style="color: #F5A623">Qu??n m???t kh???u</a>
															</div>
															<button
																class="btn btn-lg btn-block btn-signin text-uppercase text-white"
																type="submit" style="background: #F5A623">????ng
																nh???p</button>

															<hr class="my-4">
															<!--<button
																class="btn btn-lg btn-google btn-block text-uppercase"
																type="submit">
																<i class="fab fa-google mr-2"></i> ????ng nh???p b???ng Google
															</button>
															<button
																class="btn btn-lg btn-facebook btn-block text-uppercase"
																type="submit">
																<i class="fab fa-facebook-f mr-2"></i> ????ng nh???p b???ng
																Facebook
															</button>-->
														</form>
													</div>
													<div class="tab-pane fade" id="nav-dangky" role="tabpanel"
														aria-labelledby="nav-dangky-tab">
														<form id="form-signup-cart" class="form-signin mt-2"
															method="POST"
															action="${pageContext.request.contextPath}/register">
															<div class="form-label-group">
																<input type="text" id="regFullName" class="form-control"
																	placeholder="Nh???p h??? v?? t??n" name="regFullName"
																	required autofocus>
															</div>
															<div class="form-label-group">
																<input type="text" id="regPhone" class="form-control"
																	placeholder="Nh???p s??? ??i???n tho???i" name="regPhone"
																	required>
															</div>
															<div class="form-label-group">
																<input type="email" id="regEmail" class="form-control"
																	placeholder="Nh???p ?????a ch??? email" name="regEmail"
																	required>
															</div>

															<div class="form-label-group">
																<input type="text" id="regAddress" class="form-control"
																	placeholder="Nh???p ?????a ch???" name="regAddress" required>
															</div>

															<div class="form-label-group">
																<input type="text" id="regUsername" class="form-control"
																	placeholder="Nh???p t??n ????ng nh???p" name="regUsername"
																	required>
															</div>

															<div class="form-label-group">
																<input type="password" id="regPassword"
																	class="form-control" placeholder="Nh???p m???t kh???u"
																	name="regPassword" required>
															</div>
															<div class="form-label-group mb-3">
																<input type="password" id="regConfirmPassword"
																	class="form-control" name="regconfirm_password"
																	placeholder="Nh???p l???i m???t kh???u" required>
															</div>
															<div class="custom-control custom-checkbox mb-3">
																<p class="text-center">B???ng vi???c ????ng k??, b???n ????
																	?????ng ?? v???i DealBook v???</p>
																<a href="#" class="text-decoration-none text-center"
																	style="color: #F5A623">??i???u kho???n d???ch v??? & Ch??nh
																	s??ch b???o m???t</a>
															</div>
															<hr class="mt-3 mb-2">
															<button
																class="btn btn-lg btn-block btn-signin text-uppercase text-white mt-3"
																type="submit" style="background: #F5A623">????ng
																k??</button>

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
									<!-- giao di???n gi??? h??ng khi kh??ng c?? item  -->
									<div class="col-12 cart-empty">
										<div class="py-3 pl-3">
											<h6 class="header-gio-hang">
												GI??? H??NG C???A B???N <span>(0 s???n ph???m)</span>
											</h6>
											<div
												class="cart-empty-content w-100 text-center justify-content-center">
												<img src="user/images/shopping-cart-not-product.png"
													alt="shopping-cart-not-product">
												<p>Ch??a c?? s???n ph???m n??o trong gi??? h??ng c???a b???n</p>
												<a href="index.html" class="btn nutmuathem mb-3">Mua
													th??m</a>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<!-- giao di???n gi??? h??ng khi c?? h??ng (ph???n comment m??u xanh b??n d?????i l?? ph???n 2 s???n ph???m trong gi??? h??ng nh??ng gi??? ???? demo b???ng jquery) -->
									<div class="col-md-8 cart">
										<div class="cart-content py-3 pl-3">
											<h6 class="header-gio-hang">
												GI??? H??NG C???A B???N <span>(${countcart} s???n ph???m)</span>
											</h6>
											<div class="cart-list-items">
												<c:forEach items="${carts}" var="cart">
													<div class="cart-item d-flex">
														<c:set var="book" value="${cart.book}" />
														<div style="margin: auto auto; display: flex;">
															<input name="${"cart"}${cart.id}"
																style="padding: 0 12px 0;" type="checkbox"
																value="?????t h??ng"> <label
																style="padding: 0 12px 16px;">?????t</label>
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
																			???</div>
																		<div class="giacu">${book.salePrice}???</div>
																	</c:when>
																	<c:otherwise>
																		<div class="giamoi" style="color: black;">${book.salePrice*(100-sales)/100}
																			???</div>
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
														class="btn nutmuathem mb-3">Mua th??m</a>
												</div>
												<div class="col-md-5 offset-md-4">
													<div class="tonggiatien">
														<div class="group d-flex justify-content-between">
															<p class="label">T???m t??nh:</p>
															<p class="tamtinh">328.000 ???</p>
														</div>
														<div class="group d-flex justify-content-between">
															<p class="label">Gi???m gi??:</p>
															<p class="giamgia">0 ???</p>
														</div>
														<div class="group d-flex justify-content-between">
															<p class="label">Ph?? v???n chuy???n:</p>
															<p class="phivanchuyen">0 ???</p>
														</div>
														<div class="group d-flex justify-content-between">
															<p class="label">Ph?? d???ch v???:</p>
															<p class="phidicvu">0 ???</p>
														</div>
														<div
															class="group d-flex justify-content-between align-items-center">
															<strong class="text-uppercase">T???ng c???ng:</strong>
															<p class="tongcong">328.000 ???</p>
														</div>
														<small class="note d-flex justify-content-end text-muted">
															(Gi?? ???? bao g???m VAT) </small>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- giao di???n ph???n thanh to??n n???m b??n ph???i  -->
									<div class="col-md-4 cart-steps pl-0">
										<div id="cart-steps-accordion" role="tablist"
											aria-multiselectable="true">

											<!-- nh???p ?????a ch??? giao h??ng  -->
											<div class="card">
												<div class="card-header" role="tab" id="step2header">
													<h5 class="mb-0">
														<a data-toggle="collapse"
															data-parent="#cart-steps-accordion"
															href="#step2contentid" aria-expanded="true"
															aria-controls="step2contentid"
															class="text-uppercase header"><span class="steps">1</span>
															<span class="label">?????a ch??? giao h??ng</span> <i
															class="fa fa-chevron-right float-right"></i> </a>
													</h5>
												</div>
												<div id="step2contentid" class="collapse in" role="tabpanel"
													aria-labelledby="step2header" class="stepscontent">
													<div class="card-body">
														<form class="form-diachigiaohang">
															<div class="form-label-group">
																<input type="text" id="inputName" class="form-control"
																	placeholder="Nh???p h??? v?? t??n" value="${orderName}"
																	name="name" id="ordername" required autofocus>
															</div>
															<div class="form-label-group">
																<input type="text" id="inputPhone" class="form-control"
																	placeholder="Nh???p s??? ??i???n tho???i" value="${orderPhone}"
																	name="phone" id="orderphone" required>
															</div>
															<div class="form-label-group">
																<input type="text" id="inputAddress"
																	class="form-control"
																	placeholder="Nh???p ?????a ch??? giao h??ng"
																	value="${orderAddress}" name="address" id="orderaddress" required>
															</div>
															<div class="form-label-group">
																<textarea type="text" id="inputNote"
																	class="form-control"
																	placeholder="Nh???p ghi ch?? (N???u c??)" name="note" id="ordernote"></textarea>
															</div>
														</form>
													</div>
												</div>

												<!-- b?????c 2: thanh to??n ?????t mua  -->
												<div class="card">
													<div class="card-header" role="tab" id="step3header">
														<h5 class="mb-0">
															<a data-toggle="collapse"
																data-parent="#cart-steps-accordion"
																href="#step3contentid" aria-expanded="true"
																aria-controls="step3contentid"
																class="text-uppercase header"><span class="steps">2</span>
																<span class="label">Thanh to??n ?????t mua</span> <i
																class="fa fa-chevron-right float-right"></i> </a>
														</h5>
													</div>
													<div id="step3contentid" class="collapse in"
														role="tabpanel" aria-labelledby="step3header"
														class="stepscontent">
														<div class="card-body" style="padding: 15px;">
															<form id="orders">
																<div class="goigiaohang">
																	<h6 class="header text-uppercase">Ch???n g??i giao
																		h??ng</h6>
																	<c:forEach items="${shippingMethods}"
																		var="shippingMethod">
																		<div class="option">
																			<input id="${"ship"}${shippingMethod.id}" 
																				type="radio"
																				name="goigiaohang" id="ghtc" checked> <label
																				for="ghtc">${shippingMethod.name}</label>
																			<p>${shippingMethod.description}</p>
																		</div>
																	</c:forEach>
																</div>
																<hr>
																<div class="pttt">
																	<h6 class="header text-uppercase">Ch???n ph????ng th???c
																		thanh to??n</h6>
																	<c:forEach items="${payments}" var="payment">
																		<div class="option mb-2">
																			<input id="${" pay"}${payment.id}" type="radio"
																				name="pttt" id="cod" checked> <label
																				for="cod">${payment.name}</label>
																		</div>
																	</c:forEach>
																	<div>
																		<p class="mt-4">- Qu?? kh??ch ch??? chuy???n kho???n khi
																			???????c x??c nh???n c?? ????? s??ch qua ??i???n tho???i t??? DealBook.</p>
																		<p>- Th???i gian chuy???n kho???n l?? trong t???i ??a 2 ng??y
																			t??? khi c?? x??c nh???n ????? s??ch.</p>
																		<p>
																			- N???i dung chuy???n kho???n c???n ghi: <a href="#">[M??
																				????n h??ng]</a> ; ho???c <a href="#">[s??? ??i???n tho???i d??ng
																				?????t h??ng]</a>
																		</p>
																		<p>
																			- Xem th??ng tin chuy???n kho???n c???a NetaBooks <a
																				href="#">t???i ????y</a>
																		</p>
																	</div>
																</div>
																<hr>
																<button type="submit"
																	class="btn btn-lg btn-block btn-checkout text-uppercase text-white"
																	style="background: #F5A623">?????t mua</button>
																<p class="text-center note-before-checkout">(Vui
																	l??ng ki???m tra l???i ????n h??ng tr?????c khi ?????t Mua)</p>
															</form>
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

	<script>
		$("#orders").submit(function(event) {
			var someObj = {};
			someObj.fruitsGranted = [];
			someObj.fruitsDenied = [];
			var checkboxes = document.querySelectorAll('input[type=checkbox]');
			for (var i = 0; i < checkboxes.length; i++) {
				if(checkboxes[i].checked==false){
					someObj.fruitsDenied.push(checkboxes[i].name);
				}
				else{
					someObj.fruitsGranted.push(checkboxes[i].name);
				}
			}
			var name = document.getElementById("ordername");
			var phone = document.getElementById("orderphone");
			var address = document.getElementById("orderaddress");
			var note = document.getElementById("ordernote");
			$.ajax({
				type:'POST',
				url:'cart',
				data:{
					action : 'order',
					checkbox : JSON.stringify(someObj),
					name : name,
					phone : phone,
					address : address,
					note : note
				},
				dataType: 'JSON',
				success:function(data){
							
				}
			});
		});
	</script>

</body>

</html>