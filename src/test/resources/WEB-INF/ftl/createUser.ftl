<#-- @ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken" -->
<#-- @ftlvariable name="form" type="com.currency.converter.domain.UserCreateForm" -->
<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html lang="en">
	<head>
	  	<meta charset="utf-8">
	  	<title>Create a new user</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			function logout() {
		    	$("#logoutForm").submit();
		    }
	    	$(document).ready(function($) {
	  			$('#datepicker').datetimepicker();
			});
		</script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<body>
		<div class="container">
			<#if currentUser ??>
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
				        <td><a href="javascript: logout()">logout: ${currentUser.email}</a>
				    </#if>
				</table>
		    </#if>
		
			<h1>Create a new user</h1>
		
		  	<form class="form-horizontal" name="form" action="" method="post" role="form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		      	<div class="col-md-6">
		        	<div class="form-group">
		          		<label class="col-md-3 control-label">Email</label>
		          		<div class="col-md-9">
		            		<input type="email" name="email" id="email" class="form-control" placeholder="E-mail address" required autofocus>         
		          		</div>
		        	</div>
		      	</div>
		      	<div class="col-md-6">
		        	<div class="form-group">
		          		<label class="col-md-3 control-label">Password</label>
		          		<div class="col-md-9">
		            		<input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>         
		          		</div>
		        	</div>
		      	</div>
		      	<div class="col-md-6">
		        	<div class="form-group">
		          		<label class="col-md-3 control-label">Website</label>
		          		<div class="col-md-9">
		            		<input type="text" class="form-control" name="personalWebsite" id="url" placeholder="Personal website">         
		          		</div>
		        	</div>
		     	</div>
		     	<div class="col-md-6">
				    <div class="form-group">
					    <label for="inputDate" class="col-md-3 control-label">Date of birth</label>
					    <div class="col-sm-9">
					    	<div class='input-group date' id='datepicker'>
					            <input type='text' class="col-sm-3 form-control" name="dateOfBirth" data-date-format="YYYY/MM/DD"/>
					            <span class="input-group-addon">
					               <span class="glyphicon glyphicon-calendar"></span>
					            </span>
			                </div>
			            </div>
		        	</div>
		        </div>
				<div class="col-md-6">
					<div class="form-group">
				   		<label class="col-md-3 control-label">Street</label>
				      	<div class="col-md-9">
				        	<input type="text" class="form-control" name="address.street" id="postalStreet" placeholder="Street">
				      	</div>
				 	</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">City</label>
				        <div class="col-md-9">
				            <input type="text" class="form-control" name="address.city" id="postalCity" placeholder="City">
				       	</div>
				  	</div>
				</div>
				<div class="col-md-6">
				 	<div class="form-group">
				      	<label class="col-md-3 control-label">Zip</label>
				       	<div class="col-md-9">
				          	<input type="text" class="form-control" name="address.zip" id="postalZip" placeholder="Zip">
				       	</div>
				  	</div>
				</div>
				<div class="col-md-6">
				 	<div class="form-group">
				    	<label class="col-md-3 control-label" for="sel1" >Postal Country</label>
				    	<div class="col-md-9">
				    		<select id="postalZip" class="form-control" id="sel1" name="address.country">
				        		<option value="  " selected>(please select a country)</option>
				        		<option value="--">none</option>
						        <option value="AF">Afghanistan</option>
						        <option value="AL">Albania</option>
						        <option value="DZ">Algeria</option>
						        <option value="AS">American Samoa</option>
						        <option value="AD">Andorra</option>
						        <option value="AO">Angola</option>
						        <option value="AI">Anguilla</option>
						        <option value="AQ">Antarctica</option>
						        <option value="AG">Antigua and Barbuda</option>
						        <option value="AR">Argentina</option>
						        <option value="AM">Armenia</option>
						        <option value="AW">Aruba</option>
						        <option value="AU">Australia</option>
						        <option value="AT">Austria</option>
						        <option value="AZ">Azerbaijan</option>
						        <option value="BS">Bahamas</option>
						        <option value="BH">Bahrain</option>
						        <option value="BD">Bangladesh</option>
						        <option value="BB">Barbados</option>
						        <option value="BY">Belarus</option>
						        <option value="BE">Belgium</option>
						        <option value="BZ">Belize</option>
						        <option value="BJ">Benin</option>
						        <option value="BM">Bermuda</option>
						        <option value="BT">Bhutan</option>
						        <option value="BO">Bolivia</option>
						        <option value="BA">Bosnia and Herzegowina</option>
						        <option value="BW">Botswana</option>
						        <option value="BV">Bouvet Island</option>
						        <option value="BR">Brazil</option>
						        <option value="IO">British Indian Ocean Territory</option>
						        <option value="BN">Brunei Darussalam</option>
						        <option value="BG">Bulgaria</option>
						        <option value="BF">Burkina Faso</option>
						        <option value="BI">Burundi</option>
						        <option value="KH">Cambodia</option>
						        <option value="CM">Cameroon</option>
						        <option value="CA">Canada</option>
						        <option value="CV">Cape Verde</option>
						        <option value="KY">Cayman Islands</option>
						        <option value="CF">Central African Republic</option>
						        <option value="TD">Chad</option>
						        <option value="CL">Chile</option>
						        <option value="CN">China</option>
						        <option value="CX">Christmas Island</option>
						        <option value="CC">Cocos (Keeling) Islands</option>
						        <option value="CO">Colombia</option>
						        <option value="KM">Comoros</option>
						        <option value="CG">Congo</option>
						        <option value="CD">Congo, the Democratic Republic of the</option>
						        <option value="CK">Cook Islands</option>
						        <option value="CR">Costa Rica</option>
						        <option value="CI">Cote d'Ivoire</option>
						        <option value="HR">Croatia (Hrvatska)</option>
						        <option value="CU">Cuba</option>
						        <option value="CY">Cyprus</option>
						        <option value="CZ">Czech Republic</option>
						        <option value="DK">Denmark</option>
						        <option value="DJ">Djibouti</option>
						        <option value="DM">Dominica</option>
						        <option value="DO">Dominican Republic</option>
						        <option value="TP">East Timor</option>
						        <option value="EC">Ecuador</option>
						        <option value="EG">Egypt</option>
						        <option value="SV">El Salvador</option>
						        <option value="GQ">Equatorial Guinea</option>
						        <option value="ER">Eritrea</option>
						        <option value="EE">Estonia</option>
						        <option value="ET">Ethiopia</option>
						        <option value="FK">Falkland Islands (Malvinas)</option>
						        <option value="FO">Faroe Islands</option>
						        <option value="FJ">Fiji</option>
						        <option value="FI">Finland</option>
						        <option value="FR">France</option>
						        <option value="FX">France, Metropolitan</option>
						        <option value="GF">French Guiana</option>
						        <option value="PF">French Polynesia</option>
						        <option value="TF">French Southern Territories</option>
						        <option value="GA">Gabon</option>
						        <option value="GM">Gambia</option>
						        <option value="GE">Georgia</option>
						        <option value="DE">Germany</option>
						        <option value="GH">Ghana</option>
						        <option value="GI">Gibraltar</option>
						        <option value="GR">Greece</option>
						        <option value="GL">Greenland</option>
						        <option value="GD">Grenada</option>
						        <option value="GP">Guadeloupe</option>
						        <option value="GU">Guam</option>
						        <option value="GT">Guatemala</option>
						        <option value="GN">Guinea</option>
						        <option value="GW">Guinea-Bissau</option>
						        <option value="GY">Guyana</option>
						        <option value="HT">Haiti</option>
						        <option value="HM">Heard and Mc Donald Islands</option>
						        <option value="VA">Holy See (Vatican City State)</option>
						        <option value="HN">Honduras</option>
						        <option value="HK">Hong Kong</option>
						        <option value="HU">Hungary</option>
						        <option value="IS">Iceland</option>
						        <option value="IN">India</option>
						        <option value="ID">Indonesia</option>
						        <option value="IR">Iran (Islamic Republic of)</option>
						        <option value="IQ">Iraq</option>
						        <option value="IE">Ireland</option>
						        <option value="IL">Israel</option>
						        <option value="IT">Italy</option>
						        <option value="JM">Jamaica</option>
						        <option value="JP">Japan</option>
						        <option value="JO">Jordan</option>
						        <option value="KZ">Kazakhstan</option>
						        <option value="KE">Kenya</option>
						        <option value="KI">Kiribati</option>
						        <option value="KP">Korea, Democratic People's Republic of</option>
						        <option value="KR">Korea, Republic of</option>
						        <option value="KW">Kuwait</option>
						        <option value="KG">Kyrgyzstan</option>
						        <option value="LA">Lao People's Democratic Republic</option>
						        <option value="LV">Latvia</option>
						        <option value="LB">Lebanon</option>
						        <option value="LS">Lesotho</option>
						        <option value="LR">Liberia</option>
						        <option value="LY">Libyan Arab Jamahiriya</option>
						        <option value="LI">Liechtenstein</option>
						        <option value="LT">Lithuania</option>
						        <option value="LU">Luxembourg</option>
						        <option value="MO">Macau</option>
						        <option value="MK">Macedonia, The Former Yugoslav Republic of</option>
						        <option value="MG">Madagascar</option>
						        <option value="MW">Malawi</option>
						        <option value="MY">Malaysia</option>
						        <option value="MV">Maldives</option>
						        <option value="ML">Mali</option>
						        <option value="MT">Malta</option>
						        <option value="MH">Marshall Islands</option>
						        <option value="MQ">Martinique</option>
						        <option value="MR">Mauritania</option>
						        <option value="MU">Mauritius</option>
						        <option value="YT">Mayotte</option>
						        <option value="MX">Mexico</option>
						        <option value="FM">Micronesia, Federated States of</option>
						        <option value="MD">Moldova, Republic of</option>
						        <option value="MC">Monaco</option>
						        <option value="MN">Mongolia</option>
						        <option value="MS">Montserrat</option>
						        <option value="MA">Morocco</option>
						        <option value="MZ">Mozambique</option>
						        <option value="MM">Myanmar</option>
						        <option value="NA">Namibia</option>
						        <option value="NR">Nauru</option>
						        <option value="NP">Nepal</option>
						        <option value="NL">Netherlands</option>
						        <option value="AN">Netherlands Antilles</option>
						        <option value="NC">New Caledonia</option>
						        <option value="NZ">New Zealand</option>
						        <option value="NI">Nicaragua</option>
						        <option value="NE">Niger</option>
						        <option value="NG">Nigeria</option>
						        <option value="NU">Niue</option>
						        <option value="NF">Norfolk Island</option>
						        <option value="MP">Northern Mariana Islands</option>
						        <option value="NO">Norway</option>
						        <option value="OM">Oman</option>
						        <option value="PK">Pakistan</option>
						        <option value="PW">Palau</option>
						        <option value="PA">Panama</option>
						        <option value="PG">Papua New Guinea</option>
						        <option value="PY">Paraguay</option>
						        <option value="PE">Peru</option>
						        <option value="PH">Philippines</option>
						        <option value="PN">Pitcairn</option>
						        <option value="PL">Poland</option>
						        <option value="PT">Portugal</option>
						        <option value="PR">Puerto Rico</option>
						        <option value="QA">Qatar</option>
						        <option value="RE">Reunion</option>
						        <option value="RO">Romania</option>
						        <option value="RU">Russian Federation</option>
						        <option value="RW">Rwanda</option>
						        <option value="KN">Saint Kitts and Nevis</option> 
						        <option value="LC">Saint LUCIA</option>
						        <option value="VC">Saint Vincent and the Grenadines</option>
						        <option value="WS">Samoa</option>
						        <option value="SM">San Marino</option>
						        <option value="ST">Sao Tome and Principe</option> 
						        <option value="SA">Saudi Arabia</option>
						        <option value="SN">Senegal</option>
						        <option value="SC">Seychelles</option>
						        <option value="SL">Sierra Leone</option>
						        <option value="SG">Singapore</option>
						        <option value="SK">Slovakia (Slovak Republic)</option>
						        <option value="SI">Slovenia</option>
						        <option value="SB">Solomon Islands</option>
						        <option value="SO">Somalia</option>
						        <option value="ZA">South Africa</option>
						        <option value="GS">South Georgia and the South Sandwich Islands</option>
						        <option value="ES">Spain</option>
						        <option value="LK">Sri Lanka</option>
						        <option value="SH">St. Helena</option>
						        <option value="PM">St. Pierre and Miquelon</option>
						        <option value="SD">Sudan</option>
						        <option value="SR">Suriname</option>
						        <option value="SJ">Svalbard and Jan Mayen Islands</option>
						        <option value="SZ">Swaziland</option>
						        <option value="SE">Sweden</option>
						        <option value="CH">Switzerland</option>
						        <option value="SY">Syrian Arab Republic</option>
						        <option value="TW">Taiwan, Province of China</option>
						        <option value="TJ">Tajikistan</option>
						        <option value="TZ">Tanzania, United Republic of</option>
						        <option value="TH">Thailand</option>
						        <option value="TG">Togo</option>
						        <option value="TK">Tokelau</option>
						        <option value="TO">Tonga</option>
						        <option value="TT">Trinidad and Tobago</option>
						        <option value="TN">Tunisia</option>
						        <option value="TR">Turkey</option>
						        <option value="TM">Turkmenistan</option>
						        <option value="TC">Turks and Caicos Islands</option>
						        <option value="TV">Tuvalu</option>
						        <option value="UG">Uganda</option>
						        <option value="UA">Ukraine</option>
						        <option value="AE">United Arab Emirates</option>
						        <option value="GB">United Kingdom</option>
						        <option value="US">United States</option>
						        <option value="UM">United States Minor Outlying Islands</option>
						        <option value="UY">Uruguay</option>
						        <option value="UZ">Uzbekistan</option>
						        <option value="VU">Vanuatu</option>
						        <option value="VE">Venezuela</option>
						        <option value="VN">Viet Nam</option>
						        <option value="VG">Virgin Islands (British)</option>
						        <option value="VI">Virgin Islands (U.S.)</option>
						        <option value="WF">Wallis and Futuna Islands</option>
						        <option value="EH">Western Sahara</option>
						        <option value="YE">Yemen</option>
						        <option value="YU">Yugoslavia</option>
						        <option value="ZM">Zambia</option>
						        <option value="ZW">Zimbabwe</option>
				    		</select>
				    	</div>
				    </div>
				</div>
		    	<button type="submit" class="btn btn-primary">Save</button>
		    	<button type="reset"  class="btn btn-primary">Reset</button>
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