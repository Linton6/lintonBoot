package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.TencentCosDao;
import io.renren.modules.info.entity.TencentCosEntity;
import io.renren.modules.info.service.TencentCosService;


@Service("tencentCosService")
public class TencentCosServiceImpl extends ServiceImpl<TencentCosDao, TencentCosEntity> implements TencentCosService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TencentCosEntity> page = this.page(
                new Query<TencentCosEntity>().getPage(params),
                new QueryWrapper<TencentCosEntity>()
        );

        return new PageUtils(page);
    }

}
