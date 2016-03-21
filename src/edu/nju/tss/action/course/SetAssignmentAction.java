package edu.nju.tss.action.course;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.Assignment;
import edu.nju.tss.service.CourseManageService;

@Controller
public class SetAssignmentAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -4624604814476150648L;
	@Autowired
	private CourseManageService courseService;
	private Assignment assignment;
	private String message;
	private String courseid;

	//注意，file并不是指前端jsp上传过来的文件本身，而是文件上传过来存放在临时文件夹下面的文件
	private File attach;
	//文件名称
	private String attachFileName;
	//文件类型
	private String attachContentType;

	public String setAssignment() throws IOException {
		String realpath = ServletActionContext.getServletContext().getRealPath("/uploadfile");
		if (attach != null) {
			File savefile = new File(new File(realpath), attachFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(attach, savefile);
		}

		courseid = request.getParameter("course.id");
		assignment.setCourseid(courseid);
		assignment.setFilePath(realpath + "\\");
		assignment.setFileName(attachFileName);
		courseService.setAssignment(assignment);
		message = "添加成功！";
		return SUCCESS;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public File getAttach() {
		return attach;
	}

	public void setAttach(File attach) {
		this.attach = attach;
	}

	public String getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(String attachFileName) {
		this.attachFileName = attachFileName;
	}

	public String getAttachContentType() {
		return attachContentType;
	}

	public void setAttachContentType(String attachContentType) {
		this.attachContentType = attachContentType;
	}

	public Assignment getAssignment() {
		return assignment;
	}

	public void setAssignment(Assignment assignment) {
		this.assignment = assignment;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
