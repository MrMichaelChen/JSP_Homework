package com.dw.servlet;  
  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.RandomAccessFile;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
    public UploadServlet() {  
        super();  
    }  
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doPost(request,response);  
    }  
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        request.setCharacterEncoding("utf-8");  
        response.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8"); 
          
        //��request�л�ȡ�ı���������Ϣ  
        InputStream fileSourceStream = request.getInputStream();  
        String tempFileName = "F:/tempFile";  
  
        //������ʱ�ļ���������ϴ����ı�������  
        File tempFile = new File(tempFileName);  
          
        //outputStram�ļ������ָ�����tempFile  
        FileOutputStream outputStream = new FileOutputStream(tempFile);  
          
        //��ȡ�ļ���  
        byte temp[] = new byte[1024];  
        int n;  
        while(( n = fileSourceStream.read(temp)) != -1){  
            outputStream.write(temp, 0, n);  
        }  
        outputStream.close();  
        fileSourceStream.close();  
          
        //��ȡ�ϴ��ļ�������   
        RandomAccessFile randomFile = new RandomAccessFile(tempFile,"r");  
        randomFile.readLine();    
        String str = randomFile.readLine();  
        int start = str.lastIndexOf("=") + 2;  
        int end = str.lastIndexOf("\"");  
        String filename = str.substring(start, end);  
          
        //��λ�ļ�ָ�뵽�ļ�ͷ  
        randomFile.seek(0);  
        long startIndex = 0;  
        int i = 1;  
        //��ȡ�ļ����ݵĿ�ʼλ��  
        while(( n = randomFile.readByte()) != -1 && i <=4){  
            if(n == '\n'){  
                startIndex = randomFile.getFilePointer();  
                i ++;  
            }  
        }  
        startIndex = startIndex -1; //����һ��Ҫ��1����Ϊǰ������һ������������׺���  
        //��ȡ�ļ����ݽ���λ��  
        randomFile.seek(randomFile.length());  
        long endIndex = randomFile.getFilePointer();  
        int j = 1;  
        while(endIndex >=0 && j<=2){  
            endIndex--;  
            randomFile.seek(endIndex);  
            if(randomFile.readByte() == '\n'){  
                j++;  
            }  
        }  
          
        //���ñ����ϴ��ļ���·��  
        String realPath =  "F:/file";  
        File fileupload = new File(realPath);  
        if(!fileupload.exists()){  
            fileupload.mkdir();  
        }  
        
        File tempFile1 =new File(filename.trim());         
        String filename1 = tempFile1.getName();          
        
        File saveFile = new File(realPath,filename1);  
        RandomAccessFile randomAccessFile = new RandomAccessFile(saveFile,"rw");  
        
        //������ֹλ�ô���ʱ�ļ��ж�ȡ�ļ�����  
        randomFile.seek(startIndex);  
        while(startIndex < endIndex){  
            randomAccessFile.write(randomFile.readByte());  
            startIndex = randomFile.getFilePointer();  
        }  
        //�ر������������ ɾ����ʱ�ļ�  
        randomAccessFile.close();  
        randomFile.close();  
        tempFile1.delete();  
          
        request.setAttribute("result", "success");  
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShowUpDown.jsp");  
        dispatcher.forward(request, response);  
    }  
  
}  