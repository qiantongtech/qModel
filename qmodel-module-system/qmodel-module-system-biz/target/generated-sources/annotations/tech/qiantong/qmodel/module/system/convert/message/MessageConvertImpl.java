package tech.qiantong.qmodel.module.system.convert.message;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessagePageReqVO;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessageRespVO;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessageSaveReqVO;
import tech.qiantong.qmodel.module.system.dal.dataobject.message.MessageDO;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-07-07T10:11:23+0800",
    comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 3.46.0.v20260407-0427, environment: Java 21.0.10 (Eclipse Adoptium)"
)
public class MessageConvertImpl implements MessageConvert {

    @Override
    public MessageDO convertToDO(MessagePageReqVO messagePageReqVO) {
        if ( messagePageReqVO == null ) {
            return null;
        }

        MessageDO.MessageDOBuilder messageDO = MessageDO.builder();

        messageDO.category( messagePageReqVO.getCategory() );
        messageDO.content( messagePageReqVO.getContent() );
        messageDO.delFlag( messagePageReqVO.getDelFlag() );
        messageDO.entityId( messagePageReqVO.getEntityId() );
        messageDO.entityType( messagePageReqVO.getEntityType() );
        messageDO.entityUrl( messagePageReqVO.getEntityUrl() );
        messageDO.hasRead( messagePageReqVO.getHasRead() );
        messageDO.hasRetraction( messagePageReqVO.getHasRetraction() );
        messageDO.id( messagePageReqVO.getId() );
        messageDO.module( messagePageReqVO.getModule() );
        messageDO.msgLevel( messagePageReqVO.getMsgLevel() );
        messageDO.receiverId( messagePageReqVO.getReceiverId() );
        messageDO.senderId( messagePageReqVO.getSenderId() );
        messageDO.title( messagePageReqVO.getTitle() );
        messageDO.validFlag( messagePageReqVO.getValidFlag() );

        return messageDO.build();
    }

    @Override
    public MessageDO convertToDO(MessageSaveReqVO messageSaveReqVO) {
        if ( messageSaveReqVO == null ) {
            return null;
        }

        MessageDO.MessageDOBuilder messageDO = MessageDO.builder();

        messageDO.delFlag( messageSaveReqVO.getDelFlag() );
        messageDO.entityId( messageSaveReqVO.getEntityId() );
        messageDO.entityType( messageSaveReqVO.getEntityType() );
        messageDO.entityUrl( messageSaveReqVO.getEntityUrl() );
        messageDO.hasRead( messageSaveReqVO.getHasRead() );
        if ( messageSaveReqVO.getId() != null ) {
            messageDO.id( Long.parseLong( messageSaveReqVO.getId() ) );
        }
        messageDO.module( messageSaveReqVO.getModule() );
        messageDO.receiverId( messageSaveReqVO.getReceiverId() );
        messageDO.senderId( messageSaveReqVO.getSenderId() );

        return messageDO.build();
    }

    @Override
    public MessageRespVO convertToRespVO(MessageDO messageDO) {
        if ( messageDO == null ) {
            return null;
        }

        MessageRespVO messageRespVO = new MessageRespVO();

        messageRespVO.setCategory( messageDO.getCategory() );
        messageRespVO.setContent( messageDO.getContent() );
        messageRespVO.setCreateBy( messageDO.getCreateBy() );
        messageRespVO.setCreateTime( messageDO.getCreateTime() );
        messageRespVO.setCreatorId( messageDO.getCreatorId() );
        messageRespVO.setDelFlag( messageDO.getDelFlag() );
        messageRespVO.setEntityId( messageDO.getEntityId() );
        messageRespVO.setEntityType( messageDO.getEntityType() );
        messageRespVO.setEntityUrl( messageDO.getEntityUrl() );
        messageRespVO.setHasRead( messageDO.getHasRead() );
        messageRespVO.setHasRetraction( messageDO.getHasRetraction() );
        messageRespVO.setId( messageDO.getId() );
        messageRespVO.setModule( messageDO.getModule() );
        messageRespVO.setMsgLevel( messageDO.getMsgLevel() );
        messageRespVO.setReceiverId( messageDO.getReceiverId() );
        messageRespVO.setRemark( messageDO.getRemark() );
        messageRespVO.setSenderId( messageDO.getSenderId() );
        messageRespVO.setTitle( messageDO.getTitle() );
        messageRespVO.setUpdateBy( messageDO.getUpdateBy() );
        messageRespVO.setUpdateTime( messageDO.getUpdateTime() );
        messageRespVO.setUpdatorId( messageDO.getUpdatorId() );
        messageRespVO.setValidFlag( messageDO.getValidFlag() );

        return messageRespVO;
    }

    @Override
    public List<MessageRespVO> convertToRespVOList(List<MessageDO> messageDOList) {
        if ( messageDOList == null ) {
            return null;
        }

        List<MessageRespVO> list = new ArrayList<MessageRespVO>( messageDOList.size() );
        for ( MessageDO messageDO : messageDOList ) {
            list.add( convertToRespVO( messageDO ) );
        }

        return list;
    }
}
