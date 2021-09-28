package egovframework.example.cmmn.web.mapper;




import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {

	public List<Map<String, String>> selectallproduct();
	public List<HashMap<String, Object>> buyList(HashMap<String, Object> map);
}