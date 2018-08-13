package per.tomato.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import per.tomato.crud.bean.Admin;
import per.tomato.crud.dao.AdminMapper;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;

	public boolean checkAdmin(String adminId, String adminPassword) {
		if (adminId.length() == 0 || adminPassword.length() == 0)
			return false;
		Admin admin = adminMapper.selectByPrimaryKey(adminId);
		if (admin == null)
			return false;
		return adminPassword.equals(admin.getAdminPassword());
	}

}
