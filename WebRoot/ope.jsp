<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html> 
	<head>
		<title>Vi</title>
	</head>
	<body>
		��ӭ<bean:write name="cus1" property="cname"/>��������;
		���������<bean:write name="cus1" property="cbalance"/>Ԫ!!
		<HR>
		<html:link page="/cunkuan.jsp">���</html:link><BR>
		<html:link page="/qukuan.jsp">ȡ��</html:link><BR>
		<html:link page="/menu.jsp">�˳�</html:link><BR>
	</body>
</html>