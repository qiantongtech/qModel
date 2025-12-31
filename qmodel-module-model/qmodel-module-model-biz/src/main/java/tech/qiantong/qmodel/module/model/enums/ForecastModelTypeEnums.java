package tech.qiantong.qmodel.module.model.enums;

public enum ForecastModelTypeEnums {
    GS("0", "高斯过程"),
    SJ("1", "神经网络");
    public final String code;
    public final String info;

    ForecastModelTypeEnums(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public static ForecastModelTypeEnums get(String code) {
        for (ForecastModelTypeEnums v : values()) {
            if (v.eq(code)) {
                return v;
            }
        }
        return null;
    }

    // 根据code返回县市名称
    public static ForecastModelTypeEnums getName(String info) {
        for (ForecastModelTypeEnums v : values()) {
            if (v.like(info)) {
                return v;
            }
        }
        return null;
    }

    public boolean eq(String code) {
        return this.code.equals(code);
    }

    public boolean like(String info) {
        return this.info.equals(info);
    }

    public static String getInfo(String code) {
        return ForecastModelTypeEnums.get(code).getInfo();
    }

    public static String getCode(String info) {
        return ForecastModelTypeEnums.getName(info).getCode();
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
