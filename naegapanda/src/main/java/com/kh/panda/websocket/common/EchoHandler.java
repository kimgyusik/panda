package com.kh.panda.websocket.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.panda.member.model.vo.Member;


public class EchoHandler extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    

    private static Map<String, ArrayList<WebSocketSession>> chatList = new HashMap<>();
    private static List<WebSocketSession> mList = new ArrayList<>();

    /**

     * 클라이언트 연결 이후에 실행되는 메소드

     */

	
	/*
	 * @Override public void afterConnectionEstablished(WebSocketSession session)
	 * throws Exception {
	 * 
	 * mList.add(session);
	 * 
	 * logger.info("{} 연결됨", session.getId()); }
	 */
	 
    /**

     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드

     */

    @Override

    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//       String username = (String)session.getUserProperties().get("username");
       System.out.println(session.getAttributes()); //map형식
       String t = message.getPayload().split(":")[0];
       String pId = message.getPayload().split(":")[1];
       System.out.println(session.getAttributes().get("loginUser")); //map형식 (request 는 안된당)
       ArrayList<WebSocketSession> list;
       if(t.equals("소켓오픈")) {
	       if(!chatList.containsKey(pId)) {
	    	   list = new ArrayList<>();
	       }else  {
	    	   list = chatList.get(pId);
	       }
	       list.add(session);
	       chatList.put(pId, list);
       } else if(t.equals("메세지")) {
    	   pId = message.getPayload().split(":")[1];
    	   System.out.println(pId);
    	    mList = chatList.get(pId);
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			String user = ((Member) (session.getAttributes().get("loginUser"))).getName(); // getId();

			// for(WebSocketSession sess : sessionList){
			for (WebSocketSession sess : mList) {
				/*
				 * for (int i = 0; i > 0; i++) { sess.sendMessage(new TextMessage("- - - - " +
				 * user + "님이 입장하셨습니다. - - - -"));// 아이디 : 메세지 내용 출력 }
				 */
				if (session.getAttributes().get("loginUser") == sess.getAttributes().get("loginUser")) { // 보낸사람
					if (session.getId().equals(sess.getId())) {
						sess.sendMessage(new TextMessage("나:" + message.getPayload().substring(message.getPayload().indexOf(":", 5)+1)));
					} else {
						sess.sendMessage(new TextMessage("상대방:" + message.getPayload().substring(message.getPayload().indexOf(":", 5)+1)));
					}
				}
			}

		}

	}

    /**

     * 클라이언트가 연결을 끊었을 때 실행되는 메소드

     */

    @Override

    public void afterConnectionClosed(WebSocketSession session,

            CloseStatus status) throws Exception {
        mList.remove(session);
        
        logger.info("{} 연결 끊김", session.getId());

    }

}
