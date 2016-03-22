package edu.nju.tss.action.course;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;

@Controller
public class FileDownloadAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -2977376776370857540L;

	private String file;
	private String fileName;

	public String download() {
		return SUCCESS;
	}

	//返回一个输入流，作为一个客户端来说是一个输入流，但对于服务器端是一个 输出流  
	public InputStream getDownloadFile() throws Exception {
		//获取资源路径  
		return ServletActionContext.getServletContext().getResourceAsStream(file);
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
