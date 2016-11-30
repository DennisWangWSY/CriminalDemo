package police;
 
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.Random;
 



import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
 



import com.jfinal.core.Controller;
import com.jfinal.kit.*;
import com.jfinal.render.Render;
 
public class MyPhotoRender extends Render
{
    private String path;
    public MyPhotoRender(String path) {
    	this.path = path;
    }

	@Override
	public void render() {
		// TODO Auto-generated method stub
		
//        String vCode = drawGraphic(image);
//        vCode = encrypt(vCode);
//        Cookie cookie = new Cookie(randomCodeKey, vCode);
//        cookie.setMaxAge(-1);
//        cookie.setPath("/");
//        response.addCookie(cookie);
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
         
        ServletOutputStream sos = null;
        try {
        	BufferedImage image = ImageIO.read(new FileInputStream("/upload/"+path));
        	System.out.println(path);
            sos = response.getOutputStream();
            ImageIO.write(image, "jpeg",sos);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        finally {
            if (sos != null)
                try {sos.close();} catch (IOException e) {e.printStackTrace();}
        }
	} 
}