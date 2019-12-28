package io.renren.modules.info.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.info.service.VerifyCodeUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.info.entity.TencentCosEntity;
import io.renren.modules.info.service.TencentCosService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 
 *
 * @author Linton
 * @email linton6@foxmail.com
 * @date 2019-06-06 17:14:37
 */
@RestController
@RequestMapping("info/tencentcos")
public class TencentCosController {
    @Autowired
    private TencentCosService tencentCosService;
    @Autowired
    private VerifyCodeUtil verifyCodeUtil;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:tencentcos:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = tencentCosService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:tencentcos:info")
    public R info(@PathVariable("id") Long id){
        TencentCosEntity tencentCos = tencentCosService.getById(id);

        return R.ok().put("tencentCos", tencentCos);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:tencentcos:save")
    public R save(@RequestBody TencentCosEntity tencentCos){
        tencentCosService.save(tencentCos);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:tencentcos:update")
    public R update(@RequestBody TencentCosEntity tencentCos){
        ValidatorUtils.validateEntity(tencentCos);
        tencentCosService.updateById(tencentCos);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:tencentcos:delete")
    public R delete(@RequestBody Long[] ids){
        tencentCosService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    @RequestMapping("/getVerifyCodeImg")
    @ResponseBody
    public void getVerifyCodeImg(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String code = VerifyCodeUtil.drawImage(output);
        //将验证码文本直接存放到session中
        session.setAttribute("verifyCode", code);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
