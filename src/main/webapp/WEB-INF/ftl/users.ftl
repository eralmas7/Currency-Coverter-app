<#-- @ftlvariable name="users" type="java.util.List<com.currency.converter.domain.User>" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>List of Users</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
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
        <td><a href="/">Home</a></td>
        <td><a href="/user/create">Create a new user</a></td>
        <form action="/logout" id="logoutForm" method="post">
		     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		 </form>
		 <td><a style="align:right" href="javascript: logout()">${currentUser.email}</a></td>
    </table>

	<h1>List of Users</h1>
	
	<table border="1">
	    <thead>
	    <tr>
	    	<th>id</th>
	        <th>E-mail</th>
	        <th>Role</th>
	        <th>Date of birth</th>
	        <th>Website</th>
	        <th>Street</th>
	        <th>City</th>
	        <th>Zip</th>
	        <th>Country</th>
	    </tr>
	    </thead>
	    <tbody>
	    <#list users as user>
		    <tr>
		    	<td>${user.id}</td>
		        <td><a href="/user/${user.id}">${user.email}</a></td>
		        <td>${user.role}</td>
		        <#if user.dateOfBirth??><td>${user.dateOfBirth}</td></#if>
				<#if user.personalWebsite??><td>${user.personalWebsite}</td></#if>
		        <#if user.address??>
			        <#if user.address.street??><td>${user.address.street}</td></#if>
			        <#if user.address.city??><td>${user.address.city}</td></#if>
			        <#if user.address.zip??><td>${user.address.zip}</td></#if>
			        <#if user.address.country??><td>${user.address.country}</td></#if>
		        </#if>
		    </tr>
	    </#list>
	    </tbody>
	</table>
</div>
</body>
</html>