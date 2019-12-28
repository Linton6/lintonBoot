package io.renren.modules.info.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.info.entity.DoorHelpOrderEntity;

import java.util.Map;

/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
public interface DoorHelpOrderService extends IService<DoorHelpOrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

