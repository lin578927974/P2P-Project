package com.p2p.beans;

import java.math.BigDecimal;
import java.util.Date;

public class sysuser {
	private String userId;
	private String password;
	private String payPassword;
	private String roleID;
	private int userType;
	private String assAccount;
	private int isBind;
	private BigDecimal amount;
	private BigDecimal freeze;
	private int score;
	private String rcmCode;
	private String rcmUser;
	private String openID;
	private String Security;
	private String Question;
	private String answer;
	private int isLog;
	private Date loginExpire;
	private Date regTime;
	private int state;
	private String remark;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPayPassword() {
		return payPassword;
	}
	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getAssAccount() {
		return assAccount;
	}
	public void setAssAccount(String assAccount) {
		this.assAccount = assAccount;
	}
	public int getIsBind() {
		return isBind;
	}
	public void setIsBind(int isBind) {
		this.isBind = isBind;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getFreeze() {
		return freeze;
	}
	public void setFreeze(BigDecimal freeze) {
		this.freeze = freeze;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRcmCode() {
		return rcmCode;
	}
	public void setRcmCode(String rcmCode) {
		this.rcmCode = rcmCode;
	}
	public String getRcmUser() {
		return rcmUser;
	}
	public void setRcmUser(String rcmUser) {
		this.rcmUser = rcmUser;
	}
	public String getOpenID() {
		return openID;
	}
	public void setOpenID(String openID) {
		this.openID = openID;
	}
	public String getSecurity() {
		return Security;
	}
	public void setSecurity(String security) {
		Security = security;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getIsLog() {
		return isLog;
	}
	public void setIsLog(int isLog) {
		this.isLog = isLog;
	}
	public Date getLoginExpire() {
		return loginExpire;
	}
	public void setLoginExpire(Date loginExpire) {
		this.loginExpire = loginExpire;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
