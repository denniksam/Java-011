<%@ page import="itstep.learning.data.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<h2>My profile</h2>
<%
    User profileUser = (User) request.getAttribute( "authUser" ) ;
    String contextPath = request.getContextPath() ;
%>
<div class="row">
    <div class="col l10 m11 s12">
        <h2 class="header">Personal profile</h2>
        <div class="card horizontal">
            <div class="card-image">
                <img style="max-width: 90%"
                     src="<%= contextPath %>/image/<%= profileUser.getAvatar() %>"/>
            </div>
            <div class="card-stacked">
                <div class="card-content">
                    <p>Login: <b><%= profileUser.getLogin() %></b></p>
                    <p>Real Name:
                        <b id="user-name"><%= profileUser.getName() %></b>
                        <a id="user-name-btn" class="btn-floating btn-small waves-effect waves-light teal">
                            <i class="material-icons">edit</i>
                        </a>
                    </p>
                    <p>Email: <%= profileUser.getEmail() %></p>
                    <p>Active from: <%= profileUser.getRegDt() %></p>
                </div>
                <div class="card-action">
                    <a href="mailto:<%= profileUser.getEmail() %>">Send Message</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const userNameBtn = document.getElementById("user-name-btn");
        userNameBtn.addEventListener("click", userNameClick);
    });
    function userNameClick(e) {
        const userName = document.getElementById("user-name");
        if(userName.getAttribute("contenteditable")) {
            userName.removeAttribute("contenteditable");
            e.target.innerHTML = '<i class="material-icons">edit</i>';
        }
        else {
            userName.setAttribute("contenteditable", "true");
            userName.focus();
            e.target.innerHTML = '<i class="material-icons">save</i>';
        }
    }
</script>