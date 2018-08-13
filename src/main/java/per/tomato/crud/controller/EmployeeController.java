package per.tomato.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import per.tomato.crud.bean.Admin;
import per.tomato.crud.bean.Employee;
import per.tomato.crud.bean.Msg;
import per.tomato.crud.service.EmployeeService;

/**
 * 处理员工crud请求
 * 
 * @author tomato
 *
 */
@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	/**
	 * 删除单个或多个 单个:1 多个:1-2-3
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("ids") String ids) {
		if (ids.contains("-")) {
			// 多个删除
			List<Integer> idList = new ArrayList<>();
			String[] idArr = ids.split("-");
			for (String id : idArr) {
				idList.add(Integer.valueOf(id));
			}
			employeeService.deleteBatchEmp(idList);
		} else {
			// 单个删除
			Integer id = Integer.valueOf(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}

	/**
	 * 更新员工方法
	 * 
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		System.out.println("调用controller 员工id:" + employee.getEmpId());
		System.out.println("name" + employee.getEmpName());
		System.out.println("email" + employee.getEmail());
		employeeService.updateEmp(employee);
		return Msg.success();
	}

	/**
	 * 根据id查询员工
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}

	/**
	 * 检查用户名是否可用
	 * 
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkUser(@RequestParam("empName") String empName) {
		// 先判断用户名是否是合法的表达式
		String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
		if (!empName.matches(regex)) {
			return Msg.fail().add("va_msg",
					"(后端消息)用户名为2-5位中文或6-16位英文和数字组合,包括-_");
		}
		return Msg.success();
	}

	/**
	 * 检查id是否重复
	 * 
	 * @param empId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkid")
	public Msg checkId(@RequestParam("empId") String empId) {
		// 先判断用户名是否是合法的表达式
		System.out.println("处理消息");
		String regex = "^[0-9]{1,10}$";
		if (!empId.matches(regex)) {
			return Msg.fail().add("va_msg", "(后端消息)用户编号为1-10位数字");
		}

		boolean b = employeeService.checkId(Integer.valueOf(empId));
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "员工编号已存在");
		}
	}

	/**
	 * 员工保存 1.支持JSR303校验 2.导入Hibernate-Validator
	 * 
	 * @return
	 */
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			// 返回失败,在模态框中显示错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名: " + fieldError.getField());
				System.out.println("错误信息: " + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			employee.setEmpPassword(employee.getEmail());
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}

	/**
	 * 导入Jackson包
	 * 
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 引入PageHelper分页插件
		// 在查询之前只需要调用,传入页码以及分页的大小
		PageHelper.startPage(pn, 5);
		// startPage紧跟的查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		// 使用pageinfo包装查询后的结果,只需要将pageinfo交给页面就行了
		// 封装了详细的分页信息,包括查询出来的数据
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 查询员工数据(分页查询) 方法名随意
	 * 
	 * @return
	 */
	@RequestMapping("/emplogin")
	public String getEmpss(Employee emp) {
		Integer id = emp.getEmpId();
		String password = emp.getEmpPassword();
		System.out.println(id + "   " + password);
		boolean flag = employeeService.checkEmp(id, password);
		if (!flag) {
			return "emperror";
		}
		return "empsuccess";
	}

	/**
	 * 查询员工数据(分页查询) 方法名随意
	 * 
	 * @return
	 */
	// @RequestMapping("/emps")
	// public String getEmps(
	// @RequestParam(value = "pn", defaultValue = "1") Integer pn,
	// Model model) {
	// // 引入PageHelper分页插件
	// // 在查询之前只需要调用,传入页码以及分页的大小
	// PageHelper.startPage(pn, 5);
	// // startPage紧跟的查询就是一个分页查询
	// List<Employee> emps = employeeService.getAll();
	// // 使用pageinfo包装查询后的结果,只需要将pageinfo交给页面就行了
	// // 封装了详细的分页信息,包括查询出来的数据
	// PageInfo page = new PageInfo(emps, 5);
	// model.addAttribute("pageInfo", page);
	// System.out.println("转向list");
	// return "list";
	// }
}
