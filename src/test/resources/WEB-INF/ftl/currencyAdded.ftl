<#-- @ftlvariable name="user" type="com.currency.converter.domain.User" -->
<!DOCTYPE html>
<html lang="en">
	<head>
	    <title>User details</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript">
			function logout() {
		   		$("#logoutForm").submit();
		  	}
		</script>
	</head>
	<body>
		<div class="container">
			<table class="table">
			   <#if currentUser?? && currentUser.role == "ADMIN">
			        <td><a href="/user/create">Create a new user</a></td>
			        <td><a href="/users">View all users</a></td>
			   </#if>
			   <#if currentUser??>
			        <form action="/logout" id="logoutForm" method="post">
			            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			        </form>
			        <td><a href="/user/${currentUser.id}">View myself</a></td>
			        <td><a href="/currency/history/${currentUser.id}">View my history</a></td>
			        <td><a href="/currency/converter/${currentUser.id}">convert currency</a></td>
			        <td><a href="javascript: logout()">logout: ${currentUser.email}</a></td>
			    </#if>
			</table>
		</div>
		
		<#if form??>
			<p>Currency is converted</p>
		<#else>
			<p>Currency is converted ${form.amount}</p>
		</#if>
	</body>
</html>