package com.turing.eteacher.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.turing.eteacher.base.BaseDAO;
import com.turing.eteacher.model.Term;

@Repository
public class TermDAO extends BaseDAO<Term> {
	//获取学期列表（学期id，学期名，学期开始时间，学期结束时间）
	public List<Term> getListTerms(String hql){
		return this.find(hql);
//		Query query = getSession().createQuery(hql);
//		return query.list();
	}
	
}
