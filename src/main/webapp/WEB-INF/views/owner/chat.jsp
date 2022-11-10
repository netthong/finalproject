
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
    <h3 class="card-title">Direct Chat</h3>
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
          <span class="direct-chat-name float-left">Alexander Pierce</span>
          <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
        </div>
        <!-- /.direct-chat-infos -->
        <img class="direct-chat-img" src="/docs/3.2/assets/img/user1-128x128.jpg" alt="message user image">
        <!-- /.direct-chat-img -->
        <div class="direct-chat-text">
          Is this template really for free? That's unbelievable!
        </div>
        <!-- /.direct-chat-text -->
      </div>
      <!-- /.direct-chat-msg -->
      <!-- Message to the right -->
      <div class="direct-chat-msg right">
        <div class="direct-chat-infos clearfix">
          <span class="direct-chat-name float-right">Sarah Bullock</span>
          <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
        </div>
        <!-- /.direct-chat-infos -->
        <img class="direct-chat-img" src="/docs/3.2/assets/img/user3-128x128.jpg" alt="message user image">
        <!-- /.direct-chat-img -->
        <div class="direct-chat-text">
          You better believe it!
        </div>
        <!-- /.direct-chat-text -->
      </div>
      <!-- /.direct-chat-msg -->
      <!-- Message. Default to the left -->
      <div class="direct-chat-msg">
        <div class="direct-chat-infos clearfix">
          <span class="direct-chat-name float-left">Alexander Pierce</span>
          <span class="direct-chat-timestamp float-right">23 Jan 5:37 pm</span>
        </div>
        <!-- /.direct-chat-infos -->
        <img class="direct-chat-img" src="/docs/3.2/assets/img/user1-128x128.jpg" alt="message user image">
        <!-- /.direct-chat-img -->
        <div class="direct-chat-text">
          Working with AdminLTE on a great new app! Wanna join?
        </div>
        <!-- /.direct-chat-text -->
      </div>
      <!-- /.direct-chat-msg -->
      <!-- Message to the right -->
      <div class="direct-chat-msg right">
        <div class="direct-chat-infos clearfix">
          <span class="direct-chat-name float-right">Sarah Bullock</span>
          <span class="direct-chat-timestamp float-left">23 Jan 6:10 pm</span>
        </div>
        <!-- /.direct-chat-infos -->
        <img class="direct-chat-img" src="/docs/3.2/assets/img/user3-128x128.jpg" alt="message user image">
        <!-- /.direct-chat-img -->
        <div class="direct-chat-text">
          I would love to.
        </div>
        <!-- /.direct-chat-text -->
      </div>
      <!-- /.direct-chat-msg -->
    </div>
    <!--/.direct-chat-messages-->
    <!-- Contacts are loaded here -->
    <div class="direct-chat-contacts">
      <ul class="contacts-list">
        <li>
          <a href="#">
            <img class="contacts-list-img" src="/docs/3.2/assets/img/user1-128x128.jpg">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                Count Dracula
                <small class="contacts-list-date float-right">2/28/2015</small>
              </span>
              <span class="contacts-list-msg">How have you been? I was...</span>
            </div>
            <!-- /.contacts-list-info -->
          </a>
        </li>
        <!-- End Contact Item -->
        <li>
          <a href="#">
            <img class="contacts-list-img" src="/docs/3.2/assets/img/user7-128x128.jpg">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                Sarah Doe
                <small class="contacts-list-date float-right">2/23/2015</small>
              </span>
              <span class="contacts-list-msg">I will be waiting for...</span>
            </div>
            <!-- /.contacts-list-info -->
          </a>
        </li>
        <!-- End Contact Item -->
        <li>
          <a href="#">
            <img class="contacts-list-img" src="/docs/3.2/assets/img/user3-128x128.jpg">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                Nadia Jolie
                <small class="contacts-list-date float-right">2/20/2015</small>
              </span>
              <span class="contacts-list-msg">I'll call you back at...</span>
            </div>
            <!-- /.contacts-list-info -->
          </a>
        </li>
        <!-- End Contact Item -->
        <li>
          <a href="#">
            <img class="contacts-list-img" src="/docs/3.2/assets/img/user5-128x128.jpg">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                Nora S. Vans
                <small class="contacts-list-date float-right">2/10/2015</small>
              </span>
              <span class="contacts-list-msg">Where is your new...</span>
            </div>
            <!-- /.contacts-list-info -->
          </a>
        </li>
        <!-- End Contact Item -->
        <li>
          <a href="#">
            <img class="contacts-list-img" src="/docs/3.2/assets/img/user6-128x128.jpg">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                John K.
                <small class="contacts-list-date float-right">1/27/2015</small>
              </span>
              <span class="contacts-list-msg">Can I take a look at...</span>
            </div>
            <!-- /.contacts-list-info -->
          </a>
        </li>
        <!-- End Contact Item -->
        <li>
          <a href="#">
            <img class="contacts-list-img" src="/docs/3.2/assets/img/user8-128x128.jpg">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                Kenneth M.
                <small class="contacts-list-date float-right">1/4/2015</small>
              </span>
              <span class="contacts-list-msg">Never mind I found...</span>
            </div>
            <!-- /.contacts-list-info -->
          </a>
        </li>
        <!-- End Contact Item -->
      </ul>
      <!-- /.contacts-list -->
    </div>
    <!-- /.direct-chat-pane -->
  </div>
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