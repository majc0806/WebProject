package per.tomato.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import per.tomato.crud.bean.Admin;
import per.tomato.crud.service.AdminService;

/**
 * 处理管理员的crud请求
 * 
 * @author tomato
 *
 */
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	/**
	 * 查询员工数据(分页查询) 方法名随意
	 * 
	 * @return
	 */
	@RequestMapping("/adminlogin")
	public String getEmps(Admin admin) {
		String adminID = admin.getAdminId();
		String adminPassword = admin.getAdminPassword();
		System.out.println(adminID + " " + adminPassword);
		boolean flag = adminService.checkAdmin(adminID, adminPassword);
		if (!flag) {
			return "error";
		}
		return "success";
	}

}
