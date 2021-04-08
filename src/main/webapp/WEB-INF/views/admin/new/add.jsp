<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newAPI" value="/api/new" />
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach"/>
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua"/>
<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
							chủ</a></li>
					<li class="active">> Chỉnh sửa bài viết</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row" style="margin-left: 15px">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="model">
							<table>
								<tr>
									<td><form:label path="title">Tiêu đề</form:label></td>
									<td><form:input path="title" value="${model.title}" /></td>
								</tr>

								<tr>
									<td><form:label path="thumbnail">Hình đại diện</form:label></td>
									<td><form:input path="thumbnail"
											value="${model.thumbnail}" /></td>
								</tr>


								<tr>
									<td><form:label path="categoryId">Thể loại</form:label></td>
									<td><form:select path="categoryId">
											<form:option value="" label=" ---Chọn thể loại--- " />

											<c:forEach var="item" items="${categories}">
												<form:option value="${item.id}" label="${item.name}" />
											</c:forEach>
										</form:select></td>
								</tr>

								<tr>
									<td><form:label path="shortDescription">Mô tả ngắn</form:label></td>
									<td><form:input path="shortDescription"
											value="${model.shortDescription}" /></td>
								</tr>


								<tr>
									<td><form:label path="content">Nội dung</form:label></td>
									<td><form:textarea path="content" value="${model.content}" /></td>
								</tr>
							</table>

							<form:hidden path="id" id="newId" />
							<!-- button -->
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew" >
											<i class="ace-icon fa fa-check bigger-110" ></i> Cập nhật bài
											viết
										</button>
									</c:if>
									<c:if test="${empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm bài viết
										</button>
									</c:if>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$('#btnAddOrUpdateNew').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    var id = $('#newId').val();
	    if (id == "") {
	    	addNew(data);
	    } else {
	    	updateNew(data);
	    }
	});
	
	function addNew(data) {
		$.ajax({
            url: '${newAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${newURL}";
            },
            error: function (error) {
            	window.location.href = "${newURL}";
            }
        });
	}
	
	function updateNew(data) {
		$.ajax({
            url: '${newAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${newURL}";
            },
            error: function (error) {
            	window.location.href = "${newURL}";
            }
        });
	}
	</script>
</body>
</html>
