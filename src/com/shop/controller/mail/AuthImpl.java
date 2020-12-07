package com.shop.controller.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import sun.security.util.Password;

public class AuthImpl extends Authenticator{

   private PasswordAuthentication pass;
   
   public AuthImpl() {
      String userName = "hajin.dev302@gmail.com";
      String password = "gkwls0921!";
      
      pass = new PasswordAuthentication(userName, password);
      
      
   }
   @Override
      protected PasswordAuthentication getPasswordAuthentication() {
         return pass;
      }
}