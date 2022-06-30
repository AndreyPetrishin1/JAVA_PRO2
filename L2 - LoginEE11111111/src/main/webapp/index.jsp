<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Prog Academy</title>
  </head>
  <body>
    <% String login = (String)session.getAttribute("user_login"); %>
    <% String password = (String)session.getAttribute("user_password"); %>
    <% String age = (String)session.getAttribute("user_age"); %>
    <% String error_login = (String) session.getAttribute("error_login"); %>
    <% String error_password = (String) session.getAttribute("error_password"); %>
    <% String error_password1 = (String) session.getAttribute("error_password1"); %>
    <% String error_age = (String)  session.getAttribute("error_age"); %>


    <% if (login == null || "".equals(login)) { %>
        <form action="/login" method="POST">
            Login: <input type="text" name="login"><br>
            <%if(error_login!=null) {%>
            <%= error_login%>
            <%}%><br>

            Password: <input type="password" name="password"><br>
             <%if(error_password!=null) {%>
            <%= error_password %><br>
              <%}else if(error_password1!=null){%>

            <%= error_password1 %><br>
            <%}%>
            Age: <input type="text" name="age"><br>
             <%if(error_age!=null) {%>
            <%= error_age %>
            <%}%><br>
            <input type="submit" />
        </form>

    <% } else if(Integer.parseInt(age)<18){ %>
    <h1>You have old < 18</h1>
    <% } else { %>
         <h1>You are logged in as: <%=age %></h1>
        <h1>You are logged in as: <%= login %></h1>
         <h1>You are password in as: <%= password %></h1>
        <br>Click this link to <a href="/login?a=exit">logout</a>
    <% } %>
  </body>
</html>

