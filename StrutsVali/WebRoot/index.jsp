<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Registration</title>
</head>
<body>
 	<s:form action = "reg" method = "post">
 		<s:bean name="org.j2ee.ssh.AgeAction" id="aa"></s:bean>
 		<s:textfield name="user.username" label="User Name:"></s:textfield>
 		<s:property value="errors.user.username" />
 		<s:password name="user.password" label="Password:"> </s:password>
 		<s:password name="user.password2" label="Retype passwd:"></s:password>
 		<s:select list="#aa.agemap" name="user.age" label="age" headValue="Actual age" headerKey="0" />
 		<s:reset value="reset" align="left"></s:reset>
 		<s:submit value="register" align="left"></s:submit>
 	</s:form> 	
</body>
</html>