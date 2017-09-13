package com.qianqiulin.ssmDemo.pojo;

public class Complaint {
    private Integer id;

    private String yingyebu;

    private String didian;

    private String jingdu;

    private String weidu;

    private String fugaiyonghushu;

    private String gudingdianhuashu;

    private String tietaqingkuang;

    private String jiejuefangan;

    private String date;

    private String chulijieguo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYingyebu() {
        return yingyebu;
    }

    public void setYingyebu(String yingyebu) {
        this.yingyebu = yingyebu == null ? null : yingyebu.trim();
    }

    public String getDidian() {
        return didian;
    }

    public void setDidian(String didian) {
        this.didian = didian == null ? null : didian.trim();
    }

    public String getJingdu() {
        return jingdu;
    }

    public void setJingdu(String jingdu) {
        this.jingdu = jingdu == null ? null : jingdu.trim();
    }

    public String getWeidu() {
        return weidu;
    }

    public void setWeidu(String weidu) {
        this.weidu = weidu == null ? null : weidu.trim();
    }

    public String getFugaiyonghushu() {
        return fugaiyonghushu;
    }

    public void setFugaiyonghushu(String fugaiyonghushu) {
        this.fugaiyonghushu = fugaiyonghushu == null ? null : fugaiyonghushu.trim();
    }

    public String getGudingdianhuashu() {
        return gudingdianhuashu;
    }

    public void setGudingdianhuashu(String gudingdianhuashu) {
        this.gudingdianhuashu = gudingdianhuashu == null ? null : gudingdianhuashu.trim();
    }

    public String getTietaqingkuang() {
        return tietaqingkuang;
    }

    public void setTietaqingkuang(String tietaqingkuang) {
        this.tietaqingkuang = tietaqingkuang == null ? null : tietaqingkuang.trim();
    }

    public String getJiejuefangan() {
        return jiejuefangan;
    }

    public void setJiejuefangan(String jiejuefangan) {
        this.jiejuefangan = jiejuefangan == null ? null : jiejuefangan.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public String getChulijieguo() {
        return chulijieguo;
    }

    public void setChulijieguo(String chulijieguo) {
        this.chulijieguo = chulijieguo == null ? null : chulijieguo.trim();
    }
}