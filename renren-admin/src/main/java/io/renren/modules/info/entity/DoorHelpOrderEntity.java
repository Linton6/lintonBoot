package io.renren.modules.info.entity;

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
@TableName("door_help_order")
public class DoorHelpOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 帮助者姓名
	 */
	private String helper;
	/**
	 * 帮助理由
	 */
	private String reason;
	/**
	 * 联系方式
	 */
	private String contact;
	/**
	 * 帮助口令
	 */
	private String helpToken;
	/**
	 * 审核员
	 */
	private Long auditorId;
	/**
	 * 0：未审核  1：审核通过  2：审核拒绝
	 */
	private Integer status;
	/**
	 * 个推CID
	 */
	private String getuiCid;
	/**
	 * 
	 */
	private Date updatedAt;
	/**
	 * 
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


}
