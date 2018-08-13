package per.tomato.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import per.tomato.crud.bean.Employee;
import per.tomato.crud.dao.DepartmentMapper;
import per.tomato.crud.dao.EmployeeMapper;

/**
 * 测试dao层的工作 推荐Spring的项目就可以使用Spring的单元测试,可以自动注入我们需要的组件 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置 3.直接autowired要使用的组件即可
 *
 * @author: tomato
 * @date: 2018/5/12
 * @time: 18:40
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession sqlSession;

	public MapperTest() {
	}

	/**
	 * 测试Department
	 */
	@Test
	public void testCRUD() {
		/*
		 * //1.创建SpringIOC容器 ApplicationContext ioc = new
		 * ClassPathXmlApplicationContext ("applicationContext.xml");
		 * //2.从容器中获取mapper DepartmentMapper bean =
		 * ioc.getBean(DepartmentMapper.class);
		 */
		System.out.println(departmentMapper);

		// 1.在数据库的tbl_dept中插入几个部门
		// departmentMapper.insertSelective(new Department(null, "测试部"));
		// departmentMapper.insertSelective(new Department(null, "测试部"));

		// 2.生成员工的数据
		// employeeMapper.insertSelective(
		// new Employee(null, "Jerry", "M", "Jerry@gmail.com", 1));
		// 3.批量插入多个员工,使用可以使用批量操作的SQLSession
		// EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		// for (int i = 0; i < 1000; i++) {
		// String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
		// mapper.insertSelective(
		// new Employee(null, uuid, "M", uuid + "@gmail.com", 1));
		// }
		System.out.println("done");
	}
}
