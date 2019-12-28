package io.renren.modules.info.dao;

import io.renren.modules.info.entity.MemberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {

    MemberEntity getMemberInfo(Integer id);

    MemberEntity infoByStuid(String stuid);
	
}
