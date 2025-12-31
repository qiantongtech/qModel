package tech.qiantong.qmodel.module.model.enums;

public enum ForecastStatusEnums {
    DKS("0", "待开始"),
    YCZ("1", "预测中"),
    WC("2", "完成");
    public final String code;
    public final String info;

    ForecastStatusEnums(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public static ForecastStatusEnums get(String code) {
        for (ForecastStatusEnums v : values()) {
            if (v.eq(code)) {
                return v;
            }
        }
        return null;
    }

    // 根据code返回县市名称
    public static ForecastStatusEnums getName(String info) {
        for (ForecastStatusEnums v : values()) {
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
        return ForecastStatusEnums.get(code).getInfo();
    }

    public static String getCode(String info) {
        return ForecastStatusEnums.getName(info).getCode();
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
