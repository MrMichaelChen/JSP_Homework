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
          
        //从request中获取文本输入流信息  
        InputStream fileSourceStream = request.getInputStream();  
        String tempFileName = "F:/tempFile";  
  
        //设置临时文件，保存待上传的文本输入流  
        File tempFile = new File(tempFileName);  
          
        //outputStram文件输出流指向这个tempFile  
        FileOutputStream outputStream = new FileOutputStream(tempFile);  
          
        //读取文件流  
        byte temp[] = new byte[1024];  
        int n;  
        while(( n = fileSourceStream.read(temp)) != -1){  
            outputStream.write(temp, 0, n);  
        }  
        outputStream.close();  
        fileSourceStream.close();  
          
        //获取上传文件的名称   
        RandomAccessFile randomFile = new RandomAccessFile(tempFile,"r");  
        randomFile.readLine();    
        String str = randomFile.readLine();  
        int start = str.lastIndexOf("=") + 2;  
        int end = str.lastIndexOf("\"");  
        String filename = str.substring(start, end);  
          
        //定位文件指针到文件头  
        randomFile.seek(0);  
        long startIndex = 0;  
        int i = 1;  
        //获取文件内容的开始位置  
        while(( n = randomFile.readByte()) != -1 && i <=4){  
            if(n == '\n'){  
                startIndex = randomFile.getFilePointer();  
                i ++;  
            }  
        }  
        startIndex = startIndex -1; //这里一定要减1，因为前面多读了一个，这里很容易忽略  
        //获取文件内容结束位置  
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
          
        //设置保存上传文件的路径  
        String realPath =  "F:/file";  
        File fileupload = new File(realPath);  
        if(!fileupload.exists()){  
            fileupload.mkdir();  
        }  
        
        File tempFile1 =new File(filename.trim());         
        String filename1 = tempFile1.getName();          
        
        File saveFile = new File(realPath,filename1);  
        RandomAccessFile randomAccessFile = new RandomAccessFile(saveFile,"rw");  
        
        //根据起止位置从临时文件中读取文件内容  
        randomFile.seek(startIndex);  
        while(startIndex < endIndex){  
            randomAccessFile.write(randomFile.readByte());  
            startIndex = randomFile.getFilePointer();  
        }  
        //关闭输入输出流并 删除临时文件  
        randomAccessFile.close();  
        randomFile.close();  
        tempFile1.delete();  
          
        request.setAttribute("result", "success");  
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShowUpDown.jsp");  
        dispatcher.forward(request, response);  
    }  
  
}  