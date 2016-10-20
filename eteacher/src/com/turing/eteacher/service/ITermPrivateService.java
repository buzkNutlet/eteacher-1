package com.turing.eteacher.service;

import java.util.List;
import java.util.Map;

import com.turing.eteacher.base.IService;
import com.turing.eteacher.model.Term;
import com.turing.eteacher.model.TermPrivate;

public interface ITermPrivateService  extends IService<TermPrivate>{
	public List<TermPrivate> getListTermPrivatesName(String userId);
	
	public void addTermPrivate(String termId, String tpId);
	
	public void deleteById(String tpId);
	
	public void saveTermPrivate(TermPrivate termPrivate);

	public Map getListTerm(String tpId);

}
