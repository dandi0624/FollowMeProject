<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">
<head>
        <meta charset="utf-8" />
        <title>일정관리 | FollowMe</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        
			<!-- fullcalendar -->
     <link href="${contextPath }/assets/libs/fullcalendar/main.min.css" rel="stylesheet"/>
     <script src="${contextPath}/assets/libs/fullcalendar/fullcalendar.global.min.js"></script>
		 <script src="${contextPath}/assets/libs/fullcalendar/google-calendar.global.js"></script>
		 
		 
	   <!-- jquery CDN -->  
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     
     <!-- fullcalendar 언어 CDN -->  
     <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
     
     <!-- Bootstrap JavaScript -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

      
<style>

				  
</style>
</head>
<body>
      
	<!-- Begin page -->
        <div id="wrapper">
           <!-- sidemenu include -->
           <jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
			<div class="content-page">
               <!-- topbar include -->
               <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
               
                <div class="content" style="background-color: #F2E8DA;">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">FollowMe</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">일정관리</a></li>
                                            <li class="breadcrumb-item active">일정관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">일정관리</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-12">

                                <div class="card">
                                    <div class="card-body">
                                        <div class="row" style="display:flex; justify-content:center;">
                                            <div class="col-lg-9">
                                                <div id="calendar"></div>
                                            </div> <!-- end col -->

                                        </div>  <!-- end row -->
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->

                               <!-- 부트스트랩 modal 추가 부분 -->
															     <!-- start modal -->
															     <div class="modal fade" id="event-addmodal" tabindex="-1">
															      <div class="modal-dialog">
															          <div class="modal-content">
															              <div class="modal-header py-3 px-4 border-bottom-0 d-block">
															                  <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
															                  <h5 class="modal-title" id="modal-title">일정 추가</h5>
															              </div>
															              <div class="modal-body px-4 pb-4 pt-0">
															                  <form class="needs-validation" name="event-form" id="form-event" novalidate>
															                      <div class="row">
															                          <div class="col-12">
															                              <div class="mb-3">
															                                  <label class="form-label">일정 제목</label>
															                                  <input class="form-control" type="text" name="title" id="event-title" required />
															                              </div>
															                          </div>
															                          <div class="col-12">
															                            <div class="mb-3">
															                              <label class="form-label">일정 내용</label>
															                              <textarea class="form-control" name="content" id="event-content" style="resize: none;"></textarea>
															                          </div>
															                        </div>
															                        <div class="col-12">
															                          <div class="mb-3">
															                            <label class="form-label">시작 일자</label>
															                            <input class="form-control" type="datetime-local" name="start" id="event-start" />
															                        </div>
															                      </div>
															                      <div class="col-12">
															                        <div class="mb-3">
															                          <label class="form-label">종료 일자</label>
															                          <input class="form-control" type="datetime-local" name="end" id="event-end" />
															                      </div>
															                    </div>
															                          <div class="col-12">
															                              <div class="mb-3">
															                                  <label class="form-label">카테고리</label>
															                                  <select class="form-select" name="category" id="event-category" required>
															                                      <option value="red" selected>직원</option>
															                                      <option value="blue">부서</option>
															                                      <option value="purple">회사</option>
															                                  </select>
															                              </div>
															                          </div>
															                      </div>
															                      <div class="row mt-2">
															                          <div class="col-md-12 col-8 text-end">
															                              <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">Close</button>
															                              <button type="button" class="btn" style="background-color: #FFBE98; color: white;" id="btn-save-event">Save</button>
															                          </div>
															                      </div>
															                  </form>
															              </div>
															          </div> <!-- end modal-content-->
															      </div> <!-- end modal dialog-->
															  </div>
															  <!-- end modal-->
															    <!-- 부트스트랩 modal 수정 부분 -->
															     <!-- start modal -->
															     <div class="modal fade" id="event-modifymodal" tabindex="-1">
															      <div class="modal-dialog">
															          <div class="modal-content">
															              <div class="modal-header py-3 px-4 border-bottom-0 d-block">
															                  <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
															                  <h5 class="modal-title" id="modal-title">일정 수정</h5>
															              </div>
															              <div class="modal-body px-4 pb-4 pt-0">
															                  <form class="needs-validation" name="event-form" id="form-event" novalidate>
															                      <div class="row">
															                          <div class="col-12">
															                              <div class="mb-3">
															                                  <label class="form-label">일정 제목</label>
															                                  <input class="form-control" type="text" name="title" id="event-title" required />
															                              </div>
															                          </div>
															                          <div class="col-12">
															                            <div class="mb-3">
															                              <label class="form-label">일정 내용</label>
															                              <textarea class="form-control" name="content" id="event-content" style="resize: none;"></textarea>
															                          </div>
															                        </div>
															                        <div class="col-12">
															                          <div class="mb-3">
															                            <label class="form-label">시작 일자</label>
															                            <input class="form-control" type="datetime-local" name="start" id="event-start" />
															                        </div>
															                      </div>
															                      <div class="col-12">
															                        <div class="mb-3">
															                          <label class="form-label">종료 일자</label>
															                          <input class="form-control" type="datetime-local" name="end" id="event-end" />
															                      </div>
															                    </div>
															                          <div class="col-12">
															                              <div class="mb-3">
															                                  <label class="form-label">카테고리</label>
															                                  <select class="form-select" name="category" id="event-category" required>
															                                      <option value="red" selected>직원</option>
															                                      <option value="blue">부서</option>
															                                      <option value="purple">회사</option>
															                                  </select>
															                              </div>
															                          </div>
															                      </div>
															                      <div class="row mt-2">
															                          <div class="col-md-12 col-8 text-end">
															                              <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">Close</button>
															                              <button type="button" class="btn" style="background-color: #FFBE98; color: white;" id="btn-save-event">Save</button>
															                          </div>
															                      </div>
															                  </form>
															              </div>
															          </div> <!-- end modal-content-->
															      </div> <!-- end modal dialog-->
															  </div>
															  <!-- end modal-->
                                
                            </div><!-- end col-12 -->
                            
                        </div> <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->
            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div><!-- END wrapper -->
        

        <!-- Theme Settings -->
        <div class="offcanvas offcanvas-end right-bar" tabindex="-1" id="theme-settings-offcanvas">
            <div class="d-flex align-items-center w-100 p-0 offcanvas-header">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-bordered nav-justified w-100" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#chat-tab" role="tab">
                            <i class="mdi mdi-message-text d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#tasks-tab" role="tab">
                            <i class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2 active" data-bs-toggle="tab" href="#settings-tab" role="tab">
                            <i class="mdi mdi-cog-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="offcanvas-body p-3 h-100" data-simplebar>
                <!-- Tab panes -->
                <div class="tab-content pt-0">
                    <div class="tab-pane" id="chat-tab" role="tabpanel">

                        <form class="search-bar">
                            <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="mdi mdi-magnify"></span>
                            </div>
                        </form>

                        <h6 class="fw-medium mt-2 text-uppercase">Group Chats</h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
                                <span class="mb-0 mt-1">App Development</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
                                <span class="mb-0 mt-1">Office Work</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
                                <span class="mb-0 mt-1">Personal Group</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1"></i>
                                <span class="mb-0 mt-1">Freelance</span>
                            </a>
                        </div>

                        <h6 class="fw-medium mt-3 text-uppercase">Favourites <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To an English person, it will seem like simplified</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status busy"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To achieve this, it would be necessary.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium mt-3 text-uppercase">Other Chats <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="pb-4">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">Everyone realizes why a new common language.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The languages only differ in their grammar.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">If several languages coalesce the grammar of the resulting.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status busy"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The new common language will be more simple.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Hayley East</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">One could refuse to pay expensive translators.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <div class="text-center mt-3">
                                <a href="javascript:void(0);" class="btn btn-sm btn-white">
                                    <i class="mdi mdi-spin mdi-loading me-2"></i>
                                    Load more
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane" id="tasks-tab" role="tabpanel">
                        <h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
                        <div class="px-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">App Development<span class="float-end">75%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Database Repair<span class="float-end">37%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Backup Create<span class="float-end">52%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 52%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Sales Reporting<span class="float-end">12%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Redesign Website<span class="float-end">67%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">New Admin Design<span class="float-end">84%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 84%" aria-valuenow="84" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <div class="p-3 mt-2 d-grid">
                            <a href="javascript: void(0);" class="btn btn-success waves-effect waves-light">Create Task</a>
                        </div>

                    </div>

                    <div class="tab-pane active" id="settings-tab" role="tabpanel">

                        <div class="mt-n3">
                            <h6 class="fw-medium py-2 px-3 font-13 text-uppercase bg-light mx-n3 mt-n3 mb-3">
                                <span class="d-block py-1">Theme Settings</span>
                            </h6>
                        </div>

                        <div class="alert alert-warning" role="alert">
                            <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h5>

                        <div class="colorscheme-cardradio">
                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-light" value="light">
                                    <label class="form-check-label" for="layout-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-dark" value="dark">
                                    <label class="form-check-label" for="layout-color-dark">Dark</label>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Content Width</h5>
                        <div class="d-flex flex-column gap-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-layout-width" id="layout-width-default" value="default">
                                <label class="form-check-label" for="layout-width-default">Fluid (Default)</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-layout-width" id="layout-width-boxed" value="boxed">
                                <label class="form-check-label" for="layout-width-boxed">Boxed</label>
                            </div>
                        </div>

                        <div id="layout-mode">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Layout Mode</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-default" value="default">
                                    <label class="form-check-label" for="layout-mode-default">Default</label>
                                </div>


                                <div id="layout-detached">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-detached" value="detached">
                                        <label class="form-check-label" for="layout-mode-detached">Detached</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar Color</h5>

                        <div class="d-flex flex-column gap-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-light" value="light">
                                <label class="form-check-label" for="topbar-color-light">Light</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                <label class="form-check-label" for="topbar-color-dark">Dark</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-brand" value="brand">
                                <label class="form-check-label" for="topbar-color-brand">Brand</label>
                            </div>
                        </div>

                        <div>
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Color</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-light" value="light">
                                    <label class="form-check-label" for="leftbar-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                    <label class="form-check-label" for="leftbar-color-dark">Dark</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-brand" value="brand">
                                    <label class="form-check-label" for="leftbar-color-brand">Brand</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-gradient" value="gradient">
                                    <label class="form-check-label" for="leftbar-color-gradient">Gradient</label>
                                </div>
                            </div>
                        </div>

                        <div id="menu-icon-color">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Color</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-light" value="light">
                                    <label class="form-check-label" for="twocolumn-menu-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-dark" value="dark">
                                    <label class="form-check-label" for="twocolumn-menu-color-dark">Dark</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-brand" value="brand">
                                    <label class="form-check-label" for="twocolumn-menu-color-brand">Brand</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-gradient" value="gradient">
                                    <label class="form-check-label" for="twocolumn-menu-color-gradient">Gradient</label>
                                </div>
                            </div>
                        </div>

                        <div>
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Tone</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-icon" id="menu-icon-default" value="default">
                                    <label class="form-check-label" for="menu-icon-default">Default</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-icon" id="menu-icon-twotone" value="twotones">
                                    <label class="form-check-label" for="menu-icon-twotone">Twotone</label>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-size">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar Size</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-default" value="default">
                                    <label class="form-check-label" for="leftbar-size-default">Default</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-compact" value="compact">
                                    <label class="form-check-label" for="leftbar-size-compact">Compact (Medium Width)</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-small" value="condensed">
                                    <label class="form-check-label" for="leftbar-size-small">Condensed (Icon View)</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-full" value="full">
                                    <label class="form-check-label" for="leftbar-size-full">Full Layout</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-fullscreen" value="fullscreen">
                                    <label class="form-check-label" for="leftbar-size-fullscreen">Fullscreen Layout</label>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-user">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User Info</h5>

                            <div class="form-check form-switch">
                                <input type="checkbox" class="form-check-input" name="data-sidebar-user" id="sidebaruser-check">
                                <label class="form-check-label" for="sidebaruser-check">Enable</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="offcanvas-footer border-top py-2 px-2 text-center">
                <div class="d-flex gap-2">
                    <button type="button" class="btn btn-light w-50" id="reset-layout">Reset</button>
                    <a href="https://1.envato.market/uboldadmin" class="btn btn-danger w-50" target="_blank"><i class="mdi mdi-basket me-1"></i> Buy</a>
                </div>
            </div>
        </div>
        
        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>

        <!-- plugin js -->
        <script src="${ contextPath }/assets/libs/moment/min/moment.min.js"></script>
        
       <script>
		       document.addEventListener('DOMContentLoaded', function () {
		           $(function () { // 일정 리스트 조회
		               var request = $.ajax({
		                   url: "/follow/calendar/calendar.do", 
		                   method: "GET",
		                   dataType: "json"
		               });
		
		               request.done(function (data) {
		                   console.log(data); 
		                   const targetDiv = document.getElementById('calendar');
		                   const holidaySource = {
		                       googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
		                       backgroundColor: 'red'  // rgb code 대체 가능
		                   }
		
		                   // event 함수 정의
		                   const dateClickEvent = (info) => { // clickevent => 공휴일버튼 클릭, dateclick => 달력 날짜클릭
		                       // todo 
		                       const selectedDate = new Date(info.dateStr); // ex 05/07 
		                       info.backgroundColor='red';
		                       // 일요일 체크
		                       if (selectedDate.getDay() === 0) { // 일요일 0 
		                           alert('일요일');
		                           return;
		                       }
		
		                       // 토요일 체크
		                       if (selectedDate.getDay() === 6) { // 토요일 6
		                           alert('토요일');
		                           return;
		                       }
		
		                       // 공휴일 체크
		                       const isHoliday = holidayList.includes(selectedDate.getTime()); // 페이지 로드시 배열안에 있는 유닉스코드면 공휴일로 지정
		                       if (isHoliday ===  true) {
		                           alert('공휴일');
		                           return;
		                       } 
		                   }
		
		                   const eventClickEvent = (info) => { // fucntion(info)
		                	   
		                	   	$("#event-modifymodal").modal("show");
		                       // todo 
		                       // alert(`선택하신 날은 ${info.event.title} 입니다`);
		                	   /* if(info.backgroundColor === red){
		                           // 클릭한 박스가 공휴일이면(backgroundColor = red)
		                         }else{
		                           // 클릭한 박스가 공휴일이아닌 등록되어있는 일정이면 (backgroundColor = #FFBE98)
		                         }
		                         $("#event-modal").modal("show"); // 공휴일이아닌 작성되어있는 일정일시 title=> 일정수정하기 ( 기존 데이터 보여지는 모달 ) */
		                   }
		
		
		                   // 캘린더 설정
		                   const calendar = new FullCalendar.Calendar(targetDiv, {
		                       slotDuration: "00:15:00",
		                       slotMinTime: "08:00:00",
		                       slotMaxTime: "19:00:00",
		                       themeSystem: "bootstrap",
		                       customButtons:{
		                       PlusButton:{
		                         text:"일정 추가하기",
		                         click : function(){
		                               //부트스트랩 모달 열기
		                               $("#event-addmodal").modal("show");              
		                         }
		                       },
		                       SaveButton:{ // 생성된 이벤트 DB에 저장
		                         text:"저장하기",
		                         click: async function () {
		                           if (confirm("저장하시겠습니까?")) {
		                             //지금까지 생성된 모든 이벤트 저장하기
		                             var allEvent = calendar.getEvents();
		                             console.log("모든 이벤트들", allEvent);
		                             //이벤트 저장하기
		                             const saveEvent = await axios({ // ajax로 변경
		                               method: "GEt",
		                               url: "/calendarAd.do",
		                               data: allEvent,
		                             });
		                           }
		                         },
		                       }
		                     },
		                       bootstrapFontAwesome: false,
		                       buttonText: {
		                           today: "오늘",
		                           month: "월별",
		                           week: "주간",
		                           day: "일별",
		                           list: "오늘의 일정",
		                           prev: "이전",
		                           next: "다음"
		                       },
		                       initialView: "dayGridMonth", // 초기 로드 될때 보이는 캘린더 화면 (기본설정 : 달)
		                       titleFormat: function (date) { // title부문 한글로 Ex) 2024년 5월
		                         year = date.date.year;
		                         month = date.date.month + 1;
		
		                         return year + "년 " + month + "월";
		                       },
		                       handleWindowResize: true,
		                       headerToolbar: {
		                           left: "prev,next today,PlusButton,SaveButton",
		                           center: "title",
		                           right: "dayGridMonth,timeGridWeek,timeGridDay"
		                       },
		                       eventSources: [holidaySource], // 공휴일 추가
		                       //locale:'ko', 한국어 설정
		                       editable: false,
		                       droppable: false,
		                       selectable: true,
		                       events:data, // DB에서 data로 넘겨주는부분
		                       dateClick: function(eventInfo) {     // 날짜 선택 이벤트
		                           // info data 확인
		                           // console.log(eventInfo);
		                           console.log(eventInfo);
		                           dateClickEvent(eventInfo);
		                       },
		                       eventClick: function(eventInfo) {    // 일정 선택 이벤트
		                           // 구글 캘린더로 자동이동을 막음
		                           eventInfo.jsEvent.preventDefault();      
		
		                           // info data 확인
		                           // console.log(eventInfo);
		                           eventClickEvent(eventInfo);
		                       },
		                       googleCalendarApiKey: 'AIzaSyC0QldKNU6DxP9twtldrmsnfJPimNvzRXo'
		                   });
		                   //모달창 이벤트 화면에 생성
		                     $("#btn-save-event").on("click", function () {
		                           var eventData = {
		                             title: $("#event-title").val(),
		                             content: $("#event-content").val(),
		                             start: $("#event-start").val(),
		                             end: $("#event-end").val(),
		                             category: $("#event-category").val(),
		                           };
		                           //빈값입력시 오류
		                           if (
		                             eventData.title == "" ||
		                             eventData.start == "" ||
		                             eventData.end == ""
		                           ) {
		                             alert("입력하지 않은 값이 있습니다.");
		
		                             //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
		                           } else if ($("#start").val() > $("#end").val()) {
		                             alert("시간을 잘못입력 하셨습니다.");
		                           } else { // 이벤트 추가
		                        	   $.ajax({
		                                   url: "/follow/calendar/calendarInsert.do", // 여기에 서버 엔드포인트 URL을 입력하세요.
		                                   type: "POST",
		                                   contentType: "application/json; charset=utf-8",
		                                   data: JSON.stringify(eventData),
		                                   dataType: "json",
		                                   success: function (result) {
		                                	  	 console.log(result)
		                                       // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		                                       console.log('일정이 성공적으로 추가되었습니다.');
		                                       alert('일정이 성공적으로 추가되었습니다.');
		                                       calendar.addEvent(eventData);
		                                       $("#event-modal").modal("hide");
		                                       $("#event-title").val("");
		                                       $("#event-content").val("");
		                                       $("#event-start").val("");
		                                       $("#event-end").val("");
		                                       $("#event-category").val("");
		                                   },
		                                   error: function (xhr, status, error) {
		                                       // 서버 요청 중 오류가 발생했을 때 실행할 코드
		                                       console.error('일정 추가 중 오류가 발생했습니다:', error);
		                                       alert('일정을 추가하는 도중 오류가 발생했습니다.');
		                                   }
		                               });
		                             
		                           }
		                         });
		                   
		                   calendar.render();
		               });
		
		           });
		
		       });
       
       </script>
        
	

</body>
</html>