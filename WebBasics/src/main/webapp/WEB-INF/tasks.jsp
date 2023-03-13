<%@ page import="itstep.learning.data.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String domain = request.getContextPath() ;
    User authUser = (User) request.getAttribute( "authUser" ) ;
%>

<div class="row">
    <h4>Добавить задачу</h4>
    <form class="col s10 offset-s1 m8 offset-m2 l6 offset-l3" method="post" enctype="multipart/form-data">
        <div class="row input-field"><i class="material-icons prefix">person_outline</i>
            <input id="task-name" type="text" name="task-name">
            <label for="task-name">Название</label>
        </div>
        <div class="input-field col s12">
            <select>
                <option value="" disabled selected>Выберите команду</option>
                <option value="1">Option 1</option>
                <option value="2">Option 2</option>
                <option value="3">Option 3</option>
            </select>
            <label>Команда</label>
        </div>
        <div class="row input-field right-align">
            <button class="btn waves-effect waves-teal" type="submit">создать<i class="material-icons right">add</i></button>
        </div>
    </form>
</div>