<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="newAPI" value="/api/new" />
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách bài viết</title>
</head>

<body>

	<div class="container-fluid">
	
	<!-- message -->
	<c:if test="${not empty message }">
		<div class="alert alert-${message.alert }">
  			<strong>${message.message }</strong>
		</div>
	</c:if>
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Quản lý</a></li>
			<li class="breadcrumb-item active">Danh sách bài viết</li>
			
		</ol>


		<!-- DataTables Example -->
		<div class="card mb-3">
			<form action="<c:url value='/quan-tri/bai-viet/danh-sach'/>"
				id="formSubmit" method="get">
				<div class="card-header">
					<i class="fas fa-table"></i> Danh sách bài viết
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên bài viết</th>
									<th>Thể loại</th>
									<th>Ngày sửa</th>
									<th>Thao tác | <a class="  fas fa-plus-circle" data-toggle="tooltip" title="Thêm bài viết" style = "margin: 0"
					href='<c:url value = "/quan-tri/bai-viet/chinh-sua?id="/>'></a> | </th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>Tên bài viết</th>
									<th>Thể loại</th>
									<th>Ngày sửa</th>
									<th>Thao tác</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.id}</td>
										<td>${item.title}</td>
										<td>${item.categoryCode}</td>
										<td>${item.modifiedDate}</td>
										<td><a class="btn btn-sm btn-primary btn-edit fas fa-edit"
												data-toggle="tooltip" title="Cập nhật bài viết"
												href='<c:url value = "/quan-tri/bai-viet/chinh-sua?id=${item.id}"/>'></a> 
											<button class="btn btn-sm btn-primary btn-delete fas fa-trash-alt" type="button"
												id="btnDel" data-toggle="tooltip" title="xóa vài viết"  onclick ="warningBeforeDelete(${item.id})">
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</form>
		</div>
	</div>


	<!-- /.container-fluid -->


	<!-- /.content-wrapper -->
	<script>
	function warningBeforeDelete(id){
		swal({
			  title: "Xác nhận xóa",
			  text: "Bạn có chắc chắn muốn xóa hay không",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			}).then(function(isConfirm) {
			  if (isConfirm.value) {
					/* var ids = $('tbody input[type=checkbox]:checked').map(function () {
			            return $(this).val();
			        }).get(); */
					deleteNew(id);
			  }else{
				  window.location.href = "${newURL}";
			  }
			});
	}
	
		function deleteNew(id) {
			$.ajax({
	            url: '${newAPI}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(id),
	            success: function (result) {
	            	window.location.href = "${newURL}?message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${newURL}?message=system_error";
	            }
	        });
		}
	</script>
</body>

</html>