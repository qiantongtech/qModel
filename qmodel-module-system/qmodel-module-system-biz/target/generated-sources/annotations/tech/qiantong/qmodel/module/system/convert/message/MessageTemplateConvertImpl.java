package tech.qiantong.qmodel.module.system.convert.message;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessageTemplatePageReqVO;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessageTemplateRespVO;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessageTemplateSaveReqVO;
import tech.qiantong.qmodel.module.system.dal.dataobject.message.MessageTemplateDO;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-01-12T16:23:53+0800",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 1.8.0_212 (Oracle Corporation)"
)
public class MessageTemplateConvertImpl implements MessageTemplateConvert {

    @Override
    public MessageTemplateDO convertToDO(MessageTemplatePageReqVO messageTemplatePageReqVO) {
        if ( messageTemplatePageReqVO == null ) {
            return null;
        }

        MessageTemplateDO.MessageTemplateDOBuilder messageTemplateDO = MessageTemplateDO.builder();

        messageTemplateDO.id( messageTemplatePageReqVO.getId() );
        messageTemplateDO.title( messageTemplatePageReqVO.getTitle() );
        messageTemplateDO.content( messageTemplatePageReqVO.getContent() );
        messageTemplateDO.category( messageTemplatePageReqVO.getCategory() );
        messageTemplateDO.msgLevel( messageTemplatePageReqVO.getMsgLevel() );
        messageTemplateDO.validFlag( messageTemplatePageReqVO.getValidFlag() );
        messageTemplateDO.delFlag( messageTemplatePageReqVO.getDelFlag() );

        return messageTemplateDO.build();
    }

    @Override
    public MessageTemplateDO convertToDO(MessageTemplateSaveReqVO messageTemplateSaveReqVO) {
        if ( messageTemplateSaveReqVO == null ) {
            return null;
        }

        MessageTemplateDO.MessageTemplateDOBuilder messageTemplateDO = MessageTemplateDO.builder();

        messageTemplateDO.id( messageTemplateSaveReqVO.getId() );
        messageTemplateDO.title( messageTemplateSaveReqVO.getTitle() );
        messageTemplateDO.content( messageTemplateSaveReqVO.getContent() );
        messageTemplateDO.category( messageTemplateSaveReqVO.getCategory() );
        messageTemplateDO.msgLevel( messageTemplateSaveReqVO.getMsgLevel() );

        return messageTemplateDO.build();
    }

    @Override
    public MessageTemplateRespVO convertToRespVO(MessageTemplateDO messageTemplateDO) {
        if ( messageTemplateDO == null ) {
            return null;
        }

        MessageTemplateRespVO messageTemplateRespVO = new MessageTemplateRespVO();

        messageTemplateRespVO.setId( messageTemplateDO.getId() );
        messageTemplateRespVO.setTitle( messageTemplateDO.getTitle() );
        messageTemplateRespVO.setContent( messageTemplateDO.getContent() );
        messageTemplateRespVO.setCategory( messageTemplateDO.getCategory() );
        messageTemplateRespVO.setMsgLevel( messageTemplateDO.getMsgLevel() );
        messageTemplateRespVO.setValidFlag( messageTemplateDO.getValidFlag() );
        messageTemplateRespVO.setDelFlag( messageTemplateDO.getDelFlag() );
        messageTemplateRespVO.setCreateBy( messageTemplateDO.getCreateBy() );
        messageTemplateRespVO.setCreatorId( messageTemplateDO.getCreatorId() );
        messageTemplateRespVO.setCreateTime( messageTemplateDO.getCreateTime() );
        messageTemplateRespVO.setUpdateBy( messageTemplateDO.getUpdateBy() );
        messageTemplateRespVO.setUpdatorId( messageTemplateDO.getUpdatorId() );
        messageTemplateRespVO.setUpdateTime( messageTemplateDO.getUpdateTime() );
        messageTemplateRespVO.setRemark( messageTemplateDO.getRemark() );

        return messageTemplateRespVO;
    }

    @Override
    public List<MessageTemplateRespVO> convertToRespVOList(List<MessageTemplateDO> messageTemplateDOList) {
        if ( messageTemplateDOList == null ) {
            return null;
        }

        List<MessageTemplateRespVO> list = new ArrayList<MessageTemplateRespVO>( messageTemplateDOList.size() );
        for ( MessageTemplateDO messageTemplateDO : messageTemplateDOList ) {
            list.add( convertToRespVO( messageTemplateDO ) );
        }

        return list;
    }
}
