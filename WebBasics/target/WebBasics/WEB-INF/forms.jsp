<%@ page import="itstep.learning.model.FormsModel" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    FormsModel model = (FormsModel) request.getAttribute( "formsModel" ) ;
%>
<html>
<head>
    <title>Forms</title>
</head>
<body>
<h1>Передача данных. Формы</h1>

<%= model.getMessage() %>
</body>
</html>
