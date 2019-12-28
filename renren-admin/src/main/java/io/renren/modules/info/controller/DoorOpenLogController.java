package io.renren.modules.info.controller;

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

import io.renren.modules.info.entity.DoorOpenLogEntity;
import io.renren.modules.info.service.DoorOpenLogService;
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
@RequestMapping("info/dooropenlog")
public class DoorOpenLogController {
    @Autowired
    private DoorOpenLogService doorOpenLogService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:dooropenlog:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = doorOpenLogService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:dooropenlog:info")
    public R info(@PathVariable("id") Long id){
        DoorOpenLogEntity doorOpenLog = doorOpenLogService.getById(id);

        return R.ok().put("doorOpenLog", doorOpenLog);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:dooropenlog:save")
    public R save(@RequestBody DoorOpenLogEntity doorOpenLog){
        doorOpenLogService.save(doorOpenLog);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:dooropenlog:update")
    public R update(@RequestBody DoorOpenLogEntity doorOpenLog){
        ValidatorUtils.validateEntity(doorOpenLog);
        doorOpenLogService.updateById(doorOpenLog);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:dooropenlog:delete")
    public R delete(@RequestBody Long[] ids){
        doorOpenLogService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
