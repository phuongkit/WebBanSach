<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "servlets.admin.TableBook" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Data Table - Vali Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <jsp:include page="_menu.jsp"></jsp:include>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> Quản Lý Sách</h1>
          
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Tables</li>
          <li class="breadcrumb-item active"><a href="#">Data Table</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">         	
            <div class="tile-body">           
              <div class="table-responsive"> 
              	<a href ="#addNewBook" class="btn btn-outline-success btn-lg mb-2 " data-toggle="modal" ><i class="fas fa-plus-circle"></i>Thêm mới</i></a>            
                <table class="table table-hover table-bordered" id="sampleTable">               
                  <thead>             
                    <tr>   
                      <th>Mã Sách</th>
                      <th>Tên Sách</th>
                      <th>Mô tả</th>
                      <th>Loại Sách</th>
                      <th>Tác Giả</th>
                      <th>Nhà Xuất Bản</th>
                      <th>Ngày Tạo</th>
                      <th>Số Lượng Đã Bán</th>
                      <th>Số Lượng Hiện Có</th>
                      <th>Giá Bán</th>
                      <th>Giá Mua</th>
                      <th>Chức Năng</th>
                    </tr>
                  </thead>
                  <tbody>
                  		<c:forEach items ="${books}" var="s">
                  		<tr>
                  			<td><c:out value="${s.id}"></c:out></td>
                  			<td><c:out value="${s.name}"></c:out></td>
                  			<td><c:out value="${s.description}"></c:out></td>
                  			<td><c:out value="${s.bookGrenre.name}"></c:out></td>
                  			<td><c:out value="${s.author.name}"></c:out></td>
                  			<td><c:out value="${s.supplier.name}"></c:out></td>
                  			<td><c:out value="${s.createdAt}"></c:out></td>
                  			<td><c:out value="${s.quantitySold}"></c:out></td>
                  			<td><c:out value="${s.quantityAvailable}"></c:out></td>
                  			<td><c:out value="${s.salePrice}"></c:out></td>
                  			<td><c:out value="${s.purchasePrice}"></c:out></td>
                  			<td>
                  				<a href="BookControl?action=delete&sid=${s.id}"class="btn btn-danger btn-sm btn-block"><i class="fas fa-minus-circle"></i></a>
                  				<a href="#editBook" data-toggle="modal" class="btn btn-primary btn-sm btn-block"><i class="fas fa-edit"></i></a>
                  			</td>
                  		</tr>
                  		</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <div id="addNewBook" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="post" action = "BookControl?action=add" >
					<div class="modal-header">						
						<h4 class="modal-title">Thêm mới sách</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Nhập tên sách" name = "name" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Mô tả" name = "description" required>
						</div>
						<div class="form-group">
							<select class="form-control" id="book-select" name="bookgrenre">
							    <option value="">Chọn loại sách</option>
							    <c:forEach items="${bookGrenres}" var="b">
							    	<option  value="${b.id}"><c:out value="${b.name}"></c:out></option>
							    </c:forEach>
							</select>
						</div>
						<div class="form-group">
							<select class="form-control" id="book-select" name ="author">
							    <option value="">Tác giả</option>
							    <c:forEach items="${authors}" var="b">
							    	<option value="${b.id}"><c:out value="${b.name}"></c:out></option>
							    </c:forEach>
							</select>
						</div>
						<div class="form-group">
							<select class="form-control" id="book-select" name="supplier">
							    <option value="">Nhà xuất bản</option>
							    <c:forEach items="${suppliers}" var="b">
							    	<option  value="${b.id}"><c:out value="${b.name}"></c:out></option>
							    </c:forEach>				    
							</select>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="Số lượng" name ="quantity" required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="Nhập giá bán" name="sale_price" required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="Nhập giá mua" name="purchase_price" required>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="editBook" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="post" action = "edit" >
					<div class="modal-header">						
						<h4 class="modal-title">Sửa thông tin sách</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Nhập tên sách" name = "name" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Mô tả" name = "description" required>
						</div>
						<div class="form-group">
							<select class="form-control" id="book-select" name="bookgrenre">
							    <option value="">Chọn loại sách</option>
							    <c:forEach items="${bookGrenres}" var="b">
							    	<option  value="${b.id}"><c:out value="${b.name}"></c:out></option>
							    </c:forEach>
							</select>
						</div>
						<div class="form-group">
							<select class="form-control" id="book-select" name ="author">
							    <option value="">Tác giả</option>
							    <c:forEach items="${authors}" var="b">
							    	<option value="${b.id}"><c:out value="${b.name}"></c:out></option>
							    </c:forEach>
							</select>
						</div>
						<div class="form-group">
							<select class="form-control" id="book-select" name="supplier">
							    <option value="">Nhà xuất bản</option>
							    <c:forEach items="${suppliers}" var="b">
							    	<option  value="${b.id}"><c:out value="${b.name}"></c:out></option>
							    </c:forEach>				    
							</select>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="Số lượng" name ="quantity" required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="Nhập giá bán" name="sale_price" required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="Nhập giá mua" name="purchase_price" required>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-success" value="Edit">
					</div>
				</form>
			</div>
		</div>
	</div>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>