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