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

import io.renren.modules.info.entity.CodeSmsEntity;
import io.renren.modules.info.service.CodeSmsService;
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
@RequestMapping("info/codesms")
public class CodeSmsController {
    @Autowired
    private CodeSmsService codeSmsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:codesms:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = codeSmsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:codesms:info")
    public R info(@PathVariable("id") Long id){
        CodeSmsEntity codeSms = codeSmsService.getById(id);

        return R.ok().put("codeSms", codeSms);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:codesms:save")
    public R save(@RequestBody CodeSmsEntity codeSms){
        codeSmsService.save(codeSms);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:codesms:update")
    public R update(@RequestBody CodeSmsEntity codeSms){
        ValidatorUtils.validateEntity(codeSms);
        codeSmsService.updateById(codeSms);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:codesms:delete")
    public R delete(@RequestBody Long[] ids){
        codeSmsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
