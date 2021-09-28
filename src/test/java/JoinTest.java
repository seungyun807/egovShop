import java.util.HashMap;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import egovframework.example.cmmn.web.controller.LoginController;
import egovframework.example.cmmn.web.mapper.MemberMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/config/egovframework/springmvc/dispatcher-servlet.xml", "file:src/main/resources/egovframework/spring/*.xml"} )
@WebAppConfiguration
public class JoinTest{
	
	@Autowired
	MemberMapper membermapper;
	
	  
	@Test
	public void jointest() {
		
		  HashMap<String, Object> map = new HashMap<>();
			
			map.put("user_id", "test9");
			map.put("pssword", "test");
			map.put("name", "이름");
			map.put("e_mail", "web@web.com");
			map.put("phone_num", "010");
			map.put("zip", "1234");
			map.put("adres", "dre");
			map.put("detail_adres", "de");
			map.put("user_cs", "123");
			map.put("user_regist_date", "2021-09-16");
			
			membermapper.UserJoin(map);
			//System.out.println(result);
		
	}
}