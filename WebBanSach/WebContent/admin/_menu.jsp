<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.image_user{
		border-radius:50%;
		-moz-border-radius:50%;
		-webkit-border-radius:50%;
	}
</style>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="image_user"  src="images/ryuuen.jpg" alt="User Image" width="75" height="75" >
        <div>
          <p class="app-sidebar__user-name">${loginedUser.username}</p>
          <p class="app-sidebar__user-designation"></p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item" href="Dashboard.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">Quản Lý</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="quan-ly-sach"><i class="icon fa fa-circle-o"></i> Quản Lý Sách</a></li>
            <li><a class="treeview-item" href="quan-ly-tai-khoan"><i class="icon fa fa-circle-o"></i> Quản Lý Tài Khoản</a></li>
            <li><a class="treeview-item" href="quan-ly-hinh-anh"><i class="icon fa fa-circle-o"></i>  Quản Lý Hình Ảnh</a></li>
            <li><a class="treeview-item" href="quan-ly-dat-hang"><i class="icon fa fa-circle-o"></i>  Quản Lý Đặt Hàng</a></li>
            <li><a class="treeview-item" href="quan-ly-khach-hang"><i class="icon fa fa-circle-o"></i>  Quản Lý Khách Hàng</a></li>
          </ul>
        </li>
      </ul>
    </aside>
</html>