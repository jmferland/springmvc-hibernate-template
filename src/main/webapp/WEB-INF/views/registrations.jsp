<%@ page session="false" %>
<!doctype html>
<html ng-app>
<head>

    <script src="${pageContext.request.contextPath}/web/assets/js/jquery-1.7.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/assets/js/angular-1.0.0rc6.js"></script>
    <script src="${pageContext.request.contextPath}/web/assets/js/qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/views/controller.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/assets/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/views/style.css"/>

</head>
<body>
<script language="javascript" type="text/javascript">
    <!--
    $(function () {
        utils.setup('${pageContext.request.contextPath}');
    });

    //-->
</script>

<div ng-controller="RegistrationCtrl">

    <div style=" z-index: -21; float: left;padding-top :10px; padding:10px;min-width: 250px;max-width:300px;  ">
        <form class="well form-search" ng-submit="search()">
                <div>
                    <input type="text" id="search" class="input-medium search-query" ng-model="query"/>
                    <a href="#" class="icon-search" ng-click="search()"></a>
                </div>
                <div style="padding-top: 10px;">
                    <div ng-show=" !searchResultsFound()">
                        <span class="no-records">(no results)</span>
                    </div>

                    <div ng-show=" searchResultsFound()">

                        <div ng-repeat="registration in registrations" class="search-results">
                            <span class="title">
                                <span style="font-size: smaller"><span>#</span>{{registration.id}}</span>
                                <a ng-click="load(registration)"> {{registration.customer.firstName}} {{registration.customer.lastName}} {{registration.brand}} {{registration.bin}}******{{registration.last4Digits}}</a> </span>
                        </div>

                    </div>
                </div>
            </form>
    </div>
 
    <div class="pull-left" style="padding-top: 10px;">
	    <ul class="nav nav-tabs">
	    	<li><a href="/admin/customers">Doctors</a></li>
	    	<li><a href="/admin/merchants">Patients</a></li>
	    	<li><a href="/admin/bills">Bills</a></li>
	    	<li class="active"><a href="/admin/registrations">Registrations</a></li>
	    </ul> 
	
	    <form class="form-horizontal" ng-submit="updateRegistration">
	        <fieldset>
	            <legend>
	                <span class="display-visible-{{!isRegistrationLoaded()}}"> Create New Registration </span>
	                <span class="display-visible-{{!!isRegistrationLoaded()}}"> Update {{registration.token}} {{registration.descriptor}} - <span>#</span>{{registration.id}} </span>
	            </legend>
	            <div class="control-group">
	                <label class="control-label" for="registrationCustomerId">Customer:</label>
	
	                <div class="controls">
	                	<select id="registrationCustomerId" required="required"
	                		ng-model="registration.customer.id" ng-options="customer.id as customer.firstName + ' ' + customer.lastName for customer in customers"></select>
	
	                    <p class="help-block">Change the customer</p>
	                </div>
	            </div>
	            <div class="control-group">
	                <label class="control-label" for="registrationCode">Code:</label>
	
	                <div class="controls">
	                    <input class="input-xlarge" id="registrationCode" type="text" ng-model="registration.code"
	                           placeholder="code" required="required"/>
	
	                    <p class="help-block">Change the code (PAY.ON registration number)</p>
	                </div>
	            </div>
	            <div class="control-group">
	                <label class="control-label" for="registrationBrand">Brand:</label>
	
	                <div class="controls">
	                    <input class="input-xlarge" id="registrationBrand" type="text" ng-model="registration.brand"
	                           placeholder="brand" required="required"/>
	
	                    <p class="help-block">Change the brand</p>
	                </div>
	            </div>
	            <div class="control-group">
	                <label class="control-label" for="registrationBin">Bin:</label>
	
	                <div class="controls">
	                    <input class="input-xlarge" id="registrationBin" type="text" ng-model="registration.bin"
	                           placeholder="bin" required="required"/>
	
	                    <p class="help-block">Change the bin</p>
	                </div>
	            </div>
	            <div class="control-group">
	                <label class="control-label" for="registrationLast4Digits">Last 4 Digits:</label>
	
	                <div class="controls">
	                    <input class="input-xlarge" id="registrationLast4Digits" type="text" ng-model="registration.last4Digits"
	                           placeholder="last4Digits" required="required"/>
	
	                    <p class="help-block">Change the last 4 digits</p>
	                </div>
	            </div>
	            <div class="control-group">
	                <label class="control-label" for="registrationExpiry">Expiry Date:</label>
	
	                <div class="controls">
	                	<select id="registrationExpiry"
	                		ng-model="registration.expiry.month" ng-options="month.value as month.text for month in months"></select>
	                	<select
	                		ng-model="registration.expiry.year" ng-options="year.value as year.text for year in years"></select>
	                		
	                    <p class="help-block">Change the expiry date</p>
	                </div>
	            </div>
	
	            <div class="form-actions">
	                <button type="submit" class="btn btn-primary" ng-click="save()" ng-model-instant>
	                    <a class="icon-plus"></a> Save
	                </button>
	                <button class="btn btn-danger" ng-click="delete()" onclick="return confirm('Are you sure you want to delete this?')"><a class="icon-minus"></a> Delete</button>
	                <button class="btn " ng-click="trash()"><a class="icon-trash"></a> Cancel</button>
	            </div>
	        </fieldset>
	    </form>
    </div>
</div>
</body>
</html>