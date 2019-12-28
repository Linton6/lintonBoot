package io.renren.modules.info.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.info.dao.RoomInfoDao;
import io.renren.modules.info.entity.RoomInfoEntity;
import io.renren.modules.info.service.RoomInfoService;

import static com.baomidou.mybatisplus.extension.toolkit.SqlHelper.sqlSession;


@Service("roomInfoService")
public class RoomInfoServiceImpl extends ServiceImpl<RoomInfoDao, RoomInfoEntity> implements RoomInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RoomInfoEntity> page = this.page(
                new Query<RoomInfoEntity>().getPage(params),
                new QueryWrapper<RoomInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<RoomInfoEntity> listAll() {
        return baseMapper.list("");
    }

    @Override
    // 逻辑分页
    public PageUtils list(Map<String, Object> params) {
//        List<RoomInfoEntity> list = sqlSession.selectList("x",null,new RowBounds(1,10));
//        PageHelper.startPage(2,10);
//        List<RoomInfoEntity> listAll = listAll();

//        IPage<RoomInfoEntity> page = this.page(
//                new Query<RoomInfoEntity>().getPage(params),
//                new QueryWrapper<RoomInfoEntity>()
//        );
//
//        return new PageUtils(page);
        String queryKey = (String) params.get("queryKey");
        PageUtils page = new PageUtils(baseMapper.list(queryKey),baseMapper.list(queryKey).size(),10,
                Integer.parseInt(String.valueOf(params.get("page"))),1);
        return page;
    }


}
