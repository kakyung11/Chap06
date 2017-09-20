package org.greenda.web.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDao {
	@Autowired
	SqlSessionTemplate template;
	
	public int addMemo(Map map){
		return template.insert("memo.addMemo", map);
	}
	public List<Map> readAllMemo(String id){
		return template.selectList("memo.readAllMemo", id);
	}
	public int removeMemo(Map map){
		return template.delete("memo.removeMemo",map);
	}

}
