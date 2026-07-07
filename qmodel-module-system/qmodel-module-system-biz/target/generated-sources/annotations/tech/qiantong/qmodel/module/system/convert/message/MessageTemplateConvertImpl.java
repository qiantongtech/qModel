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
    date = "2026-07-07T10:11:23+0800",
    comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 3.46.0.v20260407-0427, environment: Java 21.0.10 (Eclipse Adoptium)"
)
public class MessageTemplateConvertImpl implements MessageTemplateConvert {

    @Override
    public MessageTemplateDO convertToDO(MessageTemplatePageReqVO messageTemplatePageReqVO) {
        if ( messageTemplatePageReqVO == null ) {
            return null;
        }

        MessageTemplateDO.MessageTemplateDOBuilder messageTemplateDO = MessageTemplateDO.builder();

        messageTemplateDO.category( messageTemplatePageReqVO.getCategory() );
        messageTemplateDO.content( messageTemplatePageReqVO.getContent() );
        messageTemplateDO.delFlag( messageTemplatePageReqVO.getDelFlag() );
        messageTemplateDO.id( messageTemplatePageReqVO.getId() );
        messageTemplateDO.msgLevel( messageTemplatePageReqVO.getMsgLevel() );
        messageTemplateDO.title( messageTemplatePageReqVO.getTitle() );
        messageTemplateDO.validFlag( messageTemplatePageReqVO.getValidFlag() );

        return messageTemplateDO.build();
    }

    @Override
    public MessageTemplateDO convertToDO(MessageTemplateSaveReqVO messageTemplateSaveReqVO) {
        if ( messageTemplateSaveReqVO == null ) {
            return null;
        }

        MessageTemplateDO.MessageTemplateDOBuilder messageTemplateDO = MessageTemplateDO.builder();

        messageTemplateDO.category( messageTemplateSaveReqVO.getCategory() );
        messageTemplateDO.content( messageTemplateSaveReqVO.getContent() );
        messageTemplateDO.id( messageTemplateSaveReqVO.getId() );
        messageTemplateDO.msgLevel( messageTemplateSaveReqVO.getMsgLevel() );
        messageTemplateDO.title( messageTemplateSaveReqVO.getTitle() );

        return messageTemplateDO.build();
    }

    @Override
    public MessageTemplateRespVO convertToRespVO(MessageTemplateDO messageTemplateDO) {
        if ( messageTemplateDO == null ) {
            return null;
        }

        MessageTemplateRespVO messageTemplateRespVO = new MessageTemplateRespVO();

        messageTemplateRespVO.setCategory( messageTemplateDO.getCategory() );
        messageTemplateRespVO.setContent( messageTemplateDO.getContent() );
        messageTemplateRespVO.setCreateBy( messageTemplateDO.getCreateBy() );
        messageTemplateRespVO.setCreateTime( messageTemplateDO.getCreateTime() );
        messageTemplateRespVO.setCreatorId( messageTemplateDO.getCreatorId() );
        messageTemplateRespVO.setDelFlag( messageTemplateDO.getDelFlag() );
        messageTemplateRespVO.setId( messageTemplateDO.getId() );
        messageTemplateRespVO.setMsgLevel( messageTemplateDO.getMsgLevel() );
        messageTemplateRespVO.setRemark( messageTemplateDO.getRemark() );
        messageTemplateRespVO.setTitle( messageTemplateDO.getTitle() );
        messageTemplateRespVO.setUpdateBy( messageTemplateDO.getUpdateBy() );
        messageTemplateRespVO.setUpdateTime( messageTemplateDO.getUpdateTime() );
        messageTemplateRespVO.setUpdatorId( messageTemplateDO.getUpdatorId() );
        messageTemplateRespVO.setValidFlag( messageTemplateDO.getValidFlag() );

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
