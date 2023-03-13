<%@ page import="itstep.learning.data.entity.User" %>
<%@ page import="itstep.learning.data.entity.Team" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String domain = request.getContextPath() ;
    User authUser = (User) request.getAttribute( "authUser" ) ;
    List<Team> teams = (List<Team>) request.getAttribute( "teams" ) ;
%>

<div class="row">
    <h4>Добавить задачу</h4>
    <form class="col s10 offset-s1 m8 offset-m2 l6 offset-l3" method="post" enctype="multipart/form-data">
        <div class="row input-field"><i class="material-icons prefix">content_paste</i>
            <input id="task-name" type="text" name="task-name">
            <label for="task-name">Название</label>
        </div>
        <div class="row input-field"><i class="material-icons prefix">people_outline</i>
            <select name="task-team">
                <option value="" disabled selected>Выберите команду</option>
                <% for( Team team : teams ) { %>
                <option value="<%= team.getId() %>">
                    <%= team.getName() %>
                </option>
                <% } %>
            </select>
            <label>Команда</label>
        </div>
        <div class="row input-field"><i class="material-icons prefix">event_available</i>
            <input id="task-deadline" type="text" class="datepicker" name="task-deadline">
            <label for="task-deadline">Завершение</label>
        </div>
        <div class="row input-field"><i class="material-icons prefix">priority_high</i>
            <select name="task-priority">
                <option value="" disabled selected>Выберите приоритет</option>
                <option value="0">Обычный</option>
                <option value="1">Высокий</option>
                <option value="2">Экстремальный</option>
            </select>
            <label>Приоритет</label>
        </div>
        <div class="row input-field right-align">
            <button class="btn waves-effect waves-teal" type="submit">создать<i class="material-icons right">add</i></button>
        </div>
    </form>
</div>
Д.З. Создать несколько команд, добавить (зарегистрировать) несколько пользователей
распределить пользователей по командам: некоторые пользователи участвуют в нескольких
командах, некоторые только в одной. Приложить SQL коды заполнения БД
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('select');
        var instances = M.FormSelect.init(elems, {});
        elems = document.querySelectorAll('.datepicker');
        instances = M.Datepicker.init(elems, {});
    });
</script>