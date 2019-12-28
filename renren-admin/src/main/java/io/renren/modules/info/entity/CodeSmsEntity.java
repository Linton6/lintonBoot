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
@TableName("code_sms")
public class CodeSmsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	@TableId
	private Long id;
	/**
	 * 操作签名
	 */
	private String actionSign;
	/**
	 * 手机号
	 */
	private String mobile;
	/**
	 * 验证码
	 */
	private String code;
	/**
	 * 有效时间，单位：秒
	 */
	private Integer validSecond;
	/**
	 * 创建时间
	 */
	private Date createdAt;

}
