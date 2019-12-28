package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.CodeSmsDao;
import io.renren.modules.info.entity.CodeSmsEntity;
import io.renren.modules.info.service.CodeSmsService;


@Service("codeSmsService")
public class CodeSmsServiceImpl extends ServiceImpl<CodeSmsDao, CodeSmsEntity> implements CodeSmsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CodeSmsEntity> page = this.page(
                new Query<CodeSmsEntity>().getPage(params),
                new QueryWrapper<CodeSmsEntity>()
        );

        return new PageUtils(page);
    }

}
