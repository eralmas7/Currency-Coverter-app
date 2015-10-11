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
		        <td><a href="/">Home</a></td>
		        <#if currentUser ??>
			        <form action="/logout" id="logoutForm" method="post">
			     		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					 </form>
					 <td><a href="javascript: logout()">${currentUser.email}</a></td>
				 </#if>
		    </table>
		
			<p>User details as below has been added successfully. Click
			<#if currentUser ??> 
				<a href="javascript: logout()">
			<#else>
				<a href="/">
			</#if>
			here</a> to login back or click <a href="/">here</a> to continue.</p>
		</div>	
	</body>
</html>