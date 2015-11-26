<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/modern-business.css" rel="stylesheet" type="text/css" />

<title>CreditCard</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="custHome.jsp">PM Online Banking System</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href='custHome.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Home</a>
                    </li>
                    <li class = "dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        <%--  <li>
                                <a href='viewBalance.jsp=<%=session.getAttribute( "currentUser" )%>'>View Balance</a>
                            </li> --%>
                             <li>
                                <a href='viewTransaction.jsp?value=<%=session.getAttribute( "currentUser" )%>'>View Transaction</a>
                            </li>
                        </ul>
                    </li>
                     <li class = "dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href='transfer.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Transfer<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                         <li>
                                <a href='withdrawal.jsp?value=<%=session.getAttribute( "currentUser" )%>'>WithDraw</a>
                            </li>
                             <li>
                                 <a href='DepositMain.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Deposit</a>
                            </li>
                        </ul>
                    </li>
                    <li >
                        <a href='creditCard.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Credit Card</a>
                    </li>
                     <li >
                        <a href='paybills.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Pay Bills</a>
                    </li>
                    <li >
                        <a href='forgotPassword.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Mortgage</a>
                    </li>
                     <li >
                        <a href='forgotPassword.jsp?value=<%=session.getAttribute( "currentUser" )%>'>Change Password</a>
                    </li>
                    
                    <li >
                        <a href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<fieldset>
<legend><b> Fixed</b></legend>
<h3 align=center> Investment in Fixed Deposit </h3>
<p align=center><b>Please select the Amount and Time period to invest</b></p>
<form name="shareform" action="FixedDepInv" onSubmit="return payValid();" method="post">
<table width=50% align=center cellpadding=5 cellspacing=0 bgcolor="#D5FFD5">
<tr><td>&nbsp;</td><tr>
<%
try
{	
	System.out.println("------------------> ACC TYPE -------"+session.getAttribute("InvAccountType").toString());
	System.out.println("------------------> AccountNo -------"+session.getAttribute("InvAccountNo").toString());
	
	String AccountType = session.getAttribute("InvAccountType").toString();
	String AccountNo = session.getAttribute("InvAccountNo").toString();	
	String Balance = null;
	PreparedStatement state;
	ResultSet result;
	
	if(AccountType.equals("Savings"))
	{
		state =connect.prepareStatement("SELECT * FROM SAVACC WHERE SAVACCNO=?");	
		state.setString(1,AccountNo);
		result=state.executeQuery();
		
		while(result.next()){			
			Balance=result.getString("ACC_BALANCE");
		}
	
	}else{
		
		state =connect.prepareStatement("SELECT * FROM CHCKACC WHERE CHCKACCNO=?");	
		state.setString(1,AccountNo);
		result=state.executeQuery();
		
		while(result.next()){			
			Balance=result.getString("ACC_BALANCE");
		}
		
	}
 
  result.close();
  state.close();
  %>
<tr>
<td height="25"><div align="right">Account Type :</div></td>
<td><%=AccountType%></td>
</tr>
<tr>
<tr>
<td height="25"><div align="right">Account Number :</div></td>
<td><%=AccountNo%></td>
</tr>

<tr><td><input type="hidden" name="accType" value=<%=AccountType%>></td><td><input type="hidden" name="balAmt" value=<%=Balance%>></td><td><input type="hidden" name="accno" value=<%=AccountNo%>></td></tr>  
 <%
  
}catch(Exception e){
System.out.println("---------> error here DEPOSIT DETAIL CASH---->"+e.getMessage());
}
%>
<tr><td height="25"><div align="right">Select no of Months :</div></td>
<td><select style="width: 270px;" name="fdOption">
<%
PreparedStatement state;
ResultSet result;
try
{	    
	    state =connect.prepareStatement("SELECT * FROM FDPRE");		
		result=state.executeQuery();
		
		while(result.next()){
%>			
			<option value="<%=result.getString("TIMEPERIOD")+"/"+result.getString("RATEINTRST")%>"><%=result.getString("TIMEPERIOD")+" - Interest "+result.getString("RATEINTRST")+"%"%></option>
<%			
		 }
		 
		  result.close();
		  state.close();
 %>
 </select></td></tr>
 <%
}catch(Exception e){
	System.out.println("---------> error here DEPOSIT DETAIL CASH---->"+e.getMessage());	
}
%>
<tr>
<td height="25"><div align="right">Amount to Invest :</div></td>
<td><input type="text" name="invamt" value="" ></td>
</tr>
<tr>
<td colspan=2 align=center bgcolor="#D5FFD5"><button type="submit" name="tranmny" value="tranmny"><u>I</u>nvest </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset"><u>R</u>eset</button></td> 
<tr><td>&nbsp;</td></tr>
<tr><td colspan="2"><div align="center"><a href="investMain.jsp">Switch Investment Type \ Account</a></div></td></tr>
<tr><td>&nbsp;</td></tr>
</table>
</form>
</fieldset>
</body>
</html>