package web;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mysql.jdbc.Connection;

/**
 * Application Lifecycle Listener implementation class DBConnectionManage
 *
 */
@WebListener
public class DBConnectionManage implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DBConnectionManage() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  { 
         // TODO Auto-generated method stub
    	Connection conn = (Connection) event.getServletContext().getAttribute("DBconnection");
    	
    	try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
         // TODO Auto-generated method stub
    	Connection conn = null;
		Properties connectionProps = new Properties();
		
		ServletContext sc = event.getServletContext();
		String url = sc.getInitParameter("dburl");
		String user = sc.getInitParameter("dbuser");
		String passwd = sc.getInitParameter("dbpasswd");
		
		connectionProps.put("user", user);
		connectionProps.put("password", passwd);

		try {
			conn = (Connection) DriverManager.getConnection(url, connectionProps);
			if (conn != null) sc.setAttribute("DBconnection", conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


    }
	
}
