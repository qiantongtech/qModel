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
    date = "2026-01-12T16:02:42+0800",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 1.8.0_212 (Oracle Corporation)"
)
public class MessageConvertImpl implements MessageConvert {

    @Override
    public MessageDO convertToDO(MessagePageReqVO messagePageReqVO) {
        if ( messagePageReqVO == null ) {
            return null;
        }

        MessageDO.MessageDOBuilder messageDO = MessageDO.builder();

        messageDO.id( messagePageReqVO.getId() );
        messageDO.senderId( messagePageReqVO.getSenderId() );
        messageDO.receiverId( messagePageReqVO.getReceiverId() );
        messageDO.title( messagePageReqVO.getTitle() );
        messageDO.content( messagePageReqVO.getContent() );
        messageDO.category( messagePageReqVO.getCategory() );
        messageDO.msgLevel( messagePageReqVO.getMsgLevel() );
        messageDO.module( messagePageReqVO.getModule() );
        messageDO.entityType( messagePageReqVO.getEntityType() );
        messageDO.entityId( messagePageReqVO.getEntityId() );
        messageDO.entityUrl( messagePageReqVO.getEntityUrl() );
        messageDO.hasRead( messagePageReqVO.getHasRead() );
        messageDO.hasRetraction( messagePageReqVO.getHasRetraction() );
        messageDO.validFlag( messagePageReqVO.getValidFlag() );
        messageDO.delFlag( messagePageReqVO.getDelFlag() );

        return messageDO.build();
    }

    @Override
    public MessageDO convertToDO(MessageSaveReqVO messageSaveReqVO) {
        if ( messageSaveReqVO == null ) {
            return null;
        }

        MessageDO.MessageDOBuilder messageDO = MessageDO.builder();

        if ( messageSaveReqVO.getId() != null ) {
            messageDO.id( Long.parseLong( messageSaveReqVO.getId() ) );
        }
        messageDO.senderId( messageSaveReqVO.getSenderId() );
        messageDO.receiverId( messageSaveReqVO.getReceiverId() );
        messageDO.module( messageSaveReqVO.getModule() );
        messageDO.entityType( messageSaveReqVO.getEntityType() );
        messageDO.entityId( messageSaveReqVO.getEntityId() );
        messageDO.entityUrl( messageSaveReqVO.getEntityUrl() );
        messageDO.hasRead( messageSaveReqVO.getHasRead() );
        messageDO.delFlag( messageSaveReqVO.getDelFlag() );

        return messageDO.build();
    }

    @Override
    public MessageRespVO convertToRespVO(MessageDO messageDO) {
        if ( messageDO == null ) {
            return null;
        }

        MessageRespVO messageRespVO = new MessageRespVO();

        messageRespVO.setId( messageDO.getId() );
        messageRespVO.setSenderId( messageDO.getSenderId() );
        messageRespVO.setReceiverId( messageDO.getReceiverId() );
        messageRespVO.setTitle( messageDO.getTitle() );
        messageRespVO.setContent( messageDO.getContent() );
        messageRespVO.setCategory( messageDO.getCategory() );
        messageRespVO.setMsgLevel( messageDO.getMsgLevel() );
        messageRespVO.setModule( messageDO.getModule() );
        messageRespVO.setEntityType( messageDO.getEntityType() );
        messageRespVO.setEntityId( messageDO.getEntityId() );
        messageRespVO.setEntityUrl( messageDO.getEntityUrl() );
        messageRespVO.setHasRead( messageDO.getHasRead() );
        messageRespVO.setHasRetraction( messageDO.getHasRetraction() );
        messageRespVO.setValidFlag( messageDO.getValidFlag() );
        messageRespVO.setDelFlag( messageDO.getDelFlag() );
        messageRespVO.setCreateBy( messageDO.getCreateBy() );
        messageRespVO.setCreatorId( messageDO.getCreatorId() );
        messageRespVO.setCreateTime( messageDO.getCreateTime() );
        messageRespVO.setUpdateBy( messageDO.getUpdateBy() );
        messageRespVO.setUpdatorId( messageDO.getUpdatorId() );
        messageRespVO.setUpdateTime( messageDO.getUpdateTime() );
        messageRespVO.setRemark( messageDO.getRemark() );

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
