package io.renren.common.config;

/**
 * @Author Linton
 * @Date 2019/6/23 19:03
 * @Email 649557938@qq.com
 * @Version 1.0
 * @Description 分页配置类
 */

import com.github.pagehelper.PageHelper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.Properties;

@Configuration
public class PageMybatisConf {
    @Bean
    public PageHelper pageHelper() {
        System.out.println("MyBatisConfiguration.pageHelper()");
        PageHelper pageHelper = new PageHelper();
        Properties p = new Properties();
        p.setProperty("offsetAsPageNum", "true");
        p.setProperty("rowBoundsWithCount", "true");
        p.setProperty("reasonable", "true");
        p.setProperty("dialect","postgresql");
        pageHelper.setProperties(p);
        return pageHelper;
    }
}
