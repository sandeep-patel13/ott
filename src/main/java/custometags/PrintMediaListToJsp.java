package custometags;

import java.util.List;
import dto.Media;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import java.io.IOException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PrintMediaListToJsp extends SimpleTagSupport {

	private List<Media> list;

	public void setList(List<Media> list) {
		this.list = list;
	}

	@Override
	public void doTag() throws JspException, IOException {

		JspContext jc = super.getJspContext();
		JspWriter out = jc.getOut();

		
		out.println("<ul class='list-group rounded'>");
		 
			 for(Media media : list) {
			 
				 String id = media.getMedia_id();
				 
				 String servletSrc = "media-List-Image?id="+id;
				 
				 out.println("<img class='rounded' width='500px' src='"+servletSrc+"'/>");
				 out.println("<p class='fontOne text-light'>"+media.
				 getName()+"</p>");
				 out.println("<p class='fontOne text-light'>"+media.
				 getCategory()+"</p>");
				 String servletSec1 = "get-all-info-media?id="+media.getMedia_id();
				 out.println("<p class='mb-5 fontOne rounded-bottom text-light'><a href='"+servletSec1+"' class='btn btn-outline-light btn-sm' style='width: 100%;'>More Details</a></p>");
		 
		 
		 }
		 
		 out.println("</ul>");
		 

		
	}

}















