<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DAO.OrderDAO"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Quản Lý Tài Khoản</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
			$('table .edit').on('click',function(){
				var id = $(this).parent().find('#id').val();
				$.ajax({
					type:'GET',
					url:'AccountControl',
					data:{action:'show', sid:id},
					success:function(data){
						$('#editBook #sid').val(data[0]);
						$('#editBook #username').val(data[1]);
						$('#editBook #password').val(data[2]);	
						//$('#editBook #permission').val(data[4]);
						if(data[4]==true)
							$('#editBook #permission').val('true');
						else
							$('#editBook #permission').val('false');
						
					}
				});
			});
		});
	  function chooseFile(fileInput){
		  if(fileInput.files && fileInput.files[0]){
			  var reader = new FileReader();
			  
			  reader.onload=function(e){
				  $('#image').attr('src', e.target.result);
			  }
			  reader.readAsDataURL(fileInput.files[0]);
		  }
	  }
  </script>
  
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
          <h1><i class="fa fa-th-list"></i> Quản Lý Tài Khoản</h1>
          
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
              
              	<a href ="#" class="btn btn-outline-success btn-lg mb-2 " data-toggle="modal" data-target="#addNewBook"><i class="fas fa-plus-circle"></i>Thêm mới</i></a>            
                <table class="table table-hover table-bordered" id="sampleTable">               
                  <thead>             
                    <tr>   
                      <th>Mã số</th>
                      <th>Tên khách hàng</th>
                      <th>Email</th>
                      <th>Số điện thoại</th>
                      <th>Địa chỉ</th>
                      <th>Số lượng đơn hàng đã mua</th>
                      <th>Chức năng</th>
                    </tr>
                  </thead>
                  <tbody>
                  		<c:forEach items ="${customers}" var="s">
                  		<tr>
                  			<td><c:out value="${s.id}"></c:out></td>
                  			<td><c:out value="${s.fullname}"></c:out></td>
                  			<td><c:out value="${s.email}"></c:out></td>
                  			<td><c:out value="${s.phone}"></c:out></td>
                  			<td><c:out value="${s.address}"></c:out></td>
                  			<td><c:out value="${OrderDAO.getAllOrderByAccount(s.account.id).size()}"/></td>
                  			
                  			<td>
                  				<a href="AccountControl?action=delete&sid=${s.id}"class="btn btn-danger btn-sm btn-block"><i class="fas fa-minus-circle"></i></a>
                  				<a href="#editBook" data-toggle="modal" class="btn btn-primary btn-sm btn-block edit" ><i class="fas fa-edit" data-toggle="tooltip"></i></a>
                  				
                  				<input type="hidden" name ="id" id ="id" value="${s.id}">
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
				<form method="post" action = "AccountControl?action=add" >
					<div class="modal-header">						
						<h4 class="modal-title">Thêm mới sách</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Tài khoản" name = "username" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Mật khẩu" name = "password" required>
						</div>
						<div class="form-group">
							<select class="form-control" id="permission" name="permission">
							    <option value="true">Admin</option>
							    <option value="false">Customer</option>
							</select>	
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
				<form method="post" action = "AccountControl?action=edit" >
					<div class="modal-header">						
						<h4 class="modal-title">Sửa thông tin sách</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Tài khoản" name = "username" id = "username" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Mật khẩu" name = "password" id = "password" required>
						</div>
						<div class="form-group">
							<select class="form-control" id="permission" name="permission" id="permission">
							    <option value="true">Admin</option>
							    <option value="false">Customer</option>
							</select>	
						</div>				
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-success" value="Edit">
						<input type ="hidden" name="sid" id="sid">
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