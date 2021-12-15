<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="servlets.user.homeServlet"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Dealbook-Mua sách trực tuyến giá rẻ nhất</title>
<meta name="description" content="Mua sách online hay, giá tốt nhất, combo sách hot bán chạy, giảm giá cực khủng cùng với những ưu đãi như miễn phí giao hàng, quà tặng miễn phí, đổi trả nhanh chóng. Đa dạng sản phẩm, đáp ứng mọi nhu cầu.">
<meta name="keywords" content="nhà sách online, mua sách hay, sách hot, sách bán chạy, sách giảm giá nhiều">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>

<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>

<link rel="stylesheet" href="user/css/home.css">
<link rel="stylesheet" href="user/css/tai-khoan.css">
<script type="text/javascript" src="user/js/main.js"></script>
<link rel="stylesheet" href="user/fontawesome_free_5.13.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet" type="text/css" href="user/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="user/slick/slick-theme.css" />
<script type="text/javascript" src="user/slick/slick.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link rel="canonical" href="http://dealbook.xyz/">
<meta name="google-site-verification" content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
<link rel="apple-touch-icon" sizes="180x180" href="user/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="user/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="user/favicon_io/favicon-16x16.png">
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
					<!-- 1 san pham -->
					<div class="card">
						<a href="Lap-trinh-ke-hoach-kinh-doanh-hieu-qua.html"
							class="motsanpham" style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Lập Kế Hoạch Kinh Doanh Hiệu Quả"> <img
							class="card-img-top anh"
							src="user/images/lap-ke-hoach-kinh-doanh-hieu-qua.jpg"
							alt="lap-ke-hoach-kinh-doanh-hieu-qua">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Lập Kế Hoạch Kinh Doanh Hiệu Quả</h3>
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
							<img class="card-img-top anh"
							src="user/images/ma-bun-luu-manh.jpg" alt="ma-bun-luu-manh">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Ma Bùn Lưu Manh Và Những Câu
									Chuyện Khác Của Nguyễn Trí</h3>
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
							<img class="card-img-top anh" src="user/images/bank-4.0.jpg"
							alt="bank-4.0">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Bank 4.0 - Giao dịch mọi nơi,
									không chỉ là ngân hàng</h3>
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
							src="user/images/bo-sach-500-cau-chuyen-dao-duc.jpg"
							alt="bo-sach-500-cau-chuyen-dao-duc">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Bộ Sách 500 Câu Chuyện Đạo Đức -
									Những Câu Chuyện Tình Thân (Bộ 8 Cuốn)</h3>
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
							src="user/images/ung-thu-hoang-de-cua-bach-benh.jpg"
							alt="ung-thu-hoang-de-cua-bach-benh">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Lịch Sử Ung Thư - Hoàng Đế Của
									Bách Bệnh</h3>
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
							class="card-img-top anh"
							src="user/images/troi-dem-huyen-dieu.jpg"
							alt="troi-dem-huyen-dieu">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Cuốn Sách Khám Phá: Trời Đêm
									Huyền Diệu</h3>
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
							src="user/images/bo-sach-nhung-cau-chuyen-cho-con-thanh-nguoi-tu-te.jpg"
							alt="bo-sach-nhung-cau-chuyen-cho-con-thanh-nguoi-tu-te">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Bộ Sách Những Câu Chuyện Cho Con
									Thành Người Tử Tế (Bộ 5 Cuốn)</h3>
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
							src="user/images/lich-su-the-gioi.jpg" alt="lich-su-the-gioi">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Lịch Sử Thế Giới</h3>
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

	<!-- khoi sach combo hot  -->
	<section class="_1khoi combohot mt-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header -->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
						<h2 class="header text-uppercase" style="font-weight: 400;">COMBO
							SÁCH HOT - GIẢM ĐẾN 25%</h2>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
				</div>
				<div class="khoisanpham">
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Chuyện Nghề Và Chuyện Đời - Bộ 4 Cuốn"> <img
							class="card-img-top anh"
							src="user/images/combo-chuyen-nghe-chuyen-doi.jpg"
							alt="combo-chuyen-nghe-chuyen-doi">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Chuyện Nghề Và Chuyện Đời - Bộ 4
									Cuốn</h3>
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
							src="user/images/combo-me-con-su-tu-bo-tat-ngan-tay-ngan-mat.jpg"
							alt="combo-me-con-su-tu-bo-tat-ngan-tay-ngan-mat">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Combo Mẹ Con Sư Tử - Bồ Tát Ngàn
									Tay Ngàn Mắt</h3>
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
							src="user/images/combo-hanh-phuc-sang-tao.jpg"
							alt="combo-hanh-phuc-sang-tao">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Combo Osho: Hạnh Phúc Tại Tâm,
									Can Đảm Biến Thách Thức Thành Sức Mạnh & Sáng Tạo Bừng Cháy Sức
									Mạnh Bên Trong</h3>
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
							src="user/images/combo-giao-duc-va-y-nghia-cuoc-song.jpg"
							alt="combo-giao-duc-va-y-nghia-cuoc-song">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Combo Giáo Dục Và Ý Nghĩa Cuộc
									Sống Và Bạn Đang Nghịch Gì Với Đời Mình?</h3>
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
							src="user/images/combo-dinh-duong-than-duoc-xanh.jpg"
							alt="combo-dinh-duong-than-duoc-xanh">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Combo Dinh Dưỡng Xanh - Thần
									dược xanh</h3>
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
							class="card-img-top anh"
							src="user/images/combo-an-xanh-song-lanh.jpg"
							alt="combo-an-xanh-song-lanh">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Combo Ăn Xanh Để Khỏe - Sống
									Lành Để Trẻ</h3>
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
							src="user/images/combo-luoc-su-loai-nguoi.jpg"
							alt="combo-luoc-su-loai-nguoi">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Combo Lược Sử Loài Người - Lược
									Sử Tương Lai - 21 Bài Học Cho Thế Kỷ 21</h3>
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
							class="card-img-top anh"
							src="user/images/combo-phong-cach-song.jpg"
							alt="combo-phong-cach-song">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Bộ Sách Phong Cách Sống (Bộ 5
									Cuốn)</h3>
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

	<!-- khoi sach sap phathanh  -->
	<section class="_1khoi sapphathanh mt-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
						<h2 class="header text-uppercase" style="font-weight: 400;">SÁCH
							SẮP PHÁT HÀNH / ĐẶT TRƯỚC</h2>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
				</div>
				<div class="khoisanpham">
					<!-- 1 san pham -->
					<div class="card">
						<a href="#" class="motsanpham"
							style="text-decoration: none; color: black;"
							data-toggle="tooltip" data-placement="bottom"
							title="Ngoại Giao Của Chính Quyền Sài Gòn"> <img
							class="card-img-top anh"
							src="user/images/ngoai-giao-cua-chinh-quyen-sai-gon.jpg"
							alt="ngoai-giao-cua-chinh-quyen-sai-gon">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Ngoại Giao Của Chính Quyền Sài
									Gòn</h3>
								<small class="tacgia text-muted">Brian Finch</small>
								<div class="gia d-flex align-items-baseline"></div>
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
							title="Đường Mây Trên Đất Hoa"> <img class="card-img-top anh"
							src="user/images/duong-may-tren-dat-hoa.jpg"
							alt="duong-may-tren-dat-hoa">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Đường Mây Trên Đất Hoa</h3>
								<small class="tacgia text-muted">Brian Finch</small>
								<div class="gia d-flex align-items-baseline"></div>
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
							title="Muôn Kiếp Nhân Sinh"> <img class="card-img-top anh"
							src="user/images/muon-kiep-nhan-sinh.jpg"
							alt="muon-kiep-nhan-sinh">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Muôn Kiếp Nhân Sinh</h3>
								<small class="tacgia text-muted">Brian Finch</small>
								<div class="gia d-flex align-items-baseline"></div>
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
							title="Đường Mây Trong Cõi Mộng"> <img
							class="card-img-top anh"
							src="user/images/duong-may-trong-coi-mong.jpg"
							alt="duong-may-trong-coi-mong.jpg">
							<div class="card-body noidungsp mt-3">
								<h3 class="card-title ten">Đường Mây Trong Cõi Mộng</h3>
								<small class="tacgia text-muted">Brian Finch</small>
								<div class="gia d-flex align-items-baseline"></div>
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


	<!-- div _1khoi -- khoi sachnendoc -->
	<section class="_1khoi sachnendoc bg-white mt-4">
		<div class="container">
			<div class="noidung" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
						<h2 class="header text-uppercase" style="font-weight: 400;">SÁCH
							HAY NÊN ĐỌC</h2>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
					<!-- 1 san pham -->
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="Từng bước chân nở hoa: Khi câu kinh bước tới"> <img
								class="card-img-top anh"
								src="user/images/tung-buoc-chan-no-hoa.jpg"
								alt="tung-buoc-chan-no-hoa">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Từng bước chân nở hoa: Khi câu
										kinh bước tới</h3>
									<small class="thoigian text-muted">03/04/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="Cảm ơn vì đã được thương"> <img
								class="card-img-top anh"
								src="user/images/cam-on-vi-da-duoc-thuong.jpg"
								alt="cam-on-vi-da-duoc-thuong">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Cảm ơn vì đã được thương</h3>
									<small class="thoigian text-muted">31/03/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="Hào quang của vua Gia Long trong mắt Michel Gaultier">
								<img class="card-img-top anh" src="user/images/vua-gia-long.jpg"
								alt="vua-gia-long">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Hào quang của vua Gia Long
										trong mắt Michel Gaultier</h3>
									<small class="thoigian text-muted">21/03/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="Suối nguồn” và cái tôi hiện sinh trong từng cá thể">
								<img class="card-img-top anh"
								src="user/images/suoi-nguon-va-cai-toi-trong-tung-ca-the.jpg"
								alt="suoi-nguon-va-cai-toi-trong-tung-ca-the">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">"Suối nguồn” và cái tôi hiện
										sinh trong từng cá thể</h3>
									<small class="thoigian text-muted">16/03/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card cuoicung">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom"
								title="Đại dịch trên những con đường tơ lụa"> <img
								class="card-img-top anh"
								src="user/images/dai-dich-tren-con-duong-to-lua.jpg"
								alt="dai-dich-tren-con-duong-to-lua">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Đại dịch trên những con đường
										tơ lụa</h3>
									<small class="thoigian text-muted">16/03/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>

</html>