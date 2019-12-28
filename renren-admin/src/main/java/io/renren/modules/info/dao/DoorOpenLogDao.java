package io.renren.modules.info.dao;

import io.renren.modules.info.entity.DoorOpenLogEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

/**
 * 
 * 
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
@Mapper
public interface DoorOpenLogDao extends BaseMapper<DoorOpenLogEntity> {

    ArrayList<DoorOpenLogEntity> openLog(@Param("queryKey") String queryKey);
	
}
