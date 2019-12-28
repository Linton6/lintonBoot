package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.DoorOpenLogDao;
import io.renren.modules.info.entity.DoorOpenLogEntity;
import io.renren.modules.info.service.DoorOpenLogService;


@Service("doorOpenLogService")
public class DoorOpenLogServiceImpl extends ServiceImpl<DoorOpenLogDao, DoorOpenLogEntity> implements DoorOpenLogService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
//        IPage<DoorOpenLogEntity> page = this.page(
//                new Query<DoorOpenLogEntity>().getPage(params),
//                new QueryWrapper<DoorOpenLogEntity>()
//        );
//
//        return new PageUtils(page);
        String queryKey = (String) params.get("queryKey");
        PageUtils page = new PageUtils(baseMapper.openLog(queryKey),baseMapper.openLog(queryKey).size(),10,
                Integer.parseInt(String.valueOf(params.get("page"))),1);
        return page;
    }

}
