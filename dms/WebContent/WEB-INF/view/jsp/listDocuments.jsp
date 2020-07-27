<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>   
<meta charset="utf-8">   
<title>Document Management System</title>   
<link rel="stylesheet" href='<c:url value="/resources/lib/bootstrap-3.2.0/css/bootstrap.min.css"/>'> 
<link rel="stylesheet" href='<c:url value="/resources/lib/jquery/jquery.dataTables.min.css"/>'> 
<script type="text/javascript" src='<c:url value="/resources/lib/jquery/jquery.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/lib/jquery/jquery.dataTables.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/lib/bootstrap-3.2.0/js/bootstrap.min.js"/>'></script>
</head>  
<body style="margin:20px auto">  
<div class="container">
<div class="row header" style="text-align:center;color:green">
<h3>Document Management System (DMS) </h3>
</div>
<!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#uploadModal">Add Document</button>

<!-- Modal -->
<div id="uploadModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">File upload form</h4>
      </div>
      <div class="modal-body">
        <!-- Form -->
        <form method='post' id="documentUpload" action='addDocument' enctype="multipart/form-data">
          Select file : <input type='file' name='file' id='file' class='form-control' required><br>
          <input type='button' class='btn btn-info' value='Upload' id='btn_upload'>
        </form>
      </div>
 
    </div>

  </div>
</div>
		<br><br>
<table id="myTable" class="table table-striped" >  
        <thead>
				<tr>
					<th width="4%">#</th>
					<th width="12%">TID</th>
					<th width="12%">ATTID</th>
					<th width="12%">Document Title</th>
					<th width="12%">Created By</th>
					<th width="16%">Created Date</th>
					<th width="12%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${documentList}" var="document"
					varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${document.tid}" /></td>
						<td><c:out value="${document.attId}" /></td>
						<td><c:out value="${document.documentTitle}" /></td>
						<td><c:out value="${document.createdBy}" /></td>
						<td><c:out value="${document.createdDate}" /></td>
						<td><nobr>
								<a class="btn btn-primary"
									onclick="return confirm('Are you sure you want to delete this book?');"
									href="delete/${document.tid}"> <span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									Delete
								</a>
							</nobr></td>
					</tr>
				</c:forEach>
			</tbody>
      </table>  
	  </div>
</body>  
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});

$('#btn_upload').click(function(){
  var fd = new FormData();
  var files = $('#file')[0].files[0];
  fd.append('file',files);
  if(typeof(files)  === "undefined") {
  	alert("Please select Document before Upload");
  	return false;
  }
  $("#documentUpload").submit();
});

</script>
</html>