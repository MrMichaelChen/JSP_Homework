public class DownLoadServlet extends HttpServlet {  
  
    public void doGet(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
//      req.setCharacterEncoding("utf-8");  
//      resp.setCharacterEncoding("utf-8");  
//      resp.setContentType("text/html;charset=utf-8");  
//      req.setCharacterEncoding("utf-8");  
//      resp.setContentType("text/html;charset=UTF-8");  
//        resp.setContentType("text/plain");  
        //���б����ת������Ϊ����ʶ������  
        resp.setHeader("content-type","text/html;charset=UTF-8");  
        String path = getServletContext().getRealPath("/") + "images/";  
        String fileName = req.getParameter("filename");  
        String filename = null;  
        filename = new String(fileName.getBytes("8859_1"),"utf-8");  
//      filename = new String(filename.getBytes("8859_1"),"uft-8");  
        System.out.println("·����" + path + "�ļ�����" + filename);  
        File file = new File(path + filename);  
        if (file.exists()) {  
            //�������ص�ʱ����������ı��벻�������������ʶ�����ı��룬����Ҫ����ת��  
            String value = new String(filename.getBytes("utf-8"),"ISO-8859-1");  
            resp.setContentType("application/x-msdownload");  
            resp.setHeader("Content-Disposition", "attachment;filename=\""  
                    + value + "\"");  
            InputStream inputStream = new FileInputStream(file);  
            ServletOutputStream outputStream = resp.getOutputStream();  
            byte b[] = new byte[1024];  
            int n;  
            while ((n = inputStream.read(b)) != -1) {  
                outputStream.write(b, 0, n);  
            }  
  
            outputStream.close();  
            inputStream.close();  
        } else {  
            req.setAttribute("errorResult", "�ļ�����������ʧ�ܣ���");  
            resp.sendRedirect("luntan.jsp");  
        }  
    }  
  
    public void doPost(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
        doGet(req, resp);  
    }  
  
}  