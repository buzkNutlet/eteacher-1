package com.turing.eteacher.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.eteacher.base.BaseDAO;
import com.turing.eteacher.base.BaseService;
import com.turing.eteacher.dao.FileDAO;
import com.turing.eteacher.model.CustomFile;
import com.turing.eteacher.service.IDictionary2PrivateService;
import com.turing.eteacher.service.IFileService;

@Service
public class FileServiceImpl extends BaseService<CustomFile> implements IFileService {

	@Autowired
	private FileDAO fileDAO;
	
	@Autowired
	private IDictionary2PrivateService dictionary2PrivateServiceImpl;
	
	@Override
	public BaseDAO<CustomFile> getDAO() {
		return fileDAO;
	}
	

	@Override
	public List<Map> getFileList(String noteId,String url) {
		String sql = "SELECT tf.File_ID AS fileId, "+
					"tf.FILE_NAME AS fileName, "+
					"CONCAT( ? ,tf.SERVER_NAME) AS filePath, "+ 
					"tf.`DATA_ID` AS dataId, "+ 
					"tf.`IS_COURSE_FILE` AS isCourseFile, "+
					"tf.`VOCABULARY_ID` AS vocabularyId, "+
					"tf.`FILE_AUTH` AS fileAuth "+ 
					"FROM t_file tf "+ 
					"WHERE tf.DATA_ID = ?";
		return fileDAO.findBySql(sql, url, noteId);
	}

	@Override
	public void deletebyDataId(String noteId,String path) {
		String hql = "from CustomFile cf where cf.dataId = ?";
		List<CustomFile> list = fileDAO.find(hql, noteId);
		if (null != list) {
			for (int i = 0; i < list.size(); i++) {
				File file = new File(path +"/" + list.get(i).getServerName());
				if (file.exists()) {
					file.delete();
				}
				System.out.println("删除："+list.get(i).getFileId());
				fileDAO.delete(list.get(i));
			}
		}
	}
	
	@Override
	public List<Map> getListByCourse(String courseId, int page,String url) {
		String sql = "SELECT tf.File_ID AS fileId, "+
				"tf.DATA_ID AS dataId, "+
				"tf.FILE_NAME AS fileName, "+
				"CONCAT( ? ,tf.SERVER_NAME) AS filePath, "+ 
				"tf.VOCABULARY_ID AS vocabularyId "+
				"FROM t_file tf WHERE tf.IS_COURSE_FILE = 1 "+
				"AND tf.FILE_AUTH = '01' AND tf.DATA_ID = ? ";
		List<Map> list = fileDAO.findBySqlAndPage(sql, page*20, 20,url, courseId);
		if (null != list && list.size()> 0) {
			for (int i = 0; i < list.size(); i++) {
				String id = (String)list.get(i).get("vocabularyId");
				Map map = dictionary2PrivateServiceImpl.getValueById(id);
				if (null != map) {
					list.get(i).put("vocabulary", map.get("value"));
				}
			}
		}
		return list;
	}

	@Override
	public void deletebyFileId(String fileId, String path) {
		CustomFile cfile = fileDAO.get(fileId);
		if (null != cfile) {
				File file = new File(path +"/" + cfile.getServerName());
				if (file.exists()) {
					file.delete();
				}
				fileDAO.delete(cfile);
		}
		
	}

}
