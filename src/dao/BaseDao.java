package dao;

import java.util.List;

public interface BaseDao {
	/**
	 * insert��update��delet��Ӧ��add��update��delete����ֵ��-2����ʧ�ܣ�-3������ִ���>=0������Ӱ��ļ�¼����
	 */
	public static final int DAO_SUCCEED = 1;
	public static final int DAO_FAILED = -2;
	public static final int DAO_OCCURRED_ERROR = -3;

	public int add(Object obj) ;
	
	public int update(Object obj);
	
	public int delete(Object key);
	
	public List<Object> getBy (String where);
	
	public List<Object> getAll();
	
	public boolean exits(Object key);
	
	public long getCount(String where);
}
