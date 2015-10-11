<#-- @ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken" -->
<#-- @ftlvariable name="form" type="com.currency.converter.domain.UserRequest" -->
<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html lang="en">
<head>
	  <title>Currency enquiries by user</title>
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
        <form action="/logout" id="logoutForm" method="post">
		     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		 </form>
		 <td><a href="javascript: logout()">${currentUser.email}</a></td>
    </table>

<h1>Create a new user</h1>

<table border="1">
    <thead>
    <tr>
        <th>Source</th>
        <th>Destination</th>
        <th>Quantity</th>
        <th>Result</th>
    </tr>
    </thead>
    <#if userRequests ??>
	    <tbody>
	    <#list userRequests as userRequest>
		    <tr>
		    	<td>${userRequest.source}</td>
		        <td>${userRequest.destination}</td>
			    <td>${userRequest.quantity}</td>
			    <td>${userRequest.amount}</td>
		    </tr>
	    </#list>
	    </tbody>
    </#if>
</table>
</div>
</body>
</html>