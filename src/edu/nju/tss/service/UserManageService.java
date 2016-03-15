package edu.nju.tss.service;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.tss.model.Admin;
import edu.nju.tss.model.User;

public interface UserManageService {

	public Admin validateAdmin(String userid, String password);

	public User validateUser(String userid, String password);

	public Integer validateNumber(String number);

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String registerUser(User user);

}
