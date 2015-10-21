package com.bavlo.counter.service.sign.itf;

import com.bavlo.counter.model.sign.EntitySignVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: ISignService 
 * @Description: 实物签收单Service接口
 * @author liuzy
 * @date 2015-10-19 下午03:38:28
 */
public interface IEntitySignService {
	
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
	public void signSave(EntitySignVO entitySignVO);
	
}
