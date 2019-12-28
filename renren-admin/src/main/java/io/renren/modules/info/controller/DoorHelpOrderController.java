package io.renren.modules.info.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.info.entity.DoorHelpOrderEntity;
import io.renren.modules.info.service.DoorHelpOrderService;
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
@RequestMapping("info/doorhelporder")
public class DoorHelpOrderController {
    @Autowired
    private DoorHelpOrderService doorHelpOrderService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:doorhelporder:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = doorHelpOrderService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:doorhelporder:info")
    public R info(@PathVariable("id") Long id){
        DoorHelpOrderEntity doorHelpOrder = doorHelpOrderService.getById(id);

        return R.ok().put("doorHelpOrder", doorHelpOrder);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:doorhelporder:save")
    public R save(@RequestBody DoorHelpOrderEntity doorHelpOrder){
        doorHelpOrderService.save(doorHelpOrder);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:doorhelporder:update")
    public R update(@RequestBody DoorHelpOrderEntity doorHelpOrder){
        ValidatorUtils.validateEntity(doorHelpOrder);
        doorHelpOrderService.updateById(doorHelpOrder);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:doorhelporder:delete")
    public R delete(@RequestBody Long[] ids){
        doorHelpOrderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
