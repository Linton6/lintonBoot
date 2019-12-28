package io.renren.modules.info.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.info.entity.RoomInfoEntity;
import io.renren.modules.info.service.RoomInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-01 17:10:41
 */
@RestController
@RequestMapping("info/roominfo")
public class RoomInfoController {
    @Autowired
    private RoomInfoService roomInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
//    @RequiresPermissions("info:roominfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = roomInfoService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 完全信息的列表
     */
    @RequestMapping("/listAll")
//    @RequiresPermissions("info:roominfo:list")
    public R listAll(@RequestParam Map<String, Object> params) {
        PageUtils page = roomInfoService.list(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:roominfo:info")
    public R info(@PathVariable("id") Long id){
        RoomInfoEntity roomInfo = roomInfoService.getById(id);

        return R.ok().put("roomInfo", roomInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:roominfo:save")
    public R save(@RequestBody RoomInfoEntity roomInfo){
        roomInfo.setOwner(1l);
        roomInfoService.save(roomInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:roominfo:update")
    public R update(@RequestBody RoomInfoEntity roomInfo){
        ValidatorUtils.validateEntity(roomInfo);
        roomInfoService.updateById(roomInfo);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:roominfo:delete")
    public R delete(@RequestBody Long[] ids){
        roomInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
