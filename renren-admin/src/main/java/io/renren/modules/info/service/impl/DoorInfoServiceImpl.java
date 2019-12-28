package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.DoorInfoDao;
import io.renren.modules.info.entity.DoorInfoEntity;
import io.renren.modules.info.service.DoorInfoService;


@Service("doorInfoService")
public class DoorInfoServiceImpl extends ServiceImpl<DoorInfoDao, DoorInfoEntity> implements DoorInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
//        IPage<DoorInfoEntity> page = this.page(
//                new Query<DoorInfoEntity>().getPage(params),
//                new QueryWrapper<DoorInfoEntity>()
//        );
//
//        return new PageUtils(page);
        String queryKey = (String) params.get("queryKey");
        PageUtils page = new PageUtils(baseMapper.list(queryKey),baseMapper.list(queryKey).size(),10,
                Integer.parseInt(String.valueOf(params.get("page"))),1);
        return page;
    }

}
