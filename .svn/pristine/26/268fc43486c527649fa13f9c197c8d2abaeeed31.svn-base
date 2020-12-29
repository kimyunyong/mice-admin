package com.mice.common.encrypt;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AESGenerator {

	  private static SecretKeySpec secretKey ;
	    private static byte[] key ;
	    

	    
	    public static void setKey(String myKey) throws Exception{
	    	MessageDigest sha = null;
			try {
				key = myKey.getBytes("UTF-8");
				sha = MessageDigest.getInstance("SHA-1");
				key = sha.digest(key);
		    	key = Arrays.copyOf(key, 16); // use only first 128 bit
			    secretKey = new SecretKeySpec(key, "AES");
			    
			    
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			}
	    }


		public static String encrypt(String strToEncrypt) throws Exception
	    {
	        try
	        {
//	        	if(strToEncrypt.length() == 0)
//	        		return "";
//	        	String decrypt = decrypt(strToEncrypt);
//	        	if(decrypt == "" || strToEncrypt != decrypt)
//	        		throw new Exception();
//	        	setKey("rudwnakdltm12345");
//	            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
//	        
//	            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
//	        
//	         
//	            return Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
	        	return strToEncrypt;
	        
	        }
	        catch (Exception e)
	        {

	            throw e;
	        }
	        

	    }

	    public static String decrypt(String strToDecrypt) throws Exception
	    {
	        try
	        {
	        	if(strToDecrypt.length() == 0)
	        		return "";
	        	/*if(!strToDecrypt.endsWith("="))
	        		throw new Exception();*/
	        	setKey("rudwnakdltm12345");
	            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
	           
	            cipher.init(Cipher.DECRYPT_MODE, secretKey);
	            String res = new String(cipher.doFinal(Base64.decodeBase64(strToDecrypt)));
	            
	            if(res.length() == 0)
	            	return strToDecrypt;
	            else
	            	return res;
	            
	        }
	        catch (Exception e)
	        {
	            return strToDecrypt;
	        }
	    }


	    public static String test(String test){
	    	return test;
	    }
	    /*
	     
	    
	
	public static String encrypt(String value) throws Exception{
		
		Key secureKey = new SecretKeySpec("rudwnakdltm12345".getBytes(), "AES");
		
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secureKey);
		
		String res = javax.xml.bind.DatatypeConverter.printBase64Binary(Base64.encodeBase64(cipher.doFinal(value.getBytes())));
		
		return res;
	}
	
	public static String decrypt(String value) throws Exception{
		
		byte[] buffer = javax.xml.bind.DatatypeConverter.parseBase64Binary(value);
		Key secureKey = new SecretKeySpec("rudwnakdltm12345".getBytes(), "AES");
		
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, secureKey);
		byte[] plainText = cipher.doFinal(buffer);

		
		return plainText.toString();
	}
*/}
