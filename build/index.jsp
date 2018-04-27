<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" 
	contentType="text/html; 
	charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.*"
%>
<%	
	String ipAddress = "It's not very nice to hide your IP!";
	StringBuffer exMsg = new StringBuffer();
	try {
	 	ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
	} catch (Exception ex) {
		exMsg.append("<div class='error'>");
		StackTraceElement[] ste = ex.getStackTrace();
		int counter = 0;
		out.println(ex.getMessage() + "<br>");
		while (counter < ste.length && counter < 15) {
			out.println(ste[counter] + "<br>");
			counter++;
		}
		out.println("</div>");
	}
%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Docker Demo: My IP</title>
<style type="text/css">
	.theme-table {
	    border:1px solid black;
	    table-layout: fixed;
	}
	body { 
	    background-image: url('sprintbackground.png');
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-position: center; 
	}
	.error { 
		text-align: left;
		color: red;
		font-weight: bold;
	}
</style>
</head>

<body>
<% out.println(exMsg) %>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div align="center">
<table class="theme-table" width="500px">
    <tr>
        <td colspan="2" style="color: #3366ff;" align="center"><h3>Docker IP Address Demo</h3></td>
    </tr>
    <tr>
        <td width="50%" align="right">IP Address&nbsp;&nbsp;</td>
        <td align="left"><%= ipAddress %></td>
    </tr>
    <!--
    This intentionally left blank and is to be used for the mongo DB read/write visits
    <tr>
        <td>blank</td>
        <td>blank</td>
    </tr>
    -->
</table>
</div>
</body>

</html>
