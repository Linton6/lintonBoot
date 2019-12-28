package io.renren.modules.info.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import io.renren.common.utils.PageUtils;
import io.renren.modules.info.entity.RoomInfoEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
public interface RoomInfoService extends IService<RoomInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    // 全部数据
    List<RoomInfoEntity> listAll();

    // 逻辑分页
    public PageUtils  list(Map<String, Object> params);

    // PageHelper插件分页



    // RowBounds(PageRowBounds)分页

    // 物理分页
}

