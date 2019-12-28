package io.renren.modules.info.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.info.entity.TencentCosEntity;

import java.util.Map;

/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-06 17:14:37
 */
public interface TencentCosService extends IService<TencentCosEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

