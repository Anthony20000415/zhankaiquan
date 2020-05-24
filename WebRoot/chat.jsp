<%@ page language="java"  import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ page import="po.Customer" %>
  <%@ page import="po.Zzhk" %>
    <%@ page import="po.Chat" %>
  <%@ page import="dao.CustomerDao" %>
  <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Vi</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/chatbox.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
   <style type="text/css">
   
  #mydiv{
	border:3px;
 	
 	left:10%;
	display: inline-block;
	width: 600px;
	
	border-radius: 50px;
	padding: 60px;
	margin:10px;
	
  }
        #all_light { /*����������ҳ��*/
            opacity: 0.8; /*͸����*/
            position: absolute;
            top: 0;
            left: 0; /*��λ*/
            display: none; /*����*/
            
        }
        #contes { /* �����ҳ��*/
            width: 320px; /*���*/
            height: 500px; /*�߶�*/
            background:#abf;/*����ɫ*/
            display: none; /*����*/
            z-index: 2; /*����*/
            position: absolute;
            border-radius: 30px;
            top: 60px;
            left: 1130px; /* ��λ*/
        }
        input{
            margin-bottom: 10px;
        }
</style>
</head>

<body>
<%
ArrayList stus1=(ArrayList)request.getSession().getAttribute("list2");
ArrayList stus2=(ArrayList)request.getSession().getAttribute("list3");
ArrayList chatlist=(ArrayList)request.getSession().getAttribute("chatlist");
String friendaccount=(String)request.getSession().getAttribute("friendaccount");
String friendname=(String)request.getSession().getAttribute("friendname");
  Customer cus=(Customer)request.getSession().getAttribute("cus1");
  CustomerDao dao=new CustomerDao();
  Chat chat=new Chat();
 
%>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    
     <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
          <a class="navbar-brand brand-logo"><img src="./images/logo.svg" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini"><img src="./images/logo-mini.svg" alt="logo"/></a>
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-sort-variant"></span>
          </button>
        </div>  
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <ul class="navbar-nav mr-lg-4 w-100">
          <li class="nav-item nav-search d-none d-lg-block w-100">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="mdi mdi-magnify"></i>
                </span>
              </div>
              <input type="text" class="form-control" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="mdi mdi-message-text mx-0"></i>
              <span class="count"></span>
            </a>
             <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="images/faces/face2.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">Tim Cook
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    New product launch
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="images/faces/face3.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"> Johnson
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    Upcoming board meeting
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown mr-4">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="mdi mdi-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-success">
                    <i class="mdi mdi-information mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-warning">
                    <i class="mdi mdi-settings mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-info">
                    <i class="mdi mdi-account-box mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
               <img src="./images/faces/boy.jpg" alt="profile"/>
              <span class="nav-profile-name"><%=cus.getCname() %></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
             <a class="dropdown-item"  onclick="add()">
                <i class="mdi mdi-settings text-primary"></i>
                	����
              </a>
             <a class="dropdown-item" onclick="document.getElementById('form1').submit();">
                <i class="mdi mdi-logout text-primary" ></i>
             	�ǳ� <form  action="logout.do" method="post" id="form1">
��������		</form>          
			 </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="menu.jsp">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">��ҳ</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="wdzh.jsp">
              <i class="mdi mdi-account menu-icon"></i>
              <span class="menu-title">�˻�</span>
            </a>
           
          </li>
          <li class="nav-item">
            <a class="nav-link" href="cunkuan.jsp">
              <i class="mdi mdi-chart-pie menu-icon"></i>
              <span class="menu-title">���</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="qukuan.jsp">
              <i class="mdi mdi-chart-pie menu-icon"></i>
              <span class="menu-title">ȡ��</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="zzhk.jsp">
              <i class="mdi mdi-file-document-box-outline menu-icon"></i>
              <span class="menu-title">ת�˻��</span>
            </a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="tzlc.jsp">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">Ͷ�����</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ejf.jsp">
              <i class="mdi mdi-emoticon menu-icon"></i>
              <span class="menu-title">e�ɷ�</span>
            </a>
          </li>
          
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
              <div class="card" id="mydiv" width="200">
              <div id="mydiv2">
          
              <%

				for(int i=0;i<chatlist.size();i++){
					chat=(Chat)chatlist.get(i);
					
              %>
             
<c:choose>
   <c:when test="<%=!cus.getAccount().equals(chat.getSenderaccount()) %>"> 
<div class="chat-sender">
  <div><img src="./images/faces/girl.jpg"></div>
  <div><%=friendname %></div>
  <div>
    <div class="chat-left_triangle"></div>
    <span> <%=chat.getText() %></span>
  </div>
</div>     
   </c:when>
   <c:otherwise>
     
<!-- Right -->
<div class="chat-receiver">
  <div><img src="./images/faces/boy.jpg"></div>
  <div><%=cus.getCname() %></div>
  <div>
    <div class="chat-right_triangle"></div>
    <span> <%=chat.getText() %></span>
  </div>
</div>
   </c:otherwise>
</c:choose>
 

	
	<%
				}
              %>
<form action="sendmessage.do" method="post" id="message">
<div class="form-group" >
	<div class="input-group">
	
		<input type="text" class="form-control" placeholder="������Ϣ" name="text" >
		<input type="hidden" value=<%=cus.getAccount() %> name="senderaccount">
		<input type="hidden" value=<%=friendaccount %> name="receiveraccount">
	<div class="input-group-append">
		<button class="btn btn-success btn-rounded btn-fw" type="button" onclick="document.getElementById('message').submit();">
		����
	</button>
</div>

</div>

</div>
</form>
	</div>
              </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        
        
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">2020@������� <a href="https://www.baidu.com/" target="_blank"></a></span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> make in ����С��<i class="mdi mdi-heart text-danger"></i></span>
          </div>
        </footer>
        
        
        
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
   <div id="contes" class="col-lg-12 grid-margin stretch-card" style="">
    <div style="width:300px;height:40px;">
     
        <hr>
         <html:form action="/edit" method="post">
               <div class="form-group">
		  <h4 class="card-title">�޸���Ϣ</h4>
                  <input type="hidden" class="form-control form-control-lg" id="exampleInputEmail1"  name="account" value=<%=cus.getAccount() %> >
                </div>
               ����
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" name="password" value=<%=cus.getPassword() %> pattern="[0-9]{6}" title="������6λ����">
                </div>
                �û���
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1"  name="cname" value=<%=cus.getCname() %>>
                </div>
                ����
              <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1"  name="email" value=<%=cus.getEmail() %>>
                </div>
                 <input type="hidden" class="form-control form-control-lg" id="exampleInputEmail1"  name="cbalance" value=<%=cus.getCbalance() %>>
                <div class="mt-3" >
                <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="ȷ���޸�">
                 <li class="nav-item">
            <a class="nav-link" href="menu.jsp">
             <i class="mdi mdi-logout text-primary" ></i>
              <span >ȡ��</span>
            </a>
            
          </li>
                </div>
              </html:form>
    </div>
</div>
<div id="all_light">
</div>
</body>
<script>
    function add() {
        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';
    }
  
    
</script>
  
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
    <!-- Plugin js for this page-->
    <script src="vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/chart.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
 





