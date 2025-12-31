package tech.qiantong.qmodel.module.model.enums;

public enum InboundFLowEnums {
    // 涵洞
    MN("0", "模拟计算"),
    SS("1", "实时计算");
    public final String code;
    public final String info;

    InboundFLowEnums(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public static InboundFLowEnums get(String code) {
        for (InboundFLowEnums v : values()) {
            if (v.eq(code)) {
                return v;
            }
        }
        return null;
    }

    // 根据code返回县市名称
    public static InboundFLowEnums getNme(String info) {
        for (InboundFLowEnums v : values()) {
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
        return InboundFLowEnums.get(code).getInfo();
    }

    public static String getCode(String info) {
        return InboundFLowEnums.getNme(info).getCode();
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
