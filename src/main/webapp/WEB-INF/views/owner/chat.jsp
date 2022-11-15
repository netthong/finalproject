
<!-- Construct the card with style you want. Here we are using card-danger -->
<!-- Then add the class direct-chat and choose the direct-chat-* contexual class -->
<!-- The contextual class should match the card, so we are using direct-chat-danger -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="card card-danger direct-chat direct-chat-danger">
  <div class="card-header">
    <h3 class="card-title">1:1 문의</h3>
    <div class="card-tools">
      <span data-toggle="tooltip" title="3 New Messages" class="badge badge-light">3</span>
      <button type="button" class="btn btn-tool" data-card-widget="collapse">
        <i class="fas fa-minus"></i>
      </button>
      <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle">
        <i class="fas fa-comments"></i>
      </button>
      <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
      </button>
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <!-- Conversations are loaded here -->
    <div class="direct-chat-messages">
      <!-- Message. Default to the left -->
      <div class="direct-chat-msg">
        <div class="direct-chat-infos clearfix">
          <span class="direct-chat-name float-left">회원</span>
          <span class="direct-chat-timestamp float-right">2022.10.15 2:00 pm</span>
        </div>
        <!-- /.direct-chat-infos -->
        <div class="direct-chat-text">
          11월 18일에 예약 가능할까요?
        </div>
        <!-- /.direct-chat-text -->
      </div>
      <br>
      <!-- /.direct-chat-msg -->
      <!-- Message to the right -->
      <div class="direct-chat-msg right">
        <div class="direct-chat-infos clearfix" style="text-align: right; ">
          <span class="direct-chat-name float-right">업주</span>
          <span class="direct-chat-timestamp float-left">2022.10.15 2:05 pm</span>
        </div>
        <!-- /.direct-chat-infos -->
        <div class="direct-chat-text" style="text-align: right; ">
         	가능합니다.
        </div>
        <!-- /.direct-chat-text -->
      </div>
        <!-- /.direct-chat-text -->
      </div>
           <br>
                <br>     <br>
                     <br>     <br>
                          <br>
                               <br>
                                    <br>
                                         <br>
                                              <br>
                                              <br>
                                              <br>
                                              <br>
  <!-- /.card-body -->
  <div class="card-footer">
    <form action="#" method="post">
      <div class="input-group">
        <input type="text" name="message" placeholder="Type Message ..." class="form-control">
        <span class="input-group-append">
          <button type="button" class="btn btn-primary">Send</button>
        </span>
      </div>
    </form>
  </div>
  <!-- /.card-footer-->
</div>
<!--/.direct-chat -->