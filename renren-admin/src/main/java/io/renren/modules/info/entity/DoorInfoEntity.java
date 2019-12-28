package io.renren.modules.info.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
@Data
@TableName("door_info")
public class DoorInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 
	 */
	private String roomId;
	/**
	 * 门编号
	 */
	private String doorId;
	/**
	 * 蓝牙MAC地址
	 */
	private String bltMac;
	/**
	 * 管理员id
	 */
	private Long ownerId;
	/**
	 * 上次密码
	 */
	private String prePwd;
	/**
	 * 下次密码
	 */
	private String nextPwd;
	/**
	 * 门的描述
	 */
	private String description;
	/**
	 * 更新时间
	 */
	private Date updatedAt;
	/**
	 * 创建时间
	 */
	private Date createdAt;
	/**
	 * 
	 */
	private String createdBy;
	/**
	 * 
	 */
	private String lastModifiedBy;

	private  String qrCode;

	@TableField(exist = false)
	private String userName;

}
