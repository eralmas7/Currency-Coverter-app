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
		        <td><a href="/">Home</a></td>
		        <form action="/logout" id="logoutForm" method="post">
				     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				 </form>
				 <#if currentUser ??>
				 	<td><a href="javascript: logout()">${currentUser.email}</a></td>
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