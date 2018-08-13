package per.tomato.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import per.tomato.crud.bean.Department;
import per.tomato.crud.bean.DepartmentExample;
import per.tomato.crud.bean.Employee;
import per.tomato.crud.bean.DepartmentExample.Criteria;
import per.tomato.crud.dao.DepartmentMapper;

@Service
public class DepartMentService {

	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getDepts() {
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}

	/**
	 * 检查部门名是否重复
	 * 
	 * @param deptName
	 * @return
	 */
	public boolean checkDept(String deptName) {
		DepartmentExample example = new DepartmentExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptNameEqualTo(deptName);
		long count = departmentMapper.countByExample(example);
		departmentMapper.countByExample(example);
		return count == 0;
	}

	public void saveEmp(Department dept) {
		departmentMapper.insertSelective(dept);
	}

	public void updateEmp(Department department) {
		departmentMapper.updateByPrimaryKeySelective(department);
	}

	public Department getDept(Integer id) {
		Department department = departmentMapper.selectByPrimaryKey(id);
		return department;
	}

	public List<Department> getDept(String name) {
		DepartmentExample example = new DepartmentExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptNameEqualTo(name);
		List<Department> department = departmentMapper.selectByExample(example);
		return department;
	}

}
