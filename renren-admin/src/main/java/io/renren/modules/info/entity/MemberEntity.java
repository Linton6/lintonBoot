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
@TableName("member")
public class MemberEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 姓名
	 */
	private String username;
	/**
	 * 学号
	 */
	private String stuid;
	/**
	 * 注册状态 1:已激活 0:未激活
	 */
	private Integer status;
	/**
	 * 手机号
	 */
	private String telephone;
	/**
	 * 密码hash值
	 */
	private String password;
	/**
	 * 个推 cid
	 */
	private String cid;
	/**
	 * help_token
	 */
	private String helpToken;
	/**
	 * 
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date lastLoginTime;

//	0：超级管理员； 1：维护员； 2：普通用户
	private Integer rank;

}
