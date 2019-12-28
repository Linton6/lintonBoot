package io.renren.modules.info.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.info.entity.CodeSmsEntity;

import java.util.Map;

/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
public interface CodeSmsService extends IService<CodeSmsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

