package per.tomato.crud.controller;

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
import per.tomato.crud.bean.Department;
import per.tomato.crud.bean.Employee;
import per.tomato.crud.bean.Msg;
import per.tomato.crud.service.DepartMentService;

/**
 * 处理和部门有关的请求
 * 
 * @author tomato
 *
 */
@Controller
public class DepartmentController {

	@Autowired
	private DepartMentService departMentService;

	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		List<Department> list = departMentService.getDepts();
		return Msg.success().add("depts", list);
	}

	/**
	 * 导入Jackson包
	 * 
	 * @param pn
	 * @return
	 */
	@RequestMapping("/deptsinfo")
	@ResponseBody
	public Msg getDeptsWithJson(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 引入PageHelper分页插件
		// 在查询之前只需要调用,传入页码以及分页的大小
		PageHelper.startPage(pn, 5);
		// startPage紧跟的查询就是一个分页查询
		List<Department> depts = departMentService.getDepts();
		System.out.println(depts);
		// 使用pageinfo包装查询后的结果,只需要将pageinfo交给页面就行了
		// 封装了详细的分页信息,包括查询出来的数据
		PageInfo page = new PageInfo(depts, 5);
		System.out.println("调用" + this.getClass().getName());
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 检查用户名是否可用
	 * 
	 * @param deptName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkdept")
	public Msg checkUser(@RequestParam("deptName") String deptName) {
		System.out.println("校验数据");
		// 先判断用户名是否是合法的表达式
		String regex = "^[\\u2E80-\\u9FFF]{1,20}$";
		if (!deptName.matches(regex)) {
			return Msg.fail().add("va_msg", "(后端消息)部门名为1-20位中文字符");
		}

		// 数据库部门名重复校验
		boolean b = departMentService.checkDept(deptName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "(后端消息)部门名已存在");
		}
	}

	/**
	 * 部门保存 1.支持JSR303校验 2.导入Hibernate-Validator
	 * 
	 * @return
	 */
	@RequestMapping(value = "/dept", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Department dept, BindingResult result) {
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
			departMentService.saveEmp(dept);
			return Msg.success();
		}
	}

	/**
	 * 更新部门方法
	 * 
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/dept/{deptId}", method = RequestMethod.PUT)
	public Msg saveEmp(Department department) {
		System.out.println("调用controller 部门id:" + department.getDeptId());
		departMentService.updateEmp(department);
		return Msg.success();
	}

	// /**
	// * 根据id查询部门
	// *
	// * @param id
	// * @return
	// */
	// @RequestMapping(value = "/dept/{id}", method = RequestMethod.GET)
	// @ResponseBody
	// public Msg getEmp(@PathVariable("id") Integer id) {
	// System.out.println(id);
	// Department department = departMentService.getDept(id);
	// return Msg.success().add("dept", department);
	// }

	/**
	 * 根据名称查询部门
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/dept/{name}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("name") String name) {
		System.out.println(name + "hahaah");
		if (name.matches("[0-9]{1,10}")) {
			return Msg.success().add("dept",
					departMentService.getDept(Integer.valueOf(name)));
		} else {
			List<Department> list = departMentService.getDept(name);
			if (list.size() != 0)
				return Msg.success().add("dept", list.get(0));
			return Msg.success().add("dept", null);
		}
	}

}
