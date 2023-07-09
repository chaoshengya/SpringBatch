package batch.web.controller;


import batch.web.job.DataSourceItemJob;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.batch.core.Job;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author kris
 * @date 2023/7/9 11:09 PM
 */
@Api(tags = "JobController")
@RestController
@RequestMapping(value = "/job/test")
public class JobController {

    @Resource
    DataSourceItemJob dataSourceItemJob;

    @ApiOperation(value = "数据库读取写入-job")
    @RequestMapping(value = "/jdbc", method = RequestMethod.GET)
    public String jdbc(String jobName) {
        try {
              dataSourceItemJob.dataSourceItemReaderJob();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}

