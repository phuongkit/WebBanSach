<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.BookDAO"%>
<!DOCTYPE html>
<html lang="li">

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
<script type="text/javascript" src="user/js/main.js"></script>
<link rel="stylesheet" href="user/fontawesome_free_5.13.0/css/all.css">
<link rel="stylesheet" href="user/fonts/themify-icons/themify-icons.css">

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
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}">Trang ch???</a></li>
				<li class="breadcrumb-item active"><a href="sach-kinh-te.html">${book.bookGrenre.name}</a></li>
			</ol>
		</div>
	</section>
	</section>

	<!-- n???i dung c???a trang  -->
	<section class="product-page mb-4">
		<div class="container">
			<!-- chi ti???t 1 s???n ph???m -->
			<div class="product-detail bg-white p-4">
				<div class="row">
					<!-- ???nh  -->
					<div class="col-md-5 khoianh">
						<div class="anhto mb-4" style="height: 425px;">
							<a class="active" href="${"
								user/images/"}${book.image.name}"
								data-fancybox="thumb-img">
								<img class="product-image" src="${"
								user/images/"}${book.image.name}"
								onerror="this.onerror=null;this.src='${"
								user/images/default.jpg"}';"
								alt="${book.name}"
								style="max-width: 425px; max-height: 425px;">
							</a> <a href="${"
								user/images/"}${book.image.name}"
								data-fancybox="thumb-img"></a>
						</div>
						<div class="imageSlider list-anhchitiet d-flex mb-4"
							style="margin-left: 2rem;">
							<c:forEach items="${bookImages}" var="bi">
								<c:choose>
									<c:when test="${bi.id == book.image.id}">
										<img class="thumb-img thumb1 mr-3" src="${"
											user/images/"}${bi.name}" class="img-fluid"
											onerror="this.onerror=null;this.src='${"
											user/images/default.jpg"}';"
											alt="${book.name}">
									</c:when>
									<c:otherwise>
										<img class="thumb-img thumb2" src="${"
											user/images/"}${bi.name}"
										class="img-fluid"
											onerror="this.onerror=null;this.src='${"
											user/images/default.jpg"}';"
											alt="${book.name}">
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<!-- th??ng tin s???n ph???m: t??n, gi?? b??a gi?? b??n ti???t ki???m, c??c khuy???n m??i, n??t ch???n mua.... -->
					<div class="col-md-7 khoithongtin">
						<div class="row">
							<div class="col-md-12 header">
								<h4 class="ten">${book.name}</h4>
								<div class="rate">
									<i class="fa fa-star active"></i> <i class="fa fa-star active"></i>
									<i class="fa fa-star active"></i> <i class="fa fa-star active"></i>
									<i class="fa fa-star "></i>
								</div>
								<hr>
							</div>
							<div class="col-md-7" style="position: relative;">
								<div class="gia">
									<c:set var="sales"
										value="${BookDAO.getSalesByBookNotExpired(book.id)}" />
									<c:choose>
										<c:when test="${sales != -1 }">
											<div class="giabia">
												Gi?? g???c:<span class="giacu ml-2">${book.salePrice} ???</span>
											</div>
											<div class="giaban">
												Gi?? b??n t???i DealBooks: <span class="giamoi font-weight-bold">
													${book.salePrice*(100-sales)/100} ???</span>
											</div>
											<div class="tietkiem">
												Ti???t ki???m: <b>${book.salePrice*sales/100} ???</b> <span
													class="sale">-${sales}%</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="giabia"></div>
											<div class="giaban">
												Gi?? b??n t???i DealBooks: <span class="giamoi font-weight-bold"
													style="margin-top: -20px; color: #000;">
													${book.salePrice} ???</span>
											</div>
											<div class="tietkiem">
												Ti???t ki???m: <b>0 ???</b>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="uudai my-3">
									<h6 class="header font-weight-bold">Khuy???n m??i & ??u ????i
										t???i DealBook:</h6>
									<ul>
										<li><b>Mi???n ph?? giao h??ng </b>cho ????n h??ng t??? 150.000?? ???
											TP.HCM v?? 300.000?? ??? T???nh/Th??nh kh??c <a href="#">>> Chi
												ti???t</a></li>
										<li><b>Combo s??ch HOT - GI???M 25% </b><a href="#">>>Xem
												ngay</a></li>
										<li>T???ng Bookmark cho m???i ????n h??ng</li>
										<li>Bao s??ch mi???n ph?? (theo y??u c???u)</li>
									</ul>
								</div>
								<form id="form" action="" method="post" onsubmit="return false">
									<div class="soluong d-flex">
										<label class="font-weight-bold">S??? l?????ng: </label>
										<div class="input-number input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text btn-spin btn-dec">-</span>
											</div>
											<input type="text" value="1" name="count"
												class="soluongsp  text-center" />
											<div class="input-group-append">
												<span class="input-group-text btn-spin btn-inc">+</span>
											</div>
										</div>
									</div>
									<input type="submit" class="nutmua btn w-100 text-uppercase"
										value="Ch???n mua" /> <input type="hidden" name="book_id"
										value="${book.id}" />
								</form>
								<div id="result"
									style="display: none; bottom: -70px; width: 340px; text-align: center; height: 180px; background-color: #000; opacity: 0.6; position: absolute; padding-top: 32px;">
									<a id="status"></a>
									<h3 id="resultstring"
										style="color: #fff; padding-top: 8px; font-size: 20px;"></h3>
								</div>
								<a class="huongdanmuahang text-decoration-none" href="#">(Vui
									l??ng xem h?????ng d???n mua h??ng)</a> <small class="share">Share:
								</small>
								<div class="fb-like"
									data-href="https://www.facebook.com/DealBook-110745443947730/"
									data-width="300px" data-layout="button" data-action="like"
									data-size="small" data-share="true"></div>
							</div>
							<!-- th??ng tin kh??c c???a s???n ph???m:  t??c gi???, ng??y xu???t b???n, k??ch th?????c ....  -->
							<div class="col-md-5">
								<div class="thongtinsach">
									<ul>
										<li>T??c gi???: <a href="#" class="tacgia">${book.author.name}</a></li>
										<li>Ng??y xu???t b???n: <b>${formatter.format(book.createdAt.getTime())}</b></li>
										<li>Nh?? xu???t b???n: ${book.supplier.name}</li>
										<li>S??? l?????ng hi???n c??: <span id="soluongsach">${book.quantityAvailable}</span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<!-- decripstion c???a 1 s???n ph???m: gi???i thi???u , ????nh gi?? ?????c gi???  -->
					<div class="product-description col-md-9">
						<!-- 2 tab ??? tr??n  -->
						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active text-uppercase"
									id="nav-gioithieu-tab" data-toggle="tab" href="#nav-gioithieu"
									role="tab" aria-controls="nav-gioithieu" aria-selected="true">Gi???i
									thi???u</a> <a class="nav-item nav-link text-uppercase"
									id="nav-danhgia-tab" data-toggle="tab" href="#nav-danhgia"
									role="tab" aria-controls="nav-danhgia" aria-selected="false">????nh
									gi?? c???a ?????c gi???</a>
							</div>
						</nav>
						<!-- n???i dung c???a t???ng tab  -->
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active ml-3" id="nav-gioithieu"
								role="tabpanel" aria-labelledby="nav-gioithieu-tab">
								<h6 class="tieude font-weight-bold">${book.name}</h6>
								<p>
									<span>${book.description}</span>
								</p>
							</div>
							<div class="tab-pane fade" id="nav-danhgia" role="tabpanel"
								aria-labelledby="nav-danhgia-tab">
								<div class="row">
									<div class="col-md-3 text-center">
										<p class="tieude">????nh gi?? trung b??nh</p>
										<div class="diem">0/5</div>
										<div class="sao">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p class="sonhanxet text-muted">(0 nh???n x??t)</p>
									</div>
									<div class="col-md-5">
										<div class="tiledanhgia text-center">
											<div class="motthanh d-flex align-items-center">
												5 <i class="fa fa-star"></i>
												<div class="progress mx-2">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												0%
											</div>
											<div class="motthanh d-flex align-items-center">
												4 <i class="fa fa-star"></i>
												<div class="progress mx-2">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												0%
											</div>
											<div class="motthanh d-flex align-items-center">
												3 <i class="fa fa-star"></i>
												<div class="progress mx-2">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												0%
											</div>
											<div class="motthanh d-flex align-items-center">
												2 <i class="fa fa-star"></i>
												<div class="progress mx-2">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												0%
											</div>
											<div class="motthanh d-flex align-items-center">
												1 <i class="fa fa-star"></i>
												<div class="progress mx-2">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												0%
											</div>
											<div class="btn vietdanhgia mt-3">Vi???t ????nh gi?? c???a b???n</div>
										</div>
										<!-- n???i dung c???a form ????nh gi??  -->
										<div class="formdanhgia">
											<h6 class="tieude text-uppercase">G???I ????NH GI?? C???A B???N</h6>
											<span class="danhgiacuaban">????nh gi?? c???a b???n v??? s???n
												ph???m n??y:</span>
											<div
												class="rating d-flex flex-row-reverse align-items-center justify-content-end">
												<input type="radio" name="star" id="star1"><label
													for="star1"></label> <input type="radio" name="star"
													id="star2"><label for="star2"></label> <input
													type="radio" name="star" id="star3"><label
													for="star3"></label> <input type="radio" name="star"
													id="star4"><label for="star4"></label> <input
													type="radio" name="star" id="star5"><label
													for="star5"></label>
											</div>
											<div class="form-group">
												<input type="text" class="txtFullname w-100"
													placeholder="M???i b???n nh???p t??n(B???t bu???c)">
											</div>
											<div class="form-group">
												<input type="text" class="txtEmail w-100"
													placeholder="M???i b???n nh???p email(B???t bu???c)">
											</div>
											<div class="form-group">
												<input type="text" class="txtComment w-100"
													placeholder="????nh gi?? c???a b???n v??? s???n ph???m n??y">
											</div>
											<div class="btn nutguibl">G???i b??nh lu???n</div>
										</div>
									</div>
								</div>
							</div>
							<hr>
							<!-- het tab nav-danhgia  -->
						</div>
						<!-- het tab-content  -->
					</div>
					<!-- het product-description -->
				</div>
				<!-- het row  -->
			</div>
			<!-- het product-detail -->
		</div>
		<!-- het container  -->
	</section>
	<!-- het product-page -->

	<!-- kh???i s???n ph???m t????ng t??? -->
	<section class="_1khoi sachmoi">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light pt-4">
						<h5 class="header text-uppercase" style="font-weight: 400;">S???n
							ph???m c??ng th??? lo???i</h5>
						<a href="sach-moi-tuyen-chon.html"
							class="btn btn-warning btn-sm text-white">Xem t???t c???</a>
					</div>
				</div>
				<div class="khoisanpham" style="padding-bottom: 2rem;">
					<c:forEach items="${referencesBooks}" var="rb">
						<!-- 1 s???n ph???m -->
						<div class="card">
							<a href="book?action=&book_id=${rb.id}"
								class="motsanpham" style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="${rb.name}"> <img
								class="card-img-top anh"
								src="${"user/images/"}${rb.image.name}"
								onerror="this.onerror=null;this.src='${"user/images/default.jpg"}';"
								alt="${rb.name}">
								<div class="card-body noidungsp mt-3">
									<h6 class="card-title ten">${rb.name}</h6>
									<small class="tacgia text-muted">${rb.author.name}</small>
									<div class="gia d-flex align-items-baseline">
										<c:set var="sales" value="${BookDAO.getSalesByBookNotExpired(rb.id)}" />
										<c:choose>
											<c:when test="${sales != -1}">
												<div class="giamoi">${rb.salePrice*(100-sales)/100}???</div>
												<div class="giacu text-muted">${rb.salePrice}???</div>
												<div class="sale">-${sales}%</div>
											</c:when>
											<c:otherwise>
												<div class="giamoi text-muted">${rb.salePrice}???</div>
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
											<li><span class="text-muted">0 nh???n x??t</span></li>
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

	<script>
		/* attach a submit handler to the form */
		$("#form").submit(function(event) {

			/* stop form from submitting normally */
			event.preventDefault();

			/* get the action attribute from the <form action=""> element */
			var $form = $(this), url = $form.attr('action');

			/* Send the data using post with element id name and name2*/
			var posting = $.post(url, {
				book_id : $("input[name='book_id']").val(),
				count : $("input[name='count']").val()
			});

			/* Alerts the results */
			posting.done(function(data) {
				var result = document.getElementById("result");
				var status = document.getElementById("status");
				result.style.display = 'block';
				status.classList.add('success');
				status.classList.add('ti-arrow-circle-down');
				$('#resultstring').text(data[0]);
				$('#soluongsach').text(data[1]);
				setTimeout(function() {
					result.style.display = 'none';
				}, 2000);
			});
			posting.fail(function() {
				var result = document.getElementById("result");
				var status = document.getElementById("status");
				status.classList.add('ti-na');
				status.classList.add('fail');
				result.style.display = 'block';
				$('#resultstring').text(data[0]);
				setTimeout(function() {
					result.style.display = 'none';
				}, 2000);
			});
		});
	</script>

	<!-- footer  -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>