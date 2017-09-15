package org.greenda.web.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyDao {
	@Autowired
	SqlSessionTemplate template;
	
	public int editDetail(Map map){
		int r=template.update("my.editDetail", map);
		return r;
	}
	
	public Map readOneDetail(String id){
		return template.selectOne("my.readOneDetail", id);
	}
}
