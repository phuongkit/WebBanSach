<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@page import="DAO.OrderDAO"%>
<%@page import="DAO.CartDAO"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Quản Lý Đặt Hàng</title>
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
					url:'ImageControl',
					data:{action:'show', sid:id},
					success:function(data){
						$('#editBook #sid').val(data[0]);
						$('#editBook #image').attr('src', 'images/'+data[1]);
						$('#editBook #book_id').val(data[2]);
						console.log(data[2]);
					}
				});
			});
		});
	  function chooseFile(fileInput){
		  if(fileInput.files && fileInput.files[0]){
			  var reader = new FileReader();
			  
			  reader.onload=function(e){
				  $('#addNewBook #image').attr('src', e.target.result);
				  $('#editBook #image').attr('src', e.target.result);
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
          <h1><i class="fa fa-th-list"></i> Quản Lý Đặt Hàng</h1>
          
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
              
             	<table class="table table-hover table-bordered" id="sampleTable">               
                  <thead>             
                    <tr>   
                      <th>Mã đơn hàng</th>
                      <th>Ngày mua</th>
                      <th>Sản phẩm</th>
                      <th>Tổng tiền</th>
                      <th>Phương thức vận chuyển</th>
                      <th>Phương thức thanh toán</th>
                      <th>Trạng thái đơn hàng</th>
                      <th>Tên khách hàng</th>
                    </tr>
                  </thead>
                  <tbody>
                  		<c:forEach items ="${orders}" var="s">
                  		<tr>
                  			<td><c:out value="${s.id}"></c:out></td>
                  			<td><c:out value="${s.createdAt}"></c:out></td>	
                  			<c:set var="carts" value="${CartDAO.getCartByOrder(s.id)}" />
                  			<td><c:forEach items="${carts}" var="cart">
							${cart.book.name}|${cart.quantity}</br>
							</c:forEach>
							</td>
							<td>${OrderDAO.getTotalMoneyByOrder(s.id)}</td>
							<td>${s.shippingMethod.name}</td>
							<td>${s.payment.name}</td>
							<td>${s.deliveryStatus.name}</td>
							<td>${s.deliveryFullname}</td>
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

  </body>
</html>