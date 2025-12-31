package tech.qiantong.qmodel.server;

import org.dromara.easyes.starter.register.EsMapperScan;
import org.dromara.x.file.storage.spring.EnableFileStorage;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * 启动程序
 *
 * @author anivia
 */
@EnableFileStorage
@EsMapperScan("tech.qiantong.**.esmapper")
@ComponentScan(basePackages = {"tech.qiantong"})
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class QModelApplication {
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(QModelApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  qModel模型平台启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "        __  __           _      _ \n" +
                "       |  \\/  |         | |    | |\n" +
                "   __ _| \\  / | ___   __| | ___| |\n" +
                "  / _` | |\\/| |/ _ \\ / _` |/ _ \\ |\n" +
                " | (_| | |  | | (_) | (_| |  __/ |\n" +
                "  \\__, |_|  |_|\\___/ \\__,_|\\___|_|\n" +
                "     | |                          \n" +
                "     |_|                          ");
    }
}
