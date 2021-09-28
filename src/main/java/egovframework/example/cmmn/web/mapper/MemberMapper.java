package egovframework.example.cmmn.web.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Mapper
public interface MemberMapper {

    //@Select(value = "SELECT USER_ID from user where USER_ID=#{inputID}")
	public int UserIdCheck(String inputID);
    

	public void UserJoin(HashMap<String, Object> map);

	public int loginCheck(HashMap<String, Object> map);
	
	public HashMap<String, Object> userInfo(HashMap<String, Object> map); 
}