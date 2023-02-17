package itstep.learning.servlet;

import itstep.learning.model.FormsModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;

public class FormsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding( "UTF-8" ) ;  // установка кодировки чтения из запроса. ДО ПЕРВОГО ЧТЕНИЯ
        resp.setCharacterEncoding( "UTF-8" ) ;

        FormsModel model = parseModel( req ) ;
        req.setAttribute( "formsModel", model ) ;
        req.getRequestDispatcher( "WEB-INF/forms.jsp" )
                .forward( req, resp ) ;
    }

    private FormsModel parseModel( HttpServletRequest req ) {
        FormsModel model = new FormsModel() ;
        model.setMethod( req.getMethod() ) ;
        // region "text"
        String text = req.getParameter( "text" ) ;   // "text" - name of <input name="text" .../>
        if( text == null ) {   // нет параметра (скорее всего нет передачи формы)
            model.setText( "NULL" ) ;
        }
        else if( text.isEmpty() ) {   // параметр передан, но значение отсутствует
            model.setText( "empty" ) ;
        }
        else {
            model.setText( text ) ;
        }
        // endregion
        // region "number"
        String numberParam = req.getParameter( "number" ) ;
        if( numberParam == null ) {
            model.setNumber( -1 ) ;
        }
        else if( numberParam.isEmpty() ) {
            model.setNumber( 0 ) ;
        }
        else {
            try { model.setNumber( Double.parseDouble( numberParam ) ) ; }
            catch( NumberFormatException ignored ) { model.setNumber( -0.1 ) ; }
        }
        // endregion
        // region "date"
        String dateParam = req.getParameter( "date" ) ;
        if( dateParam == null ) {
            model.setDate( null ) ;
        }
        else if( dateParam.isEmpty() ) {
            model.setDate( new Date() ) ;
        }
        else {
            String dateFormat = "yyyy-MM-dd" ;
            SimpleDateFormat format = new SimpleDateFormat( dateFormat ) ;
            try { model.setDate( format.parse( dateParam ) ) ; }
            catch( ParseException ignored ) { model.setDate( Date.from( Instant.EPOCH ) ) ; }
        }
        // endregion
        return model ;
    }
}
/*
Д.З. Сверстать две формы на странице /forms
Одна методом GET, другая POST, обе на action /forms
Заложить передачу нескольких полей
- строка
- число
- дата
- цвет
 */