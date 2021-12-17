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

	<!-- nội dung của trang  -->
	<section class="product-page mb-4">
		<div class="container">
			<!-- chi tiết 1 sản phẩm -->
			<div class="product-detail bg-white p-4">
				<div class="row">
					<!-- ảnh  -->
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
					<!-- thông tin sản phẩm: tên, giá bìa giá bán tiết kiệm, các khuyến mãi, nút chọn mua.... -->
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
							<div class="col-md-7">
								<div class="gia">
									<c:set var="sales"
										value="${BookDAO.getSalesByBookNotExpired(book.id)}" />
									<c:choose>
										<c:when test="${sales != -1 }">
											<div class="giabia">
												Giá gốc:<span class="giacu ml-2">${book.salePrice} ₫</span>
											</div>
											<div class="giaban">
												Giá bán tại DealBooks: <span class="giamoi font-weight-bold">
													${book.salePrice*(100-sales)/100} ₫</span>
											</div>
											<div class="tietkiem">
												Tiết kiệm: <b>${book.salePrice*sales/100} ₫</b> <span
													class="sale">-${sales}%</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="giabia"></div>
											<div class="giaban">
												Giá bán tại DealBooks: <span class="giamoi font-weight-bold"
													style="margin-top: -20px; color: #000;">
													${book.salePrice} ₫</span>
											</div>
											<div class="tietkiem">
												Tiết kiệm: <b>0 ₫</b>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="uudai my-3">
									<h6 class="header font-weight-bold">Khuyến mãi & Ưu đãi
										tại DealBook:</h6>
									<ul>
										<li><b>Miễn phí giao hàng </b>cho đơn hàng từ 150.000đ ở
											TP.HCM và 300.000đ ở Tỉnh/Thành khác <a href="#">>> Chi
												tiết</a></li>
										<li><b>Combo sách HOT - GIẢM 25% </b><a href="#">>>Xem
												ngay</a></li>
										<li>Tặng Bookmark cho mỗi đơn hàng</li>
										<li>Bao sách miễn phí (theo yêu cầu)</li>
									</ul>
								</div>
								<form action="/cart" method="post">
									<div class="soluong d-flex">
										<label class="font-weight-bold">Số lượng: </label>
										<div class="input-number input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text btn-spin btn-dec">-</span>
											</div>
											<input type="text" value="1" class="soluongsp  text-center">
											<div class="input-group-append">
												<span class="input-group-text btn-spin btn-inc">+</span>
											</div>
										</div>
									</div>
									<button type="submit" class="nutmua btn w-100 text-uppercase">Chọn mua</button>
								</form>
								<a class="huongdanmuahang text-decoration-none" href="#">(Vui
									lòng xem hướng dẫn mua hàng)</a> <small class="share">Share:
								</small>
								<div class="fb-like"
									data-href="https://www.facebook.com/DealBook-110745443947730/"
									data-width="300px" data-layout="button" data-action="like"
									data-size="small" data-share="true"></div>
							</div>
							<!-- thông tin khác của sản phẩm:  tác giả, ngày xuất bản, kích thước ....  -->
							<div class="col-md-5">
								<div class="thongtinsach">
									<ul>
										<li>Tác giả: <a href="#" class="tacgia">${book.author.name}</a></li>
										<li>Ngày xuất bản: <b>${formatter.format(book.createdAt.getTime())}</b></li>
										<li>Nhà xuất bản: ${book.supplier.name}</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<!-- decripstion của 1 sản phẩm: giới thiệu , đánh giá độc giả  -->
					<div class="product-description col-md-9">
						<!-- 2 tab ở trên  -->
						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active text-uppercase"
									id="nav-gioithieu-tab" data-toggle="tab" href="#nav-gioithieu"
									role="tab" aria-controls="nav-gioithieu" aria-selected="true">Giới
									thiệu</a> <a class="nav-item nav-link text-uppercase"
									id="nav-danhgia-tab" data-toggle="tab" href="#nav-danhgia"
									role="tab" aria-controls="nav-danhgia" aria-selected="false">Đánh
									giá của độc giả</a>
							</div>
						</nav>
						<!-- nội dung của từng tab  -->
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
										<p class="tieude">Đánh giá trung bình</p>
										<div class="diem">0/5</div>
										<div class="sao">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p class="sonhanxet text-muted">(0 nhận xét)</p>
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
											<div class="btn vietdanhgia mt-3">Viết đánh giá của bạn</div>
										</div>
										<!-- nội dung của form đánh giá  -->
										<div class="formdanhgia">
											<h6 class="tieude text-uppercase">GỬI ĐÁNH GIÁ CỦA BẠN</h6>
											<span class="danhgiacuaban">Đánh giá của bạn về sản
												phẩm này:</span>
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
													placeholder="Mời bạn nhập tên(Bắt buộc)">
											</div>
											<div class="form-group">
												<input type="text" class="txtEmail w-100"
													placeholder="Mời bạn nhập email(Bắt buộc)">
											</div>
											<div class="form-group">
												<input type="text" class="txtComment w-100"
													placeholder="Đánh giá của bạn về sản phẩm này">
											</div>
											<div class="btn nutguibl">Gửi bình luận</div>
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

	<!-- khối sản phẩm tương tự -->
	<section class="_1khoi sachmoi">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light pt-4">
						<h5 class="header text-uppercase" style="font-weight: 400;">Sản
							phẩm tương tự</h5>
						<a href="sach-moi-tuyen-chon.html"
							class="btn btn-warning btn-sm text-white">Xem tất cả</a>
					</div>
				</div>
				<div class="khoisanpham" style="padding-bottom: 2rem;">
					<!-- 1 sản phẩm -->
					<div class="card">
						<a href="Lap-trinh-ke-hoach-kinh-doanh-hieu-qua.html"
							class="motsanpham" style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Lập Kế Hoạch Kinh Doanh Hiệu Quả"> <img
							class="card-img-top anh"
							src="images/lap-ke-hoach-kinh-doanh-hieu-qua.jpg"
							alt="lap-ke-hoach-kinh-doanh-hieu-qua">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Lập Kế Hoạch Kinh Doanh Hiệu Quả</h6>
								<small class="tacgia text-muted">Brian Finch</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a
							href="Ma-bun-luu-manh-va-nhung-cau-chuyen-khac-cua-nguyen-tri.html"
							class="motsanpham" style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Ma Bùn Lưu Manh Và Những Câu Chuyện Khác Của Nguyễn
                        Trí">
							<img class="card-img-top anh" src="images/ma-bun-luu-manh.jpg"
							alt="ma-bun-luu-manh">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Ma Bùn Lưu Manh Và Những Câu
									Chuyện Khác Của Nguyễn Trí</h6>
								<small class="tacgia text-muted">Nguyễn Trí</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">68.000 ₫</div>
									<div class="giacu text-muted">85.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Bank 4.0 - Giao dịch mọi nơi, không chỉ là ngân hàng">
							<img class="card-img-top anh" src="images/bank-4.0.jpg"
							alt="bank-4.0">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Bank 4.0 - Giao dịch mọi nơi,
									không chỉ là ngân hàng</h6>
								<small class="tacgia text-muted">Brett King</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Bộ Sách 500 Câu Chuyện Đạo Đức - Những Câu Chuyện
                        Tình Thân (Bộ 8 Cuốn)">
							<img class="card-img-top anh"
							src="images/bo-sach-500-cau-chuyen-dao-duc.jpg"
							alt="bo-sach-500-cau-chuyen-dao-duc">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Bộ Sách 500 Câu Chuyện Đạo Đức -
									Những Câu Chuyện Tình Thân (Bộ 8 Cuốn)</h6>
								<small class="tacgia text-muted">Nguyễn Hạnh - Trần Thị
									Thanh Nguyên</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Lịch Sử Ung Thư - Hoàng Đế Của Bách Bệnh"> <img
							class="card-img-top anh"
							src="images/ung-thu-hoang-de-cua-bach-benh.jpg"
							alt="ung-thu-hoang-de-cua-bach-benh">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Lịch Sử Ung Thư - Hoàng Đế Của
									Bách Bệnh</h6>
								<small class="tacgia text-muted">Siddhartha Mukherjee</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Cuốn Sách Khám Phá: Trời Đêm Huyền Diệu"> <img
							class="card-img-top anh" src="images/troi-dem-huyen-dieu.jpg"
							alt="troi-dem-huyen-dieu">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Cuốn Sách Khám Phá: Trời Đêm
									Huyền Diệu</h6>
								<small class="tacgia text-muted">Disney Learning</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Bộ Sách Những Câu Chuyện Cho Con Thành Người Tử Tế (Bộ 5 Cuốn)">
							<img class="card-img-top anh"
							src="images/bo-sach-nhung-cau-chuyen-cho-con-thanh-nguoi-tu-te.jpg"
							alt="bo-sach-nhung-cau-chuyen-cho-con-thanh-nguoi-tu-te">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Bộ Sách Những Câu Chuyện Cho Con
									Thành Người Tử Tế (Bộ 5 Cuốn)</h6>
								<small class="tacgia text-muted">Nhiều Tác Giả</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Lịch Sử Thế Giới"> <img class="card-img-top anh"
							src="images/lich-su-the-gioi.jpg" alt="lich-su-the-gioi">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Lịch Sử Thế Giới</h6>
								<small class="tacgia text-muted">Nam Phong tùng thư -
									Phạm Quỳnh chủ nhiệm</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
				</div>
			</div>
		</div>
	</section>

	<!-- khối sản phẩm đã xem  -->
	<section class="_1khoi combohot mt-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
						<h5 class="header text-uppercase" style="font-weight: 400;">Sản
							phẩm bạn đã xem</h5>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
				</div>
				<div class="khoisanpham">
					<!-- 1 sản phẩm -->
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Chuyện Nghề Và Chuyện Đời - Bộ 4 Cuốn"> <img
							class="card-img-top anh"
							src="images/combo-chuyen-nghe-chuyen-doi.jpg"
							alt="combo-chuyen-nghe-chuyen-doi">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Chuyện Nghề Và Chuyện Đời - Bộ 4
									Cuốn</h6>
								<small class="tacgia text-muted">Nguyễn Hữu Long</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Combo Mẹ Con Sư Tử - Bồ Tát Ngàn Tay Ngàn Mắt"> <img
							class="card-img-top anh"
							src="images/combo-me-con-su-tu-bo-tat-ngan-tay-ngan-mat.jpg"
							alt="combo-me-con-su-tu-bo-tat-ngan-tay-ngan-mat">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Combo Mẹ Con Sư Tử - Bồ Tát Ngàn
									Tay Ngàn Mắt</h6>
								<small class="tacgia text-muted">Thích Nhất Hạnh</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Combo Osho: Hạnh Phúc Tại Tâm, Can Đảm Biến Thách Thức Thành
                            Sức Mạnh & Sáng Tạo Bừng Cháy Sức Mạnh Bên Trong">
							<img class="card-img-top anh"
							src="images/combo-hanh-phuc-sang-tao.jpg"
							alt="combo-hanh-phuc-sang-tao">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Combo Osho: Hạnh Phúc Tại Tâm,
									Can Đảm Biến Thách Thức Thành Sức Mạnh & Sáng Tạo Bừng Cháy Sức
									Mạnh Bên Trong</h6>
								<small class="tacgia text-muted">Gosho Aoyama, Mutsuki
									Watanabe, Takahisa Taira</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Combo Giáo Dục Và Ý Nghĩa Cuộc Sống Và Bạn Đang Nghịch Gì Với Đời Mình?">
							<img class="card-img-top anh"
							src="images/combo-giao-duc-va-y-nghia-cuoc-song.jpg"
							alt="combo-giao-duc-va-y-nghia-cuoc-song">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Combo Giáo Dục Và Ý Nghĩa Cuộc
									Sống Và Bạn Đang Nghịch Gì Với Đời Mình?</h6>
								<small class="tacgia text-muted"> J.Krishnamurti</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Combo Dinh Dưỡng Xanh - Thần dược xanh"> <img
							class="card-img-top anh"
							src="images/combo-dinh-duong-than-duoc-xanh.jpg"
							alt="combo-dinh-duong-than-duoc-xanh">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Combo Dinh Dưỡng Xanh - Thần
									dược xanh</h6>
								<small class="tacgia text-muted">Ryu Seung-SunVictoria
									Boutenko</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Combo Ăn Xanh Để Khỏe - Sống Lành Để Trẻ"> <img
							class="card-img-top anh" src="images/combo-an-xanh-song-lanh.jpg"
							alt="combo-an-xanh-song-lanh">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Combo Ăn Xanh Để Khỏe - Sống
									Lành Để Trẻ</h6>
								<small class="tacgia text-muted">Norman W. Walker</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Combo Lược Sử Loài Người - Lược Sử Tương Lai - 21 Bài Học Cho Thế Kỷ 21">
							<img class="card-img-top anh"
							src="images/combo-luoc-su-loai-nguoi.jpg"
							alt="combo-luoc-su-loai-nguoi">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Combo Lược Sử Loài Người - Lược
									Sử Tương Lai - 21 Bài Học Cho Thế Kỷ 21</h6>
								<small class="tacgia text-muted">Yuval Noah Harari</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Bộ Sách Phong Cách Sống (Bộ 5 Cuốn)"> <img
							class="card-img-top anh" src="images/combo-phong-cach-song.jpg"
							alt="combo-phong-cach-song">
							<div class="card-body noidungsp mt-3">
								<h6 class="card-title ten">Bộ Sách Phong Cách Sống (Bộ 5
									Cuốn)</h6>
								<small class="tacgia text-muted">Marie Tourell
									Soderberg, Joanna Nylund, Yukari Mitsuhashi, Margareta
									Magnusson, Linnea Dunne</small>
								<div class="gia d-flex align-items-baseline">
									<div class="giamoi">111.200 ₫</div>
									<div class="giacu text-muted">139.000 ₫</div>
									<div class="sale">-20%</div>
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
				</div>
			</div>
		</div>
	</section>

	<!-- thanh cac dich vu :mien phi giao hang, qua tang mien phi ........ -->
	<section class="abovefooter text-white"
		style="background-color: #CF111A;">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="dichvu d-flex align-items-center">
						<img src="images/icon-books.png" alt="icon-books">
						<div class="noidung">
							<h6 class="tieude font-weight-bold">HƠN 14.000 TỰA SÁCH HAY</h6>
							<p class="detail">Tuyển chọn bởi DealBooks</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="dichvu d-flex align-items-center">
						<img src="images/icon-ship.png" alt="icon-ship">
						<div class="noidung">
							<h6 class="tieude font-weight-bold">MIỄN PHÍ GIAO HÀNG</h6>
							<p class="detail">Từ 150.000đ ở TP.HCM</p>
							<p class="detail">Từ 300.000đ ở tỉnh thành khác</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="dichvu d-flex align-items-center">
						<img src="images/icon-gift.png" alt="icon-gift">
						<div class="noidung">
							<h6 class="tieude font-weight-bold">QUÀ TẶNG MIỄN PHÍ</h6>
							<p class="detail">Tặng Bookmark</p>
							<p class="detail">Bao sách miễn phí</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="dichvu d-flex align-items-center">
						<img src="images/icon-return.png" alt="icon-return">
						<div class="noidung">
							<h6 class="tieude font-weight-bold">ĐỔI TRẢ NHANH CHÓNG</h6>
							<p class="detail">Hàng bị lỗi được đổi trả nhanh chóng</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- het .abovefooter  -->

	<!-- footer  -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>