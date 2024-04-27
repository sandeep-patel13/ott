package custometags;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import dto.Media;
import dto.MediaInfo;

public class GetBigBannerForIndexPage extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException {
		
		JspContext context = super.getJspContext();
		PageContext pageContext = (PageContext) context;
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		JspWriter out = context.getOut();
		
		String mediaId = (String)request.getAttribute("randomMediaId");
		Media media = (Media)request.getAttribute("media");
		MediaInfo mediaInfo = (MediaInfo)request.getAttribute("mediaInfo");
		
		String src = "media-List-Image?id="+mediaId;
		out.println("<img id = 'image' src='"+src+"' style='width: 100%;'/>");
		out.println("<div class='details'><h2>"+media.getName()+"</h2><p>"+media.getCategory()+"</p><p>"+mediaInfo.getDiscription()+"</p><p>"+mediaInfo.getRelease_date()+"</p><p>"+mediaInfo.getActors()+"</p></div>");
		out.println("<video id='video' style='display: none; width: 100%; overflow-x: hidden;' autoplay muted><source src='get-Video-Based-On-Id?id="+mediaId+"'></source></video>");
		
	}
	 
}
