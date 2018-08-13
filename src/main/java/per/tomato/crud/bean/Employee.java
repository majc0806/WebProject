package per.tomato.crud.bean;

import javax.validation.constraints.Pattern;

public class Employee {
	private Integer empId;

	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)", message = "(Employee类)用户名为2-5位中文或6-16位英文和数字组合,包括-_")
	private String empName;

	private String gender;

	@Pattern(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", message = "(Employee类)邮箱格式不正确")
	private String email;

	private Integer dId;

	private String empPassword;

	// 希望查询员工的同时,部门的信息也是查询好的
	private Department department;

	public Employee() {
		super();
	}

	public Employee(Integer empId, String empName, String gender, String email,
			Integer dId, String empPassword) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
		this.empPassword = empPassword;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName == null ? null : empName.trim();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Integer getdId() {
		return dId;
	}

	public void setdId(Integer dId) {
		this.dId = dId;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword == null ? null : empPassword.trim();
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
}