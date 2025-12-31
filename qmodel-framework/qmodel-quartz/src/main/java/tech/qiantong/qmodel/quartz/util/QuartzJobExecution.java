package tech.qiantong.qmodel.quartz.util;

import org.quartz.JobExecutionContext;
import tech.qiantong.qmodel.quartz.domain.SysJob;

/**
 * 定时任务处理（允许并发执行）
 *
 * @author anivia
 *
 */
public class QuartzJobExecution extends AbstractQuartzJob
{
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception
    {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
