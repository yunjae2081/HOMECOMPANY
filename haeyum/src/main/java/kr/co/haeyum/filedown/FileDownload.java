package kr.co.haeyum.filedown;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileDownload")
public class FileDownload extends HttpServlet
{
	public static String uploadPath;

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		doGet( request, response );
	}
	
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
	{
    	String orgFileName  ;
    	String realFileName ;
    	String type ;
		
    	orgFileName  = request.getParameter( "orgFileName" );
    	realFileName = request.getParameter( "realFileName" );
    	type = request.getParameter( "type" );

    	uploadPath = request.getServletContext().getRealPath("/assignment");

     	File file = new File( uploadPath, realFileName );
    	FileInputStream fileInput = new FileInputStream( file);

    	if (type == null || !type.equals("imageDraw")) {
    		response.setHeader("Content-Type", "application/octet-stream");
    		response.setHeader("Content-Disposition", "attachment;filename="+ new String(orgFileName.getBytes("UTF-8"),"8859_1"));
	    	response.setHeader("Content-Transfer-Encoding", "binary;");
	    	response.setHeader("Content-Length", String.valueOf(file.length()));
	    	response.setHeader("Pragma", "no-cache;");
	    	response.setHeader("Expires", "-1;");
    	} else {
    		response.setHeader("Content-Type", "image/jpg");
    	}

    	if (file.isFile()) {
    		BufferedInputStream fin = new BufferedInputStream( fileInput );
    		BufferedOutputStream outs = new BufferedOutputStream( response.getOutputStream() );
    
    		int read = 0;
    		while ( ( read = fin.read() ) != -1 ){
    			outs.write(read);
    		}
    		outs.close();
    		fin.close();
    	}
	}
	
}