package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.DoorHelpOrderDao;
import io.renren.modules.info.entity.DoorHelpOrderEntity;
import io.renren.modules.info.service.DoorHelpOrderService;


@Service("doorHelpOrderService")
public class DoorHelpOrderServiceImpl extends ServiceImpl<DoorHelpOrderDao, DoorHelpOrderEntity> implements DoorHelpOrderService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DoorHelpOrderEntity> page = this.page(
                new Query<DoorHelpOrderEntity>().getPage(params),
                new QueryWrapper<DoorHelpOrderEntity>()
        );

        return new PageUtils(page);
    }

}
