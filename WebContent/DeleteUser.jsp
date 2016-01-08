<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%@ include file="AdminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>DeleteUser</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/modern-business.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
## edited the line
function cashValid()
{

var amount = document.cashform.depamt.value;

if(validAmount(amount)){

	return true;	
}

return false;
}

function validAmount(amount)
{
var len = amount.length;
var noFormat = /^\d+.?\d*$/;
if(len == 0)
{
	alert('Please enter the Customer Number');
	return false;	
}	
if((amount.match(noFormat)) && (amount > 0 )){
return true;
} 
else
{
alert('Account Number is Invalid');
return false;	
}
}

</script>


</head>
<body>

 
   <p style = "margin-top: 40px;margin-bottom: 0px;margin-left: -55px;"align=center>Please enter the Customer Account Number to be Deleted.</p>
<form name="cashform" action="" onSubmit="return cashValid();" method="post">
<table width=50% align=center cellpadding=5 cellspacing=0 bgcolor="#D5FFD5">
<tr><td>&nbsp;</td><tr>	
<tr>
<td height="25"><div align="right" style = "padding-right:10px;"><b>Account Number :</b></div></td>
<td><input type="text" name="depamt" value="" maxlength="16"/></td>
</tr>
<tr>
<td colspan=2 align=center><button style = "margin-top:20px;margin-left:75px;"class="btn btn-primary" type="submit" name="dePo" value="dePo">Delete</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style = "margin-top:20px;" class="btn btn-primary" type="reset">Reset</button></td> 
</table>
</form>
</body>
</html>
