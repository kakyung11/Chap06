package org.greenda.web.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketDao {
	@Autowired
	SqlSessionTemplate template;
	
	public int addOne(Map map){
		return template.insert("market.addOne",map);
	}
	public List<Map> readAll(){
		return template.selectList("market.readAll");
	}
	public Map readOne(String num){
		return template.selectOne("market.readOne",num);
	}
	public List<Map> search(Map map){
		return template.selectList("market.search",map);
	}
}
