package per.tomato.crud.bean;

import javax.validation.constraints.Pattern;

public class Department {
	private Integer deptId;
	@Pattern(regexp = "^[\u2E80-\u9FFF]{1,20}$", message = "(Department类)部门名为1-20位中文字符组成")
	private String deptName;

	public Department(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public Department() {
		super();
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName == null ? null : deptName.trim();
	}
}