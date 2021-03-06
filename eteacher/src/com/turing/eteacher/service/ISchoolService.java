package com.turing.eteacher.service;

import java.util.List;
import java.util.Map;

import com.turing.eteacher.base.IService;
import com.turing.eteacher.model.School;

public interface ISchoolService extends IService<School>  {
	/**
	 * 根据type获取其下属项信息。用于：学校的省、市级联查询。
	 * @param parentId
	 * @return
	 */
	public List<Map> getListByParentType(int type , String id);
	/**
	 * 根据学校ID，获取学校所在的省份、市的信息。用于：用户信息展示
	 * @author macong
	 * @param Id
	 * @return
	 */
	public List<Map> getSchoolInfoById(String Id);
	/**
	 * 根据用户ID，获取学校信息
	 * @author macong
	 * @param userId
	 * @return
	 */
	public Map getSchoolByUserId(String userId);
	
	/**
	 * 根据学校Id获取对应的教学楼
	 * @author lifei
	 * @param schoolId
	 * @return
	 */
	public List<Map> getClassroomBySchooId(String schoolId);
	
}
