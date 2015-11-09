package com.bavlo.counter.constant;

/**
 * @Title: ����Counter
 * @ClassName: IConstant 
 * @Description: ����
 * @author liuzy
 * @date 2015-10-20 ����04:56:51
 */
public interface IConstant {
	
	public static final String YES = "Y";
	public static final String NO = "N";
	
	/**
	 * ����״̬ 
	 * �ύ(0)���ư�(1)������(2)���ʼ�(3)�����(4)��֧��(5)
	 * commit (0), Plate (1), Production (2), quality (3), express (4), payment (5)
	 */
	public static final Integer ORDER_COMMIT = 0;
	public static final Integer ORDER_PLATE = 1;
	public static final Integer ORDER_PRODUCTION = 2;
	public static final Integer ORDER_QUALITY = 3;
	public static final Integer ORDER_EXPRESS = 4;
	public static final Integer ORDER_PAYMENT = 5;
	/**
	 * ����ǰ׺
	 */
	//��ʯǩ�յ�
	public static final String CODE_GEMSIGN = "GS";
	//ʵ��ǩ�յ�
	public static final String CODE_ENTITYSIGN = "ES";
	//����
	public static final String CODE_ORDER = "OD";
	/*****************************Viewģ���ViewName***************************/
	public static final String PATH_COMMON = "common/";
	public static final String COMMON_UPLOAD = "upload";
	public static final String COMMON_SHOWPIC = "showpic";
	public static final String COMMON_CHAIN = "chain";
	public static final String COMMON_GEM = "gem";
	/**ʵ��ǩ�յ�ģ��*/
	public static final String PATH_ENTITY = "entitysign/";
	public static final String ENTITY_SIGN_EDIT = "entity-sign-edit";
	public static final String ENTITY_SIGN_LIST = "entity-sign-list";
	
	/**��ʯǩ�յ�ģ��*/
	public static final String PATH_GEM = "gemsign/";
	public static final String GEM_SIGN_EDIT = "gem-sign-edit";
	public static final String GEM_SIGN_LIST = "gem-sign-list";
	
	/** �ͻ�ģ�� */
	public static final String PATH_CUSTOMER = "customer/";
	/** ��ʯ��ģ�� */
	public static final String PATH_USE_GEM = "useGem/";
	/** ���Ƶ�ģ��*/
	public static final String PATH_CUSTOM = "custom/";
	
	/**����ģ��*/
	public static final String PATH_ORDER = "order/";
	public static final String ORDER_EDIT = "order-edit";
	public static final String ORDER_LIST = "order-list";
	
	/*****************************��������**************************/
	//����
	public static final String PAGE_TYPE_ADD = "����";
	//�༭
	public static final String PAGE_TYPE_EDIT = "�༭";
	
	

	
	/***************************** ת��·�� ***************************/
	/** ת�� */
	public static final String REDIRECT = "redirect:/";

	
	/*************************�ļ��ϴ�����***************************/
	public static final String FILE_DIR = "staticRes";//Ĭ��
	public static final String FILE_MODEL = "/temp";//��ʱģ��
	public static final String RES_TYPE_PIC = "pic";//ͼƬ
	public static final String RES_TYPE_FILE = "file";//��ͨ�ļ�
//	public static final String FILE_DIR_ORDER = "order";//����
//	public static final String FILE_DIR_CUSTOM = "custom";//���Ƶ�
//	public static final String FILE_DIR_ENTSIGN = "entsign";//ʵ��ǩ�յ�
//	public static final String FILE_DIR_GEMSIGN = "gemsign";//��ʯǩ�յ�
//	public static final String FILE_DIR_CUSTOMER = "customer";//�ͻ�
}
