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
 * @date 2019-06-06 17:14:37
 */
@Data
@TableName("tencent_cos")
public class TencentCosEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * url 类型
	 */
	private String tag;
	/**
	 * 文件url
	 */
	private String url;
	/**
	 * 
	 */
	private Date createdAt;

}
