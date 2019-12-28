package io.renren.modules.info.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.MemberDao;
import io.renren.modules.info.entity.MemberEntity;
import io.renren.modules.info.service.MemberService;


@Service("memberService")
public class MemberServiceImpl extends ServiceImpl<MemberDao, MemberEntity> implements MemberService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String queryKey = (String) params.get("queryKey");
        IPage<MemberEntity> page = this.page(
                new Query<MemberEntity>().getPage(params),
                new QueryWrapper<MemberEntity>()
                        .like(StringUtils.isNotBlank(queryKey),"username",queryKey)
                        .or()
                        .like(StringUtils.isNotBlank(queryKey),"stuid",queryKey)
                        .or()
                        .like(StringUtils.isNotBlank(queryKey),"telephone",queryKey)
        );

        return new PageUtils(page);
    }

    @Override
    public MemberEntity infoByStuid(String stuid) {
        return baseMapper.infoByStuid(stuid);
    }

}
