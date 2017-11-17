package myservlet.control;
import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ch5/word")
public class Decompose extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
	super.init(config);
}
public void service(HttpServletRequest request,HttpServletResponse 
	response)throws IOException{
	request.setCharacterEncoding("gb2312");
	response.setContentType("text/html;charset = gb2312");
	PrintWriter out= response.getWriter();
	out.println("<html><body bgcolor=yellow>");
	String str = request.getParameter("english");
	if(str==null||str.length()==0)
		return;
	String []word =str.split("[^a-zA-Z]+");
	int n=0;
	try{
		for(int i=0;i<word.length;i++){
			if(word[i].length()>=1){
				n++;
				out.print("<br>"+word[i]);
			}
		}
	}
	catch(NumberFormatException e){
		out.print(" "+e);
	}
	out.print("<h2>the date is :"+n);
	out.println("</body></html>");
	}
}
