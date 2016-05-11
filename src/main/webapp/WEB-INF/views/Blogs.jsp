
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>

<title>Blog Resonance</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="<c:url value='css/bootstrap.min.css' />">
<link rel="stylesheet"
	href="<c:url value='//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css'/>">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

</head>
<body>
	<!--<header class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="/" class="navbar-brand"></a>
    </div>
    <nav class="collapse navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li>
          <a href="#"></a>
        </li>
        <li>
          <a href="#"></a>
        </li>
        <li>
          <a href="#"></a>
        </li>
        <li>
          <a href="#"></a>
        </li>
      </ul>
      <ul class="nav navbar-right navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
          <ul class="dropdown-menu" style="padding:12px;">
            <form class="form-inline">
            	<div class="input-group">
                  <input type="text" class="form-control" placeholder="Search for...">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button">Go!</button>
                  </span>
            	</div>
            </form>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>-->
	<form:form method="post" action="/resonance/blog/create"
		modelAttribute="blog" class="form-signin" role="form" id="blog">

		<div id="masthead">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1>Stories</h1>
						<p class="lead">Write something about your music....</p>
					</div>

					<div class="form-group">

						<form:input class="form-control sizetitle" type="text"
							path="blogTitle" id="title" placeholder="Blog Title..." />
					</div>
					<div class="form-group">
						<form:textarea rows="8" path="blogContent" id="blogContent"
							class="form-control formSize"
							placeholder="Share Your Story Here...." />
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit">Create
								Blog</button>
						</span>

					</div>

				</div>
			</div>
			<!-- /cont -->


		</div>
		

		<br />
		<br />


		<div class="container">
			<div class="row">
			
				<div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<!--/stories-->
								<c:forEach items="${blog}" var="blog">
								<div class="row">
								
									<div class="col-md-10 col-sm-9">
									
										<h3>123<c:out value="${blog.blogTitle}" /></h3>
										<div class="row">
											<div class="col-xs-9">
												<p>123<c:out value="${blog.blogContent}"></c:out></p>
												
											</div>
											<div class="col-xs-3"></div>
										</div>
										<br> 
										
									</div>
									
								</div>
								</c:forEach>
								<hr>
								
								
							</div>
						</div>
					
				</div>
				
			</div>
		</div>


	</form:form>

	<!-- script references -->
	<script
		src="<c:url value='//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js'/>"></script>
	<script src="<c:url value='js/bootstrap.min.js'/>"></script>

</body>
</html>