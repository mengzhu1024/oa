package com.oa.listener;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.oa.member.entity.Employee;
import com.oa.utils.CollectionUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@ServerEndpoint(value = "/message", configurator=GetHttpSessionConfigurator.class)
public class WebSocketServer {

	private Employee loginer;
	
	/**
	 * 用户接入
	 * @param session 可选
	 */
	@OnOpen
	public void onOpen(Session session, EndpointConfig config){
		HttpSession httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		loginer = (Employee) httpSession.getAttribute("loginer");
		//挤掉之前登录的用户
		if(CollectionUtil.sessionMap.get(loginer.getAccount()) != null){
			CollectionUtil.sessionMap.get(loginer.getAccount()).getAsyncRemote().sendText("loginOtherPlace");
		}
		CollectionUtil.sessionMap.put(loginer.getAccount(), session);
		log.info("{} connect ws, current session count:{}", loginer.getAccount(), CollectionUtil.sessionMap.size());
	}
	
	/**
	 * 接收到来自用户的消息
	 * @param message
	 * @param session
	 */
	@OnMessage
	public void onMessage(String message, Session session){
		//接收到客户端发来的办理事务通知后给客户端发送一个处理OK的消息
		session.getAsyncRemote().sendText("handleOK");
		//客户端发来的消息是：事务办理人员|事务名称（办理流程的中间节点）或事务名称（办理流程的最后一个节点）
		String[] strs = message.split("\\|");
		if(strs.length == 2){
			//如果有办理人员，通知办理人员客户端
			Session session2 = CollectionUtil.sessionMap.get(strs[0]);
			if(session2 != null){
				session2.getAsyncRemote().sendText(strs[1]);
			}
		}
	}
	
	/**
	 * 用户断开
	 * @param session
	 */
	@OnClose
	public void onClose(Session session){
		CollectionUtil.sessionMap.remove(loginer.getAccount());
		log.info("{} remove ws，current session count:{}", loginer.getAccount(), CollectionUtil.sessionMap.size());
	}
	
	/** 
	 * 用户连接异常
	 * @param t
	 */
	@OnError
	public void onError(Throwable t){
		log.error("ws error, e:", t);
	}
}