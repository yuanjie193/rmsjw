package com.itdr.common;

public class ResponseCode<T> {
    //状态码
    private Integer status;
    private T date;
    private String msg;
    //多个构造函数
    private ResponseCode(T date){
        this.status = 200;
        this.date = date;
    }
    private ResponseCode(Integer status,String msg){
        this.status = status;
        this.msg =msg;
    }
    //成功获取数据的方法
    public static <T> ResponseCode toSuccess(T date){
        return new ResponseCode(date);
    }
    //失败返回信息的方法
    public  static ResponseCode toDefeated(Integer status,String msg){
        return new ResponseCode(status, msg);
    }
    public  static ResponseCode toDefeated(String msg){
        return new ResponseCode(100,msg);
    }

    @Override
    public String toString() {
        return "{" +
                "status:" + status +
                ", date:" + date +
                ", msg:'" + msg + '\'' +
                '}';
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public T getDate() {
        return date;
    }

    public void setDate(T date) {
        this.date = date;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
