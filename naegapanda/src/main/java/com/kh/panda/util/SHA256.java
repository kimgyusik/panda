package com.kh.panda.util;

import java.security.MessageDigest;

public class SHA256 {

	public static String getSHA256(String input) {	// 이메일 값을 해쉬반환해서 이용하겠다?
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("");
			byte[] salt = "Hello! This is salt.".getBytes();
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i<chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0");
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}

}
