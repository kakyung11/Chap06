package org.greenda.web.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	SqlSessionTemplate template;
	
	public int addOne(Map map){
		int r=0;
		r += template.insert("member.addMember",map);
		r += template.insert("member.addDetail",map);
		return r;
	}
	
	public boolean checkId(String id){
		String result = template.selectOne("member.checkId",id); 
		return id.equals(result);
	}
	public boolean checkEmail(String email){
		String result = template.selectOne("member.checkEmail",email); 
		return email.equals(result);
	}
	
	public Map logIn(Map map){
		return template.selectOne("member.login",map);	

	}
	
	public List<Map> readAllMemberInfo(){
		return template.selectList("member.readAllMemberInfo");
	}
	
	public List<Map> readMemberPaging(Map map){
		return template.selectList("member.readMemberPaging",map);
	}
	public int memberCount(){
		return template.selectOne("member.memberCount");
	}


}
