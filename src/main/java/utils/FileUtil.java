package utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class FileUtil {
    public static String uploadFile(HttpServletRequest req, String sDirectory)
        throws ServletException, IOException {
        //String path = req.getServletContext().getRealPath(sDirectory);
        Part part = req.getPart("ofile");
        String partHeader = part.getHeader("content-disposition");
        System.out.println("partHeader"+partHeader);
        String[] phArr=partHeader.split("filename=");
        String ofileName = phArr[1].trim().replace("\"", "");
        if(!ofileName.isEmpty()){
            part.write(sDirectory+ File.separator+ofileName);
        }
        return ofileName;
    }
    public static String renameFile(String sDirectory, String fileName) {
        String ext=fileName.substring(fileName.lastIndexOf("."));
        String now=new SimpleDateFormat("yyyyMMdd_Hmmss").format(new Date());
        String newFileName=now+ext;
        File oldFile=new File(sDirectory+File.separator+fileName);
        File newFile=new File(sDirectory+File.separator+newFileName);
        oldFile.renameTo(newFile);
        return newFileName;
    }
    public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory)
            throws ServletException, IOException
    {
        ArrayList<String> listFileName=new ArrayList<>();
        Collection<Part> parts=req.getParts();
        for(Part part:parts){
            if(!part.getName().equals("ofile")){
                continue;
            }
            String partHeader=part.getHeader("content-disposition");
            System.out.println("partHeader"+partHeader);
            String[] phArr=partHeader.split("filename=");
            String ofileName = phArr[1].trim().replace("\"", "");
            if(!ofileName.isEmpty()){
                part.write(sDirectory+ File.separator+ofileName);
            }
            listFileName.add(ofileName);
        }
        return listFileName;
    }

    public static void download(HttpServletRequest req, HttpServletResponse resp,
                                String directory,String sfileName, String ofileName){
        String sDirectory=req.getServletContext().getRealPath(directory);
        try {
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            String client=req.getHeader("User-Agent");
            if(client.indexOf("WOW64")==-1){
                ofileName=new String(ofileName.getBytes("UTF-8"),"ISO-8859-1");
            }else{
                ofileName=new String(ofileName.getBytes("KSC5601"),"ISO-8859-1");
            }
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", "attachment; filename="+ofileName);
            resp.setHeader("Content-Length", ""+file.length());

            OutputStream oStream = resp.getOutputStream();
            byte[] buffer = new byte[(int)file.length()];
            int readSize=0;
            while((readSize=iStream.read(buffer))>0){
                oStream.write(buffer,0,readSize);
            }
            iStream.close();
            oStream.close();

        }catch (FileNotFoundException e){
            System.out.println("FileNotFoundException");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
