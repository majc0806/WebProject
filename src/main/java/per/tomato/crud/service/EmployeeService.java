package per.tomato.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import per.tomato.crud.bean.Admin;
import per.tomato.crud.bean.Employee;
import per.tomato.crud.bean.EmployeeExample;
import per.tomato.crud.bean.Msg;
import per.tomato.crud.bean.EmployeeExample.Criteria;
import per.tomato.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	/**
	 * 员工保存
	 * 
	 * @param employee
	 */
	public void saveEmp(Employee employee) {
		System.out.println("emp: " + employee.getEmpPassword());
		employeeMapper.insertSelective(employee);
	}

	/**
	 * 检验用户id是否可用
	 * 
	 * @param empId
	 * @return true:可用 false:不可用
	 */
	public boolean checkId(Integer empId) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdEqualTo(empId);
		long count = employeeMapper.countByExample(example);
		employeeMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 根据id查询员工
	 * 
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKeyWithDept(id);
		return employee;
	}

	/**
	 * 更新员工
	 * 
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 删除员工
	 * 
	 * @param id
	 */
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 批量删除员工
	 * 
	 * @param idsArr
	 */
	public void deleteBatchEmp(List<Integer> idList) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		// delete from tbl_emp where id in(...)
		criteria.andEmpIdIn(idList);
		employeeMapper.deleteByExample(example);
	}

	public boolean checkEmp(Integer empId, String empPassword) {
		if (empId == null || empPassword == null)
			return false;
		Employee emp = employeeMapper.selectByPrimaryKey(empId);
		if (emp == null)
			return false;
		return empPassword.equals(emp.getEmpPassword());
	}

}
