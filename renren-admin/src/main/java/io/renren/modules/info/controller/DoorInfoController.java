package io.renren.modules.info.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.info.service.MemberService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.info.entity.DoorInfoEntity;
import io.renren.modules.info.service.DoorInfoService;
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
@RequestMapping("info/doorinfo")
public class DoorInfoController {
    @Autowired
    private DoorInfoService doorInfoService;


    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:doorinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = doorInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:doorinfo:info")
    public R info(@PathVariable("id") Long id){
        DoorInfoEntity doorInfo = doorInfoService.getById(id);

        return R.ok().put("doorInfo", doorInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:doorinfo:save")
    public R save(@RequestBody DoorInfoEntity doorInfo){

        String qrcode = "http://123.207.99.248:8090/door/quest?MAC="+doorInfo.getBltMac()+"&doorId="+doorInfo.getDoorId();
        doorInfo.setQrCode(qrcode);
        doorInfo.setOwnerId(1l);
        doorInfoService.save(doorInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:doorinfo:update")
    public R update(@RequestBody DoorInfoEntity doorInfo){
        String qrcode = "http://123.207.99.248:8090/door/quest?MAC="+doorInfo.getBltMac()+"&doorId="+doorInfo.getDoorId();
        doorInfo.setQrCode(qrcode);
        ValidatorUtils.validateEntity(doorInfo);
        doorInfoService.updateById(doorInfo);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:doorinfo:delete")
    public R delete(@RequestBody Long[] ids){
        doorInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
