package com.bavlo.counter.constant;

/**
 * @Title: 宝珑Counter
 * @ClassName: IConstant 
 * @Description: 常量
 * @author liuzy
 * @date 2015-10-20 下午04:56:51
 */
public interface IConstant {
	
	public static final String YES = "Y";
	public static final String NO = "N";
	
	/**
	 * 订单状态 
	 * 提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
	 * commit (0), Plate (1), Production (2), quality (3), express (4), payment (5)
	 */
	public static final Integer ORDER_COMMIT = 0;
	public static final Integer ORDER_PLATE = 1;
	public static final Integer ORDER_PRODUCTION = 2;
	public static final Integer ORDER_QUALITY = 3;
	public static final Integer ORDER_EXPRESS = 4;
	public static final Integer ORDER_PAYMENT = 5;
	/**
	 * 编码前缀
	 */
	//宝石签收单
	public static final String CODE_GEMSIGN = "GS";
	//实物签收单
	public static final String CODE_ENTITYSIGN = "ES";
	//订单
	public static final String CODE_ORDER = "OD";
	/*****************************View模块和ViewName***************************/
	public static final String PATH_COMMON = "common/";
	public static final String COMMON_UPLOAD = "upload";
	public static final String COMMON_SHOWPIC = "showpic";
	public static final String COMMON_CHAIN = "chain";
	public static final String COMMON_GEM = "gem";
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
	/** 定制单模块*/
	public static final String PATH_CUSTOM = "custom/";
	
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

	
	/*************************文件上传常量***************************/
	public static final String FILE_DIR = "staticRes";//默认
	public static final String FILE_MODEL = "/temp";//临时模块
	public static final String RES_TYPE_PIC = "pic";//图片
	public static final String RES_TYPE_FILE = "file";//普通文件
//	public static final String FILE_DIR_ORDER = "order";//订单
//	public static final String FILE_DIR_CUSTOM = "custom";//定制单
//	public static final String FILE_DIR_ENTSIGN = "entsign";//实物签收单
//	public static final String FILE_DIR_GEMSIGN = "gemsign";//宝石签收单
//	public static final String FILE_DIR_CUSTOMER = "customer";//客户
}
