package org.greenda.web.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyDao {
	@Autowired
	SqlSessionTemplate template;
	// 개인 정보 일어옴
	public Map readOneDetail(String id){
		return template.selectOne("my.readOneDetail", id);
	}
	// 개인 정보 수정
	public int editDetail(Map map){
		int r=template.update("my.editDetail", map);
		return r;
	}
	
	// 프로필 사진 업로드
	public int uploadProfile(Map map){
		return template.insert("my.uploadProfile", map);
	}
	// 프로필 사진 가져오기
	public Map readRecentProfile(String id){
		return template.selectOne("my.readRecentProfile", id);
	}	
	// 개인 프로필 사진 모두 가져오기
	public List<Map> readAllProfile(String id){
		return template.selectList("my.readAllProfile", id);
	}
	
}
