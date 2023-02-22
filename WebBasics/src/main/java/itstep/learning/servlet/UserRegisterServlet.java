package itstep.learning.servlet;

import com.google.inject.Singleton;
import itstep.learning.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Singleton
public class UserRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher( "WEB-INF/reg-user.jsp" )
                .forward( req, resp ) ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel model = parseModel( req ) ;
        try {
            validateModel( model ) ;

        }
        catch( IllegalArgumentException ex ) {
            System.err.println( ex.getMessage() ) ;
        }
    }

    private UserModel parseModel( HttpServletRequest req ) {
        UserModel model = new UserModel() ;
        model.setLogin( req.getParameter( "user-login" ) ) ;
        model.setPass1( req.getParameter( "user-pass1" ) ) ;
        model.setPass2( req.getParameter( "user-pass2" ) ) ;
        model.setName(  req.getParameter( "user-name"  ) ) ;
        model.setEmail( req.getParameter( "user-email" ) ) ;
        return model ;
    }
    private void validateModel( UserModel model ) throws IllegalArgumentException {
        String message = null ;
        if( model == null ) message = "Missing all parameters" ;
        else if( model.getLogin() == null ) message = "Missing parameter: user-login" ;
        else {
            String login = model.getLogin() ;
            if( "".equals( login ) ) message = "user-login should not be empty" ;
            else {
                // TODO: проверить логин на занятость
            }
        }
        if( message == null ) {
            String pass1 = model.getPass1() ;
            String pass2 = model.getPass2() ;
            if( pass1 == null || pass2 == null )  {
                message = "Missing parameter: user-passwords" ;
            }
            else {
                if( pass1.length() < 3 ) message = "Password too short" ;
                if( ! pass1.equals( pass2 ) ) message = "Passwords mismatch" ;
                // TODO: проверить пароль на сложность
            }
        }
        if( message != null ) {
            throw new IllegalArgumentException( message ) ;
        }
    }
}
