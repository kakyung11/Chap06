package org.greenda.web.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyDao {
	@Autowired
	SqlSessionTemplate template;
	// ���� ���� �Ͼ��
	public Map readOneDetail(String id){
		return template.selectOne("my.readOneDetail", id);
	}
	// ���� ���� ����
	public int editDetail(Map map){
		int r=template.update("my.editDetail", map);
		return r;
	}
	
	// ������ ���� ���ε�
	public int uploadProfile(Map map){
		return template.insert("my.uploadProfile", map);
	}
	// ������ ���� ��������
	public Map readRecentProfile(String id){
		return template.selectOne("my.readRecentProfile", id);
	}	
	// ���� ������ ���� ��� ��������
	public List<Map> readAllProfile(String id){
		return template.selectList("my.readAllProfile", id);
	}
	
}
