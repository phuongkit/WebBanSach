<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.BookGrenreDAO"%>
<%@page import="DAO.BookCategoryDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="user/css/tai-khoan.css">
<!-- thanh "danh muc sach" đã được ẩn bên trong + hotline + ho tro truc tuyen -->
<section class="duoinavbar">
	<div class="container text-white">
		<div class="row justify">
			<div class="col-lg-3 col-md-5">
				<div class="categoryheader">
					<div class="noidungheader text-white">
						<i class="fa fa-bars"></i> <span
							class="text-uppercase font-weight-bold ml-1">Danh mục sách</span>
					</div>
					<!-- CATEGORIES -->
					<div class="categorycontent">
						<ul>
							<c:forEach items="${BookCategoryDAO.getAllBookCategories()}"
								var="bc">
								<li><a href="#">${bc.name}</a><i
									class="fa fa-chevron-right float-right"></i>
									<ul>
										<li class="liheader"><a href="#"
											class="header text-uppercase">${bc.name}</a></li>
										<c:set scope="request" var="bookGrenres"
											value="${BookGrenreDAO.getAllBookGrenreByBookCategoryID(bc.id)}" />
										<div class="content trai">
											<c:forEach items="${bookGrenres}" begin="0"
												end="${(bookGrenres.size()+1)/2-1}" var="bgr">
												<li><a href="#">${bgr.name}</a></li>
											</c:forEach>
										</div>
										<div class="content phai">
											<c:forEach items="${bookGrenres}"
												begin="${(bookGrenres.size()+1)/2}"
												end="${bookGrenres.size()}" var="bgr">
												<li><a href="#">${bgr.name}</a></li>
											</c:forEach>
										</div>
									</ul></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-5 ml-auto contact d-none d-md-block">
				<div class="benphai float-right">
					<div class="hotline">
						<i class="fa fa-phone"></i> <span>Hotline:<b>1900 1999</b>
						</span>
					</div>
					<i class="fas fa-comments-dollar"></i> <a href="#">Hỗ trợ trực
						tuyến </a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- breadcrumb  -->
<section class="breadcrumbbar">
	<div class="container">
		<ol class="breadcrumb mb-0 p-0 bg-transparent">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
			<li class="breadcrumb-item active"><a href="sach-kinh-te.html">${book.bookGrenre.name}</a></li>
		</ol>
	</div>
</section>
</section>
</html>