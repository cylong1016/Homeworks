package edu.nju.tss.action.course;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.StudentAssignment;
import edu.nju.tss.service.CourseManageService;

@Controller
public class UploadMyAssignmentAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -6783636122309984277L;
	@Autowired
	private CourseManageService courseService;
	private File myAssignment;			//文件
	private String myAssignmentFileName;  //文件名 
	private String myAssignmentContentType;	//文件类型
	private String message;
	private StudentAssignment sa = new StudentAssignment();

	public String uploadMyAssignment() throws IOException {
		String assignmentid = request.getParameter("assignmentid");
		String studentid = request.getParameter("studentid");
		String courseid = request.getParameter("courseid");
		String realpath = ServletActionContext.getServletContext().getRealPath("/uploadfile/assignment");
		String[] strArr = myAssignmentFileName.split("\\.");
		String fileName = studentid + "." + strArr[strArr.length - 1];
		if (myAssignment != null) {
			File savefile = new File(new File(realpath), assignmentid + "_" + fileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(myAssignment, savefile);
		}
		sa.setFileName(fileName);
		sa.setAssignmentid(assignmentid);
		sa.setStudentid(studentid);
		sa.setCourseid(courseid);
		StudentAssignment saTemp = courseService.findStudentAssignment(studentid, assignmentid);
		if(saTemp == null) {	// 防止重复添加数据
			courseService.addStudentAssignment(sa);
		} else {
			sa.setId(saTemp.getId());
			courseService.updateStudentAssignment(sa);
		}
		message = "{'message': '上传成功！'}";
		return SUCCESS;
	}

	public String getMyAssignmentContentType() {
		return myAssignmentContentType;
	}

	public void setMyAssignmentContentType(String myAssignmentContentType) {
		this.myAssignmentContentType = myAssignmentContentType;
	}

	public StudentAssignment getSa() {
		return sa;
	}

	public void setSa(StudentAssignment sa) {
		this.sa = sa;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public File getMyAssignment() {
		return myAssignment;
	}

	public void setMyAssignment(File myAssignment) {
		this.myAssignment = myAssignment;
	}

	public String getMyAssignmentFileName() {
		return myAssignmentFileName;
	}

	public void setMyAssignmentFileName(String myAssignmentFileName) {
		this.myAssignmentFileName = myAssignmentFileName;
	}

}
