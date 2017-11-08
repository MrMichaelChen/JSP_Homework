<form action="uploadServlet.do" method="post"  
        enctype="multipart/form-data">  
        <input id="myfile" name="myfile" type="file"  
             /> <input type="submit" value="up" />${result}  
    </form>  
    <a href="downloadServlet.do?filename=test1.txt">download</a>  
       ${errorResult}  