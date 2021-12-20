<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.BookGrenreDAO"%>
<%@page import="DAO.BookCategoryDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- noi dung danh muc sach(categories) + banner slider -->
<section class="header bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-3" style="margin-right: -15px;">
				<!-- CATEGORIES -->
				<div class="categorycontent">
					<ul>
						<c:forEach items="${BookCategoryDAO.getAllBookCategories()}" var="bc">
							<li><a href="sach-kinh-te.html">${bc.name}</a><i
								class="fa fa-chevron-right float-right"></i>
								<ul>
									<li class="liheader"><a href="#"
										class="header text-uppercase">${bc.name}</a></li>
									<c:set scope="request" var="bookGrenres" value="${BookGrenreDAO.getAllBookGrenreByBookCategoryID(bc.id)}" />
									<div class="content trai">
										<c:forEach items="${bookGrenres}" begin="0" end="${(bookGrenres.size()+1)/2-1}" var="bgr">
											<li><a href="SearchServlet?action=searchcatagories&id=${bgr.id}">${bgr.name}</a></li>
										</c:forEach>
									</div>
									<div class="content phai">
										<c:forEach items="${bookGrenres}" begin="${(bookGrenres.size()+1)/2}" end="${bookGrenres.size()}" var="bgr">
											<li><a href="SearchServlet?action=searchcatagories&id=${bgr.id}">${bgr.name}</a></li>
										</c:forEach>
									</div>
								</ul></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- banner slider  -->
			<div class="col-md-9 px-0">
				<div id="carouselId" class="carousel slide" data-ride="carousel">
					<ol class="nutcarousel carousel-indicators rounded-circle">
						<li data-target="#carouselId" data-slide-to="0" class="active"></li>
						<li data-target="#carouselId" data-slide-to="1"></li>
						<li data-target="#carouselId" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<a href="#"><img src="user/images/banner-sach-moi.jpg"
								class="img-fluid" style="height: 386px;" width="900px"
								alt="First slide"></a>
						</div>
						<div class="carousel-item">
							<a href="#"><img src="user/images/banner-beethoven.jpg"
								class="img-fluid" style="height: 386px;" width="900px"
								alt="Second slide"></a>
						</div>
						<div class="carousel-item">
							<a href="#"><img
								src="user/images/neu-toi-biet-duoc-khi-20-full-banner.jpg"
								class="img-fluid" style="height: 386px;" alt="Third slide"></a>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselId"
						data-slide="prev"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselId"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
</html>