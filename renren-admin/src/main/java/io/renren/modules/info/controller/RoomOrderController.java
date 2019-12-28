package io.renren.modules.info.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.info.entity.MemberEntity;
import io.renren.modules.info.service.MemberService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.info.entity.RoomOrderEntity;
import io.renren.modules.info.service.RoomOrderService;
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
@RequestMapping("info/roomorder")
public class RoomOrderController {
    @Autowired
    private RoomOrderService roomOrderService;
    @Autowired
    private MemberService memberService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("info:roomorder:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = roomOrderService.queryPagePass(params);

        return R.ok().put("page", page);
    }

    /**
     * 未通过
     * @param params
     * @return
     */
    @RequestMapping("/listUnpass")
//    @RequiresPermissions("info:roomorder:list")
    public R listUnpass(@RequestParam Map<String, Object> params){
        PageUtils page = roomOrderService.queryPageUnpass(params);

        return R.ok().put("page", page);
    }
    @RequestMapping("/listDorm")
//    @RequiresPermissions("info:roomorder:list")
    public R listDorm(@RequestParam Map<String, Object> params){
        PageUtils page = roomOrderService.queryPageDorm(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("info:roomorder:info")
    public R info(@PathVariable("id") Long id){
        RoomOrderEntity roomOrder = roomOrderService.getById(id);

        return R.ok().put("roomOrder", roomOrder);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("info:roomorder:save")
    public R save(@RequestBody RoomOrderEntity roomOrder){
        if (roomOrder.getTag().equals("dorm")){
            String stuId = String.valueOf(roomOrder.getUserId());
            String name = roomOrder.getUsername();
            MemberEntity member = memberService.infoByStuid(stuId);
            if(member == null) {
                return R.error(500,"学号不存在！请检查后重新输入");
            }
            Long memberId = member.getId();
            if(!member.getUsername().equals(name)){
                return R.error(500,"申请人姓名错误！请检查后重新输入");
            }
            roomOrder.setUserId(memberId);
            roomOrder.setCreatedAt(new Date());
            Date date = roomOrder.getCreatedAt();
            Date end = new Date(date.getTime() + (long)365 * 3 * 24 * 60 * 60 * 1000);
            roomOrder.setEndTime(end);
            roomOrder.setAuditorId(1l);
            // 此处应该再检查下姓名的正确性
        }
        roomOrderService.save(roomOrder);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("info:roomorder:update")
    public R update(@RequestBody RoomOrderEntity roomOrder){
        ValidatorUtils.validateEntity(roomOrder);
        roomOrderService.updateById(roomOrder);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("info:roomorder:delete")
    public R delete(@RequestBody Long[] ids){
        roomOrderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
