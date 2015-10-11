<#-- @ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken" -->
<#-- @ftlvariable name="currentUser" type="com.currency.converter.domain.CurrentUser" -->
<!DOCTYPE html>
<html lang="en">
	<head>
	    <title>Home page</title>
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
	    <!--script type="text/javascript" src="logout.js" /-->
	</head>
	<body>
		<div class="container">
		<#if !currentUser??>
			<h1>Log in</h1>
			<p>You can use default login using: almass@gmail.com / 123456</p>
			
			<form role="form" action="/" method="post" class="form-horizontal span8">
			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			    <div class="control-group">
			        <label class="control-label" for="email">Email address</label>
			        <div class="controls">
			        	<input type="email" name="email" id="email" class="span3" required autofocus/>
			        </div>
			    </div>
			    <div class="control-group">
			        <label class="control-label" for="password">Password</label>
			        <div class="controls">
			        	<input type="password" name="password" id="password" class="span3" required/>
			        </div>
			    </div>
			    <div class="control-group">
			    	<button type="submit" class="btn btn-primary">Sign in</button>
			    	<a href="/user/create" class="btn btn-primary">Register</a>
			    </div>
			</form>
		</#if>
		<#if error??>
			<p>The email or password you have entered is invalid, try again.</p>
		</#if>
		<table class="table">
		   <#if currentUser?? && currentUser.role == "ADMIN">
		        <td><a href="/user/create">Create a new user</a></td>
		        <td><a href="/users">View all users</a></td>
		   </#if>
		   <#if currentUser??>
		        <form action="/logout" id="logoutForm" method="post">
		            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        </form></td>
		        <td><a href="/user/${currentUser.id}">View myself</a></td>
		        <td><a href="/currency/history/${currentUser.id}">View my history</a></td>
		        <td><a href="/currency/converter/${currentUser.id}">convert currency</a></td>
		        <td><a href="javascript: logout()">${currentUser.email}</a>
		    </#if>
		</table>
		</div>
	</body>
</html>