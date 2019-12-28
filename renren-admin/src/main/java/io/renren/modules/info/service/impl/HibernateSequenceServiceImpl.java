package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.HibernateSequenceDao;
import io.renren.modules.info.entity.HibernateSequenceEntity;
import io.renren.modules.info.service.HibernateSequenceService;


@Service("hibernateSequenceService")
public class HibernateSequenceServiceImpl extends ServiceImpl<HibernateSequenceDao, HibernateSequenceEntity> implements HibernateSequenceService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<HibernateSequenceEntity> page = this.page(
                new Query<HibernateSequenceEntity>().getPage(params),
                new QueryWrapper<HibernateSequenceEntity>()
        );

        return new PageUtils(page);
    }

}
