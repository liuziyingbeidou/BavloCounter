package com.bavlo.counter.constant;

/**
 * @Title: 宝珑Counter
 * @ClassName: IConstant 
 * @Description: 常量
 * @author liuzy
 * @date 2015-10-20 下午04:56:51
 */
public interface IConstant {
	
	/*****************************View模块和ViewName***************************/
	/**实物签收单模块*/
	public static final String PATH_ENTITY = "entitysign/";
	public static final String ENTITY_SIGN_EDIT = "entity-sign-edit";
	public static final String ENTITY_SIGN_LIST = "entity-sign-list";
	
	/**宝石签收单模块*/
	public static final String PATH_GEM = "gemsign/";
	public static final String GEM_SIGN_EDIT = "gem-sign-edit";
	public static final String GEM_SIGN_LIST = "gem-sign-list";
	
	/** 客户模块 */
	public static final String PATH_CUSTOMER = "customer/";
	/** 配石单模块 */
	public static final String PATH_USE_GEM = "useGem/";
	
	/**订单模块*/
	public static final String PATH_ORDER = "order/";
	public static final String ORDER_EDIT = "order-edit";
	public static final String ORDER_LIST = "order-list";
	
	/*****************************界面类型**************************/
	//新增
	public static final String PAGE_TYPE_ADD = "新增";
	//编辑
	public static final String PAGE_TYPE_EDIT = "编辑";
	
	

	
	/***************************** 转发路径 ***************************/
	/** 转发 */
	public static final String REDIRECT = "redirect:/";


}
