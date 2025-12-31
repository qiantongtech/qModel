package tech.qiantong.qmodel.module.modelReconstitution.domain;

import java.net.*;

/**
 * 模型输入管理 对象 model_input
 *
 * @author YWG
 * @date 2023-09-26
 */
public class ModelScreenInputReconstitution {

    /**
     * 小山口-一枢纽补给水
     */

    private String firstSuppliesWater;

    /**
     * 一枢纽-二枢纽补给水
     */

    private String secondSuppliesWater;

    /**
     * 黄水沟入汇
     */

    private String hsgTable;

    /**
     * 乌拉斯台河月均来水
     */

    private String wlstRiverWater;

    /**
     * 一枢纽南干分水
     */

    private String firstSouthHub;

    /**
     * 一枢纽北干分水
     */

    private String firstNorthHub;


    /**
     * 一枢纽河道损失
     */
    private String firstShunshi;


    /**
     * 二枢纽南干分水
     */

    private String secondSouthHub;


    /**
     * 二枢纽北干分水
     */
    private String secondNorthHub;


    /**
     * 二枢纽河道损失
     */
    private String secondShunshi;


    /**
     * 宝浪苏木至博斯腾湖东支河道损失
     */
    private String dongZhiShunshi;


    /**
     * 宝浪苏木至博斯腾湖西支河道损失
     */
    private String xiZhiShunshi;

    /**
     * 小山口水电站数据
     */
    private String xskTable;


    /**
     * 模型计算开始时间
     */
    private String beginDate;


    /**
     * 模型计算结束时间
     */
    private String endDate;

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ModelScreenInputReconstitution() {
    }

    public String getFirstSuppliesWater() {
        return firstSuppliesWater;
    }

    public void setFirstSuppliesWater(String firstSuppliesWater) {
        this.firstSuppliesWater = firstSuppliesWater;
    }

    public String getSecondSuppliesWater() {
        return secondSuppliesWater;
    }

    public void setSecondSuppliesWater(String secondSuppliesWater) {
        this.secondSuppliesWater = secondSuppliesWater;
    }

    public String getHsgTable() {
        return hsgTable;
    }

    public void setHsgTable(String hsgTable) {
        this.hsgTable = hsgTable;
    }

    public String getWlstRiverWater() {
        return wlstRiverWater;
    }

    public void setWlstRiverWater(String wlstRiverWater) {
        this.wlstRiverWater = wlstRiverWater;
    }

    public String getFirstSouthHub() {
        return firstSouthHub;
    }

    public void setFirstSouthHub(String firstSouthHub) {
        this.firstSouthHub = firstSouthHub;
    }

    public String getFirstNorthHub() {
        return firstNorthHub;
    }

    public void setFirstNorthHub(String firstNorthHub) {
        this.firstNorthHub = firstNorthHub;
    }

    public String getFirstShunshi() {
        return firstShunshi;
    }

    public void setFirstShunshi(String firstShunshi) {
        this.firstShunshi = firstShunshi;
    }

    public String getSecondSouthHub() {
        return secondSouthHub;
    }

    public void setSecondSouthHub(String secondSouthHub) {
        this.secondSouthHub = secondSouthHub;
    }

    public String getSecondNorthHub() {
        return secondNorthHub;
    }

    public void setSecondNorthHub(String secondNorthHub) {
        this.secondNorthHub = secondNorthHub;
    }

    public String getSecondShunshi() {
        return secondShunshi;
    }

    public void setSecondShunshi(String secondShunshi) {
        this.secondShunshi = secondShunshi;
    }

    public String getXskTable() {
        return xskTable;
    }

    public void setXskTable(String xskTable) {
        this.xskTable = xskTable;
    }


    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getDongZhiShunshi() {
        return dongZhiShunshi;
    }

    public void setDongZhiShunshi(String dongZhiShunshi) {
        this.dongZhiShunshi = dongZhiShunshi;
    }

    public String getXiZhiShunshi() {
        return xiZhiShunshi;
    }

    public void setXiZhiShunshi(String xiZhiShunshi) {
        this.xiZhiShunshi = xiZhiShunshi;
    }

    public ModelScreenInputReconstitution(String firstSuppliesWater, String secondSuppliesWater, String hsgTable, String wlstRiverWater, String firstSouthHub, String firstNorthHub, String firstShunshi, String secondSouthHub, String secondNorthHub, String secondShunshi, String dongZhiShunshi, String xiZhiShunshi, String xskTable, String beginDate, String endDate) {
        this.firstSuppliesWater = firstSuppliesWater;
        this.secondSuppliesWater = secondSuppliesWater;
        this.hsgTable = hsgTable;
        this.wlstRiverWater = wlstRiverWater;
        this.firstSouthHub = firstSouthHub;
        this.firstNorthHub = firstNorthHub;
        this.firstShunshi = firstShunshi;
        this.secondSouthHub = secondSouthHub;
        this.secondNorthHub = secondNorthHub;
        this.secondShunshi = secondShunshi;
        this.dongZhiShunshi = dongZhiShunshi;
        this.xiZhiShunshi = xiZhiShunshi;
        this.xskTable = xskTable;
        this.beginDate = beginDate;
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "ModelScreenInput{" +
                "firstSuppliesWater='" + URLEncoder.encode(firstSuppliesWater) + '\'' +
                ", secondSuppliesWater='" +  URLEncoder.encode(secondSuppliesWater) + '\'' +
                ", hsgTable='" +  URLEncoder.encode(hsgTable) + '\'' +
                ", wlstRiverWater='" +  URLEncoder.encode(wlstRiverWater) + '\'' +
                ", firstSouthHub='" +  URLEncoder.encode(firstSouthHub) + '\'' +
                ", firstNorthHub='" +  URLEncoder.encode(firstNorthHub) + '\'' +
                ", firstShunshi='" +  URLEncoder.encode(firstShunshi) + '\'' +
                ", secondSouthHub='" +  URLEncoder.encode(secondSouthHub) + '\'' +
                ", secondNorthHub='" +  URLEncoder.encode(secondNorthHub) + '\'' +
                ", secondShunshi='" +  URLEncoder.encode(secondShunshi)+ '\'' +
                ", dongZhiShunshi='" +  URLEncoder.encode(dongZhiShunshi) + '\'' +
                ", xiZhiShunshi='" +  URLEncoder.encode(xiZhiShunshi) + '\'' +
                ", xskTable='" +  URLEncoder.encode(xskTable) + '\'' +
                ", beginDate='" +  URLEncoder.encode(beginDate) + '\'' +
                ", endDate='" +  URLEncoder.encode(endDate) + '\'' +
                '}';
    }
}
