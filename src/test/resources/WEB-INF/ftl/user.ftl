<#-- @ftlvariable name="user" type="com.currency.converter.domain.User" -->
<!DOCTYPE html>
<html lang="en">
	<head>
	    <title>User details</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
			        <td><a href="javascript: logout()">logout: ${currentUser.email}</a>
			    </#if>
			</table>
		
			<h1>User details</h1>
		
			<p>Id: ${user.id}</p>
			<p>E-mail: ${user.email}</p>
			<p>Role: ${user.role}</p>
			<#if user.dateOfBirth??><p>Date of birth ${user.dateOfBirth}</p></#if>
			<#if user.personalWebsite??><p>Personal website ${user.personalWebsite}</p></#if>
			<#if user.address??>
				<#if user.address.street??><p>Street: ${user.address.street}</p></#if>
				<#if user.address.city??><p>City: ${user.address.city}</p></#if>
				<#if user.address.country??><p>Country: ${user.address.country}</p></#if>
				<#if user.address.zip??><p>Zip: ${user.address.zip}</p></#if>
			</#if>
		</div>
	</body>
</html>