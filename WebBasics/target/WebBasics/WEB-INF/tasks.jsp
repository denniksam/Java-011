<%@ page import="itstep.learning.data.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String domain = request.getContextPath() ;
    User authUser = (User) request.getAttribute( "authUser" ) ;
%>

<div>
    Добавить задачу
</div>
