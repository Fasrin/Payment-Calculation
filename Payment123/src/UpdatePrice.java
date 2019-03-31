import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatePrice
 */
@WebServlet("/UpdatePrice")
public class UpdatePrice extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UpdatePrice() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String[] pid = request.getParameterValues("pid");
		String[] qty = request.getParameterValues("qty");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		for (int i=0; i<pid.length; i++) {
			out.println(pid[i] + " qty: " + qty[i] + "<br>" );
		}
		
		/*try {
			String qry="update payment set qty=? where payment_id=? ";
			 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","");
			PreparedStatement st = con.prepareStatement(qry);
			
			st.setString(1, qty);
			st.setString(2, pid);
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}*/

		        
	}

}
