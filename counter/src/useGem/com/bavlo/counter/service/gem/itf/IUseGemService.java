package com.bavlo.counter.service.gem.itf;

import java.util.List;

import com.bavlo.counter.model.gem.UseGemVO;

/** 
 * @Title: 宝珑Counter
 * @ClassName: IUseGemService 
 * @Description: 配石单接口 
 * @author shijf
 * @date 2015-10-24 下午06:13:06  
 */
public interface IUseGemService {

	/**
	 * @Description: 保存配石单
	 * @param
	 * @return void
	 */
	public void saveUseGem(UseGemVO useGemVO);

	/**
	 * @Description: 删除配石单
	 * @param
	 * @return void
	 */
	public void deleteUseGem(UseGemVO useGemVO);

	/**
	 * @Description: 更新配石单
	 * @param
	 * @return void
	 */
	public void updateUseGem(UseGemVO useGemVO);
	
	/**
	 * @Description: 更新配石单
	 * @param
	 * @return void
	 */
	public void saveOrUpdateUseGem(UseGemVO useGemVO);

	/**
	 * @Description: 通过ID查找配石单
	 * @param @return
	 * @return UseGemVO
	 */
	public UseGemVO findUseGemById(Integer id);

	/**
	 * @Description: 通过条件查找配石单
	 * @param @return
	 * @return List<UseGemVO>
	 */
	public List<UseGemVO> findUseGemByWh();

	/**
	 * @Description: 查找配石单列表
	 * @param @return
	 * @return List<UseGemVO>
	 */
	public List<UseGemVO> findUseGemList();
	
}
