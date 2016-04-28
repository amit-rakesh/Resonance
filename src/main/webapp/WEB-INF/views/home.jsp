<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <meta content="IE=edge" http-equiv="X-UA-Compatible">
                    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">

                    <title>Resonance</title>



                    

                    <link rel="stylesheet" href="<c:url value='/resources/css/lay1.css ' />">
                    <link rel="stylesheet" href="<c:url value='/resources/css/lay2.css ' />">
                    <link rel="stylesheet" href="<c:url value='/resources/css/lay3.css ' />">
                    <link rel="stylesheet" href="<c:url value='/resources/css/lay4.css ' />">
                    <link rel="stylesheet" href="<c:url value='/resources/css/lay5.css ' />">
                </head>

                <body class="index">
                    <div class="opl"></div>
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="container">
                            <!-- <img width="170px" src="/images/logo.png" />-->
                            <ul class="navbar-right ix-menu nav navbar-nav"> <a class="fancy" href="<c:url value="/signup" />">Sign Up</a>

                                <a class="fancy" href="<c:url value="/login" />">Sign In</a>
                                <a class="fancy" href="#">Contact Us</a>
                            </ul>
                        </div>
                    </nav>
                    <div class="content">
                        <div class="jumbotron" id="jumbotron">
                            <div class="bg"></div>
                            <div class="container text-center banner">
                                <h1><!--<i class="fa fa-heart-o"></i>-->Resonance</h1>
                                <p>Music For Everyone</p>
                            </div>
                        </div>
                        <div class="container">
                            <div class="section-title">
                                <div class="title">
                                    <span>Our Features</span>
                                </div>
                            </div>
                            <div class="row">
                                <a href="#" id="song-upload">
                                    <div class="col-sm-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Upload Song </h3></div>
                                            <div class="panel-body"></div>
                                            <div class="panel-footer">
                                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" id="recommend-song">
                                    <div class="col-sm-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Song Recommendation</h3></div>
                                            <div class="panel-body"></div>
                                            <div class="panel-footer">
                                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" id="search">
                                    <div class="col-sm-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Search</h3></div>
                                            <div class="panel-body"></div>
                                            <div class="panel-footer">
                                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="row">
                                <a href="#" id="artist-blog">
                                    <div class="col-sm-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Artist's Blog</h3></div>
                                            <div class="panel-body"></div>
                                            <div class="panel-footer">
                                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" id="Following">
                                    <div class="col-sm-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Followers-Following</h3></div>
                                            <div class="panel-body"></div>
                                            <div class="panel-footer">
                                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" id="book-concert">
                                    <div class="col-sm-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Book Concerts</h3></div>
                                            <div class="panel-body"></div>
                                            <div class="panel-footer">
                                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                                </span>
                                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!--   <div class="row">
                <a href="#" id="ind9.github.io">
                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">ind9.github.io</h3></div>
                            <div class="panel-body"></div>
                            <div class="panel-footer">
                                <span class="wrap">
                  <i class="fa fa-code"></i> <span class="language"></span>
                                </span>
                                <span class="wrap">
                  <i class="fa fa-star-o"></i> <span class="stars"></span>
                                </span>
                                <span class="wrap">
                  <i class="fa fa-code-fork"></i> <span class="forks"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>-->
                        </div>
                        <div class="container" id="contributors" data-is-client-side="false">
                            <div class="section-title">
                                <div class="title">
                                    <span>Contributors</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="contributor col-md-2 col-sm-4 col-xs-6">
                                    <div class="wrapper">
                                        <a href="https://github.com/harkiratsingh">
                                            <img class="contributor-image" src="<c:url value="/resources/images/harkirat.jpg" />" >
                                        </a>
                                        <p><span>180</span></p>
                                    </div>
                                </div>
                                <div class="contributor col-md-2 col-sm-4 col-xs-6">
                                    <div class="wrapper">
                                        <a href="https://github.com/surbhirautji">
                                            <img class="contributor-image" src="<c:url value="/resources/images/surbhi.jpg" />" >
                                        </a>
                                        <p><span>79</span></p>
                                    </div>
                                </div>
                                <div class="contributor col-md-2 col-sm-4 col-xs-6">
                                    <div class="wrapper">
                                        <a href="https://github.com/amit-rakesh">
                                            <img class="contributor-image" src="<c:url value="/resources/images/amit.jpg" />" >
                                            
                                          
                                        </a>
                                        <p><span>68</span></p>
                                    </div>
                                </div>
                                <div class="contributor col-md-2 col-sm-4 col-xs-6">
                                    <div class="wrapper">
                                        <a href="https://github.com/rajashegiste">
                                            <img class="contributor-image" src="<c:url value="/resources/images/rajas.jpg" />" >
                                        </a>
                                        <p><span>36</span></p>
                                    </div>
                                </div>


                            </div>
                            <div class="row">

                            </div>
                            <div class="row">




                            </div>
                        </div>
                    </div>

                    <footer class="footer navbar-inverse">
                        <div class="container text-center">
                            <p class="navbar-text">Made
                                <!--<i class="fa fa-heart"></i>-->by and for Music Lovers</p>
                        </div>
                        <div class="copyright">
                            &copy; 2016 Resonance
                        </div>



                    </footer>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
                    <script src="/javascripts/all.js"></script>
                </body>

                </html>