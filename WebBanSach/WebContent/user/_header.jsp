<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="utils.MyUtils"%>
<%@page import="DAO.CartDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- code cho nut like share facebook  -->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v6.0"></script>

<!-- header -->
<nav class="navbar navbar-expand-md bg-white navbar-light">
	<div class="container">
		<!-- logo  -->
		<a class="navbar-brand" href="${pageContext.request.contextPath}" style="color: #CF111A;"><b>DealBook</b>.xyz</a>

		<!-- navbar-toggler  -->
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<!-- form tìm kiếm  -->
			<form class="form-inline ml-auto my-2 my-lg-0 mr-3">
				<div class="input-group" style="width: 520px;">
					<input type="text" class="form-control" aria-label="Small"
						placeholder="Nhập sách cần tìm kiếm...">
					<div class="input-group-append">
						<button type="button" class="btn"
							style="background-color: #CF111A; color: white;">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
			<c:choose>
				<c:when test="${loginedUser==null}">
					<!-- ô đăng nhập đăng ký giỏ hàng trên header  -->
					<ul class="navbar-nav mb-1 ml-auto">
						<div class="dropdown">
							<li class="nav-item account" type="button" class="btn dropdown"
								data-toggle="dropdown"><a href="#"
								class="btn btn-secondary rounded-circle"> <i
									class="fa fa-user"></i>
							</a> <a class="nav-link text-dark text-uppercase" href="#"
								style="display: inline-block">Tài khoản</a></li>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item nutdangky text-center mb-2" href="#"
									data-toggle="modal" data-target="#formdangky">Đăng ký</a> <a
									class="dropdown-item nutdangnhap text-center" href="#"
									data-toggle="modal" data-target="#formdangnhap">Đăng nhập</a>
							</div>
						</div>
						<li class="nav-item giohang"><a href="gio-hang.html"
							class="btn btn-secondary rounded-circle"> <i
								class="fa fa-shopping-cart"></i>
								<div class="cart-amount">0</div>
						</a> <a class="nav-link text-dark giohang text-uppercase"
							href="gio-hang.html" style="display: inline-block">Giỏ Hàng</a></li>
				</c:when>
				<c:otherwise>
					<!-- ô thông tin tài khoản nút đăng xuất và giỏ hàng trên header  -->
					<ul class="navbar-nav mb-1 ml-auto">
						<div class="dropdown">
							<li class="d-flex"><a href="#"
								class="btn btn-secondary rounded-circle"> <i
									class="fa fa-user"></i>
							</a>
								<div class="info-logout">
									<a class="nav-link text-dark text-uppercase username"
										href="index.jsp">${loginedUser.username}</a> <a
										class="nav-link text-dark logout" href="exit">Thoát <i
										class="fas fa-sign-out-alt"></i></a>
								</div></li>
						</div>
						<li class="nav-item giohang"><a href="gio-hang.html"
							class="btn btn-secondary rounded-circle"> <i
								class="fa fa-shopping-cart"></i>
								<div class="cart-amount">${CartDAO.getCountCartNotOrderByUsername(loginedUser.id)}</div>
						</a> <a class="nav-link text-dark giohang text-uppercase"
							href="gio-hang.html" style="display: inline-block">Giỏ Hàng</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</div>
</nav>


<!-- form dang ky khi click vao button tren header-->
<div class="modal fade mt-5" id="formdangky" data-backdrop="static"
	tabindex="-1" aria-labelledby="dangky_tieude" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<ul class="tabs d-flex justify-content-around list-unstyled mb-0">
					<li class="tab tab-dangnhap text-center"><a
						class=" text-decoration-none">Đăng nhập</a>
						<hr></li>
					<li class="tab tab-dangky text-center"><a
						class="text-decoration-none">Đăng ký</a>
						<hr></li>
				</ul>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="form-signup" class="form-signin mt-2">
					<div class="form-label-group">
						<input type="text" class="form-control"
							placeholder="Nhập họ và tên" name="name" required autofocus>
					</div>
					<div class="form-label-group">
						<input type="text" class="form-control"
							placeholder="Nhập số điện thoại" name="phone" required>
					</div>
					<div class="form-label-group">
						<input type="email" class="form-control"
							placeholder="Nhập địa chỉ email" name="email" required>
					</div>
					<div class="form-label-group">
						<input type="password" class="form-control"
							placeholder="Nhập mật khẩu" name="password" required>
					</div>
					<div class="form-label-group mb-4">
						<input type="password" class="form-control"
							name="confirm_password" placeholder="Nhập lại mật khẩu" required>
					</div>
					<button
						class="btn btn-lg btn-block btn-signin text-uppercase text-white mt-3"
						type="submit" style="background: #F5A623">Đăng ký</button>
					<hr class="mt-3 mb-2">
					<div class="custom-control custom-checkbox">
						<p class="text-center">Bằng việc đăng ký, bạn đã đồng ý với
							DealBook về</p>
						<a href="#" class="text-decoration-none text-center"
							style="color: #F5A623">Điều khoản dịch vụ & Chính sách bảo
							mật</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- form dang nhap khi click vao button tren header-->
<div class="modal fade mt-5" id="formdangnhap" data-backdrop="static"
	tabindex="-1" aria-labelledby="dangnhap_tieude" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<ul class="tabs d-flex justify-content-around list-unstyled mb-0">
					<li class="tab tab-dangnhap text-center"><a
						class=" text-decoration-none">Đăng nhập</a>
						<hr></li>
					<li class="tab tab-dangky text-center"><a
						class="text-decoration-none">Đăng ký</a>
						<hr></li>
				</ul>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="form-signin" class="form-signin mt-2" method="POST"
					action="${pageContext.request.contextPath}/login">
					<div class="form-label-group">
						<input type="text" class="form-control"
							placeholder="Nhập tên đăng nhập" name="username"
							value="${user.username}" required autofocus>
					</div>

					<div class="form-label-group">
						<input type="password" class="form-control" placeholder="Mật khẩu"
							name="password" value="${user.password}" required>
					</div>

					<div class="custom-control custom-checkbox mb-3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck1" name="rememberMe" value="Y"> <label
							class="custom-control-label" for="customCheck1">Nhớ mật
							khẩu</label> <a href="#" class="float-right text-decoration-none"
							style="color: #F5A623">Quên mật khẩu</a>
					</div>

					<button
						class="btn btn-lg btn-block btn-signin text-uppercase text-white"
						type="submit" style="background: #F5A623">Đăng nhập</button>
					<hr class="my-4">
					<button class="btn btn-lg btn-google btn-block text-uppercase"
						type="submit">
						<i class="fab fa-google mr-2"></i> Đăng nhập bằng Google
					</button>
					<button class="btn btn-lg btn-facebook btn-block text-uppercase"
						type="submit">
						<i class="fab fa-facebook-f mr-2"></i> Đăng nhập bằng Facebook
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
</html>