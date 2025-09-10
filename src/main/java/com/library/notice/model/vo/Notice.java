package com.library.notice.model.vo;

import java.util.Date;

public class Notice {
   private int noticeNo;
   private String noticeSubject;
   private String noticeContent;
   private String noticeWriter;
   private String noticeDate;
   private int viewCount;
   
   
   
   public Notice() {
      super();
   }

   public Notice(int noticeNo, String noticeSubject, String noticeContent, String noticeWriter, String noticeDate,
         int viewCount) {
      super();
      this.noticeNo = noticeNo;
      this.noticeSubject = noticeSubject;
      this.noticeContent = noticeContent;
      this.noticeWriter = noticeWriter;
      this.noticeDate = noticeDate;
      this.viewCount = viewCount;
   }

   public int getNoticeNo() {
      return noticeNo;
   }

   public void setNoticeNo(int noticeNo) {
      this.noticeNo = noticeNo;
   }

   public String getNoticeSubject() {
      return noticeSubject;
   }

   public void setNoticeSubject(String noticeSubject) {
      this.noticeSubject = noticeSubject;
   }

   public String getNoticeContent() {
      return noticeContent;
   }

   public void setNoticeContent(String noticeContent) {
      this.noticeContent = noticeContent;
   }

   public String getNoticeWriter() {
      return noticeWriter;
   }

   public void setNoticeWriter(String noticeWriter) {
      this.noticeWriter = noticeWriter;
   }

   public String getNoticeDate() {
      return noticeDate;
   }

   public void setNoticeDate(String noticeDate) {
      this.noticeDate = noticeDate;
   }

   public int getViewCount() {
      return viewCount;
   }

   public void setViewCount(int viewCount) {
      this.viewCount = viewCount;
   }
   
	// 날짜를 문자열로 반환 (JSP에서 사용)
//    public String getFormattedDate() {
//        if (noticeDate != null) {
//            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy.MM.dd");
//            return sdf.format(noticeDate);
//        }
//        return "";
//    }
}
