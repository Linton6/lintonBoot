package io.renren.modules.info.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.info.entity.RoomOrderEntity;

import java.util.Map;

/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
public interface RoomOrderService extends IService<RoomOrderEntity> {

    PageUtils queryPagePass(Map<String, Object> params);

    PageUtils queryPageUnpass(Map<String, Object> params);

    PageUtils queryPageDorm(Map<String, Object> params);


}

