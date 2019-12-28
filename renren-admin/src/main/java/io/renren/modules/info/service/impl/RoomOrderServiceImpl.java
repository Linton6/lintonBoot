package io.renren.modules.info.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.RoomOrderDao;
import io.renren.modules.info.entity.RoomOrderEntity;
import io.renren.modules.info.service.RoomOrderService;


@Service("roomOrderService")
public class RoomOrderServiceImpl extends ServiceImpl<RoomOrderDao, RoomOrderEntity> implements RoomOrderService {

    @Override
    public PageUtils queryPageUnpass(Map<String, Object> params) {
//        IPage<RoomOrderEntity> page = this.page(
//                new Query<RoomOrderEntity>().getPage(params),
//                new QueryWrapper<RoomOrderEntity>()
//        );
//
//        return new PageUtils(page);
        String queryKey = (String) params.get("queryKey");
        PageUtils page = new PageUtils(baseMapper.listUnpass(queryKey),baseMapper.listUnpass(queryKey).size(),10,
                Integer.parseInt(String.valueOf(params.get("page"))),1);
        return page;
    }

    @Override
    public PageUtils queryPagePass(Map<String, Object> params) {
        String queryKey = (String) params.get("queryKey");

        PageUtils page = new PageUtils(baseMapper.listPass(queryKey),baseMapper.listPass(queryKey).size(),10,
                Integer.parseInt(String.valueOf(params.get("page"))),1);
        return page;
    }

    @Override
    public PageUtils queryPageDorm(Map<String, Object> params) {
        String queryKey = (String) params.get("queryKey");
        PageUtils page = new PageUtils(baseMapper.listDorm(queryKey),baseMapper.listDorm(queryKey).size(),10,
                Integer.parseInt(String.valueOf(params.get("page"))),1);
        return page;
    }


}
