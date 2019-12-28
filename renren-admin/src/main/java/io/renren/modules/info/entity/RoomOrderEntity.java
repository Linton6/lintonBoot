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
@TableName("room_order")
public class RoomOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 房间编号
	 */
	private String roomId;
	/**
	 * 预订的用户 id
	 */
	private Long userId;
	/**
	 * 预定者的姓名
	 */
	private String username;
	/**
	 * 预订原因
	 */
	private String theme;
	/**
	 * 0: 待审核 1: 审核通过 2：审核未过 3:已过期
	 */
	private Integer status;
	/**
	 * 审核员
	 */
	private Long auditorId;
	/**
	 * 审核者姓名
	 */
	private String auditorName;
	/**
	 * 预定开始时间
	 */
	private Date startTime;
	/**
	 * 预定结束时间 
	 */
	private Date endTime;
	/**
	 * 创建时间
	 */
	private Date createdAt;
	/**
	 * 更新时间
	 */
	private Date updatedAt;
	/**
	 * 
	 */
	private String createdBy;
	/**
	 * 
	 */
	private String lastModifiedBy;

	private  String tag;

}
