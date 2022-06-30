package academy.prog;

import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    static final String LOGIN = "admin";
    static final String PASS = "admin123456";

 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(true);
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String age = request.getParameter("age");

        if(login==null|| login.equals("")){
        session.setAttribute("error_login", "error_login");

        }else{

            session.removeAttribute("error_login");
        }

         if(password==null|| password.equals("")){
        session.setAttribute("error_password", "error_password");
             session.removeAttribute("error_password1");
         }else if((password.length())<10){

             session.setAttribute("error_password1", "More than 10 characters required");
             session.removeAttribute("error_password");
        } else {
            session.removeAttribute("error_password");
             session.removeAttribute("error_password1");
         }


         if(age==null|| age.equals("")){
        session.setAttribute("error_age", "error_age");

        }else{

             session.removeAttribute("error_age");
         }

        if (LOGIN.equals(login) && PASS.equals(password)) {

            session.setAttribute("user_login", login);
            session.setAttribute("user_password", password);
            session.setAttribute("user_age", age);
        }

        response.sendRedirect("index.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String a = request.getParameter("a");
        HttpSession session = request.getSession(false);

        if ("exit".equals(a) && (session != null))
            session.removeAttribute("user_login");

        response.sendRedirect("index.jsp");
    }
}
