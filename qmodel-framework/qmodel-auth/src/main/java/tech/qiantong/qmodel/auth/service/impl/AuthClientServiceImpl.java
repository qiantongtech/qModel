package tech.qiantong.qmodel.auth.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.auth.mapper.AuthClientMapper;
import tech.qiantong.qmodel.auth.domain.AuthClient;
import tech.qiantong.qmodel.auth.service.IAuthClientService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;

/**
 * 应用管理Service业务层处理
 *
 * @author qModel
 * @date 2024-08-31
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthClientServiceImpl  extends ServiceImpl<AuthClientMapper,AuthClient> implements IAuthClientService {
    @Autowired
    private AuthClientMapper authClientMapper;

}
