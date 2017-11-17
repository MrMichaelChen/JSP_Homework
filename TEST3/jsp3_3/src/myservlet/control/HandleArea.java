package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Area;

@WebServlet("/handle")
public class HandleArea extends HttpServlet{
		public void init(ServletConfig config) throws ServletException{
			super.init(config);
		}
		public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			doPost(request,response);
		}
		public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			Area dataBean = new Area();
			HttpSession session = request.getSession(true);
			session.setAttribute("data", dataBean);
			try {
				double a = Double.parseDouble(request.getParameter("a"));
				double b = Double.parseDouble(request.getParameter("b"));
				double c = Double.parseDouble(request.getParameter("c"));
				dataBean.setA(a);
				dataBean.setB(b);
				dataBean.setC(c);
				double s = -1;
				s = (a+b)*c/2.0;
				dataBean.setArea(s);
				dataBean.setMess("ÌÝÐÎ");
			}
			catch(Exception e) {
				dataBean.setArea(-1);
				dataBean.setMess(""+ e);
			}
			response.sendRedirect("inputData.jsp");
		}
		
}
