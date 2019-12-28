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
@TableName("room_info")
public class RoomInfoEntity implements Serializable {
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
	 * 房间描述
	 */
	private String description;
	/**
	 * 房间的管理者的user_id
	 */
	private Long owner;
	/**
	 * 类别 lab, meeting, dining, activity
	 */
	private String tag;
	/**
	 * QGY: 前工院；DNY：东南院；ZDY：中大院
	 */
	private String building;
	/**
	 * 楼层号
	 */
	private String floor;
	/**
	 * 房间号
	 */
	private String room;
	/**
	 * 
	 */
	private String createdBy;
	/**
	 * 
	 */
	private Date createdAt;
	/**
	 * 
	 */
	private Date updatedAt;
	/**
	 * 
	 */
	private String lastModifiedBy;

	@TableField(exist = false)
	private String userName;

}
