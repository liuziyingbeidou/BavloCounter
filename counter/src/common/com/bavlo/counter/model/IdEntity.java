package com.bavlo.counter.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.bavlo.counter.utils.ReflectionUtils;

@MappedSuperclass
@SuppressWarnings({"serial"})
public class IdEntity implements Serializable{
	
	public static final String tablePrefix = "";
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer id;
	
    // 时间戳
    private Date dr;
    // 其他1
    private String vdef1;
    // 其他2
    private String vdef2;
    // 其他3
    private String vdef3;
    // 其他4
    private String vdef4;
    // 其他5
    private String vdef5;
    // 其他6
    private Long vdef6;
    // 其他7
    private Long vdef7;
    // 其他8
    private Long vdef8;
    // 其他9
    private Long vdef9;
    // 其他10
    private Long vdef10;
    // 预留1
    private String vreserve1;
    // 预留2
    private String vreserve2;
    // 预留3
    private String vreserve3;
    // 预留4
    private String vreserve4;
    // 预留5
    private String vreserve5;
    // 备注
    private String vmemo;

	public Integer getId() {
	
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Transient boolean selected = false;
	@Transient Object userValue;
	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	
	//刘忠庆
	@Transient	
	private Map<Object, Object> condmap;
 	
 	public void setAttribute(Object key,Object value){
		if(condmap==null)condmap=new HashMap<Object,Object>();
		condmap.put(key, value);
	}
	
    public Object getAttribute(Object key){
    	if(condmap==null)condmap=new HashMap<Object,Object>();
    	return condmap.get(key);
    }
    
    /**
	 * @return the condmap
	 */
	public Map<Object, Object> getCondmap() {
		return condmap;
	}
	/**
	 * @param condmap the condmap to set
	 */
	public void setCondmap(Map<Object, Object> condmap) {
		this.condmap = condmap;
	}
	
	
	public boolean equals(Object object) {
		if (null == object)
			return false;
		if (!(object.getClass().getName().toString().equals(this.getClass().getName().toString())))
			return false;
		else {
			Integer object_id = (Integer) ReflectionUtils.getFieldValue(object,
					"id");
			if (null == this.getId() || null == object_id)
				return false;
			else
				return (this.getId().intValue() == object_id.intValue());
		}
	}
	@Transient
	public int hashCode = Integer.MIN_VALUE;

	public int hashCode() {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId())
				return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":"
						+ this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}

	public String toString() {
		return super.toString();
	}

	public Object getUserValue() {
		return userValue;
	}

	public void setUserValue(Object userValue) {
		this.userValue = userValue;
	}
	
	
	public Date getDr() {
		return dr;
	}

	public void setDr(Date dr) {
		this.dr = dr;
	}

	public String getVdef1() {
		return vdef1;
	}

	public void setVdef1(String vdef1) {
		this.vdef1 = vdef1;
	}

	public String getVdef2() {
		return vdef2;
	}

	public void setVdef2(String vdef2) {
		this.vdef2 = vdef2;
	}

	public String getVdef3() {
		return vdef3;
	}

	public void setVdef3(String vdef3) {
		this.vdef3 = vdef3;
	}

	public String getVdef4() {
		return vdef4;
	}

	public void setVdef4(String vdef4) {
		this.vdef4 = vdef4;
	}

	public String getVdef5() {
		return vdef5;
	}

	public void setVdef5(String vdef5) {
		this.vdef5 = vdef5;
	}

	public Long getVdef6() {
		return vdef6;
	}

	public void setVdef6(Long vdef6) {
		this.vdef6 = vdef6;
	}

	public Long getVdef7() {
		return vdef7;
	}

	public void setVdef7(Long vdef7) {
		this.vdef7 = vdef7;
	}

	public Long getVdef8() {
		return vdef8;
	}

	public void setVdef8(Long vdef8) {
		this.vdef8 = vdef8;
	}

	public Long getVdef9() {
		return vdef9;
	}

	public void setVdef9(Long vdef9) {
		this.vdef9 = vdef9;
	}

	public Long getVdef10() {
		return vdef10;
	}

	public void setVdef10(Long vdef10) {
		this.vdef10 = vdef10;
	}

	public String getVreserve1() {
		return vreserve1;
	}

	public void setVreserve1(String vreserve1) {
		this.vreserve1 = vreserve1;
	}

	public String getVreserve2() {
		return vreserve2;
	}

	public void setVreserve2(String vreserve2) {
		this.vreserve2 = vreserve2;
	}

	public String getVreserve3() {
		return vreserve3;
	}

	public void setVreserve3(String vreserve3) {
		this.vreserve3 = vreserve3;
	}

	public String getVreserve4() {
		return vreserve4;
	}

	public void setVreserve4(String vreserve4) {
		this.vreserve4 = vreserve4;
	}

	public String getVreserve5() {
		return vreserve5;
	}

	public void setVreserve5(String vreserve5) {
		this.vreserve5 = vreserve5;
	}
	
	public String getVmemo() {
		return vmemo;
	}
	
	public void setVmemo(String vmemo) {
		this.vmemo = vmemo;
	}
	
}
