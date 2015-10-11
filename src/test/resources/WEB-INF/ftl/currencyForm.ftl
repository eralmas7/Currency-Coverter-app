<#-- @ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken" -->
<#-- @ftlvariable name="form" type="com.currency.converter.domain.UserRequest" -->
<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Create a new currency conversion</title>
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
				    <td><a href="javascript: logout()">logout: ${currentUser.email}</a>
				</#if>
			</table>
		
			<h1>Create a new user</h1>
		
			<#if form ??>
				<#if form.amount ?? && form.amount != 0>
					<p>${form.quantity} ${form.destination} = ${form.amount} ${form.source}</p>
				</#if>
			</#if>
		
			<form role="form" class="form-horizontal" name="form" action="#" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			    <input type="hidden" name="user.id" value="${currentUser.id}"/>
				<div class="control-group">
					<label class="control-label" for="source currency">Source currency</label>
					<div class="controls">
						<select class="span4" id="sourceCurrency" name="source">
							<option value="">Source Currency</option>
							<option value="AUD">Australian Dollar</option>
							<option value="BRL">Brazilian Real </option>
							<option value="CAD">Canadian Dollar</option>
							<option value="CZK">Czech Koruna</option>
							<option value="DKK">Danish Krone</option>
							<option value="EUR">Euro</option>
							<option value="HKD">Hong Kong Dollar</option>
							<option value="HUF">Hungarian Forint </option>
							<option value="ILS">Israeli New Sheqel</option>
							<option value="INR">Indian Rupee</option>
							<option value="JPY">Japanese Yen</option>
							<option value="MYR">Malaysian Ringgit</option>
							<option value="MXN">Mexican Peso</option>
							<option value="NOK">Norwegian Krone</option>
							<option value="NZD">New Zealand Dollar</option>
							<option value="PHP">Philippine Peso</option>
							<option value="PLN">Polish Zloty</option>
							<option value="GBP">Pound Sterling</option>
							<option value="SGD">Singapore Dollar</option>
							<option value="SEK">Swedish Krona</option>
							<option value="CHF">Swiss Franc</option>
							<option value="TWD">Taiwan New Dollar</option>
							<option value="THB">Thai Baht</option>
							<option value="TRY">Turkish Lira</option>
							<option value="USD" SELECTED="YES">U.S. Dollar</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="destination currency">Destination currency</label>
					<div class="controls">
						<select class="span4" id="destinationCurrency" name="destination">
							<option value="">Destination Currency</option>
							<option value="AUD">Australian Dollar</option>
							<option value="BRL">Brazilian Real </option>
							<option value="CAD">Canadian Dollar</option>
							<option value="CZK">Czech Koruna</option>
							<option value="DKK">Danish Krone</option>
							<option value="EUR">Euro</option>
							<option value="HKD">Hong Kong Dollar</option>
							<option value="HUF">Hungarian Forint </option>
							<option value="ILS">Israeli New Sheqel</option>
							<option value="INR">Indian Rupee</option>
							<option value="JPY">Japanese Yen</option>
							<option value="MYR">Malaysian Ringgit</option>
							<option value="MXN">Mexican Peso</option>
							<option value="NOK">Norwegian Krone</option>
							<option value="NZD">New Zealand Dollar</option>
							<option value="PHP">Philippine Peso</option>
							<option value="PLN">Polish Zloty</option>
							<option value="GBP">Pound Sterling</option>
							<option value="SGD">Singapore Dollar</option>
							<option value="SEK">Swedish Krona</option>
							<option value="CHF">Swiss Franc</option>
							<option value="TWD">Taiwan New Dollar</option>
							<option value="THB">Thai Baht</option>
							<option value="TRY">Turkish Lira</option>
							<option value="USD" SELECTED="YES">U.S. Dollar</option>
						</select>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputSaving">quantity</label>
					<div class="controls">
						<input class="span3" type="number" id="quantity" name="quantity" min="1" step="1" placeholder="quantity" required>
					</div>
				</div>
				
				<button class="btn btn-large btn-primary" type="submit">Save</button>
			</form>
		
		
			<@spring.bind "form" />
			<#if spring.status.error>
				<ul>
				    <#list spring.status.errorMessages as error>
				        <li>${error}</li>
				    </#list>
				</ul>
			</#if>
		</div>
	</body>
</html>