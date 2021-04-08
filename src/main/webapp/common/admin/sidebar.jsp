<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Sidebar -->

	<ul class="sidebar navbar-nav">
		<li class="nav-item active"><a class="nav-link" href="index.html">
				<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
		</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>Quản lý</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">

				<h6 class="dropdown-header">Bài viết</h6>
				<a class="dropdown-item"
					href='<c:url value="/quan-tri/bai-viet/danh-sach"/>'>Danh sách
					bài viết</a>
					 <a class="dropdown-item" href="register.html">Chỉnh sửa</a> 
					<a class="dropdown-item" href="/quan-tri/bai-viet/chinh-sua?id=">Thêm
					mới</a>
				<div class="dropdown-divider"></div>

			</div></li>
		<li class="nav-item"><a class="nav-link" href="charts.html">
				<i class="fas fa-fw fa-chart-area"></i> <span>Phân tích</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="tables.html">
				<i class="fas fa-fw fa-table"></i> <span>Tables</span>
		</a></li>
	</ul>
