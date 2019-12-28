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

import io.renren.modules.info.entity.HibernateSequenceEntity;
import io.renren.modules.info.service.HibernateSequenceService;
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
@RequestMapping("info/hibernatesequence")
public class HibernateSequenceController {
    @Autowired
    private HibernateSequenceService hibernateSequenceService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:hibernatesequence:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hibernateSequenceService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{nextVal}")
    @RequiresPermissions("info:hibernatesequence:info")
    public R info(@PathVariable("nextVal") Long nextVal){
        HibernateSequenceEntity hibernateSequence = hibernateSequenceService.getById(nextVal);

        return R.ok().put("hibernateSequence", hibernateSequence);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:hibernatesequence:save")
    public R save(@RequestBody HibernateSequenceEntity hibernateSequence){
        hibernateSequenceService.save(hibernateSequence);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:hibernatesequence:update")
    public R update(@RequestBody HibernateSequenceEntity hibernateSequence){
        ValidatorUtils.validateEntity(hibernateSequence);
        hibernateSequenceService.updateById(hibernateSequence);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:hibernatesequence:delete")
    public R delete(@RequestBody Long[] nextVals){
        hibernateSequenceService.removeByIds(Arrays.asList(nextVals));

        return R.ok();
    }

}
