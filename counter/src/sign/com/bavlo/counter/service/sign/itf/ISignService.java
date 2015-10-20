package com.bavlo.counter.service.sign.itf;

import java.util.List;

import com.bavlo.counter.model.sign.SignVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: ISignService 
 * @Description: 签收单Service接口
 * @author liuzy
 * @date 2015-10-19 下午03:38:28
 */
public interface ISignService {
	
	/**
	 * @Description: 签收单保存,返回主键
	 * @param @return
	 * @return Integer
	 */
	public Integer signSaveReID();
	
	/**
	 * @Description: 签收单保存
	 * @param @return
	 * @return Integer
	 */
	public void signSave(SignVO signVO);
	
	/**
	 * @Description: 更新
	 * @param 
	 * @return void
	 */
	public void signUpdate();
	
	/**
	 * @Description: 通过ID查找数据，返回VO
	 * @param @return
	 * @return SignVO
	 */
	public SignVO findSingleById();
	
	/**
	 * @Description: 通过条件查找
	 * @param @return
	 * @return List<SignVO>
	 */
	public List<SignVO> findListByWh();
	
	/**
	 * @Description: 查找全部
	 * @param @return
	 * @return List<SignVO>
	 */
	public List<SignVO> findList();
}
