
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
                    <meta content="width=device-width,initial-scale=1" name="viewport">

                    <title>Resonance</title>

                    <link rel="stylesheet" href="<c:url value='/resources/css/resonance.css' />">
                    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css' />">
                    <link rel="stylesheet" href="<c:url value='http://fonts.googleapis.com/css?family=Abel ' />">
                    <link rel="stylesheet" href="<c:url value='http://fonts.googleapis.com/css?family=Lato:300,400' />">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value='HomePage1.jsp'/>">Resonance</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<c:url value='HomaPage1.html'/>">Home</a></li>
                <li class="active"><a href="<c:url value="/signup" />">Sign Up</a></li>
                <li class="active"><a href="<c:url value="/login" />">Login</a></li>
                <li class="active"><a href="<c:url value='HomaPage1.html'/>">Contact</a></li>
            </ul>
        </div>
    </nav>
    <!--End Navigation-->
    <div id="myCarousel" class="carousel slide">
        <ol class = "carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="<c:url value='/resources/images/slide1.jpg'/>">
            <div class="container active">
                <div class="carousel-caption">
                    <h1>RESONANCE</h1>
                    <p><!--Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.--></p>
                    <p><a href="#" class="btn btn-primary btn-large">Sign up today</a></p>
                </div>
            </div>
        </div>
        <div class="item">
             <img src="<c:url value='/resources/images/slide2.jpg'/>">
            <div class="container active">
                <div class="carousel-caption">
                    <h1>EXPLORE NEARBY EVENTS </h1>
                    <p><!--Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.--></p>
                    <p><a href="#" class="btn btn-primary btn-large">Sign up today</a></p>
                </div>
            </div>
        </div>
        
         <div class="item">
             <img src="<c:url value='/resources/images/slide3.jpg'/>">
            <div class="container active">
                <div class="carousel-caption">
                    <h1>NEW - MUSIC THERAPY </h1>
                    <p><!--Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.--></p>
                    <p><a href="#" class="btn btn-primary btn-large">Sign up today</a></p>
                </div>
            </div>
        </div>
        
        <div class="item">
             <img src="<c:url value='/resources/images/slide4.jpg'/>">
            <div class="container active">
                <div class="carousel-caption">
                    <h1>PLATFORM FOR NEW ARTIST</h1>
                    <p><!--Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.--></p>
                    <p><a href="#" class="btn btn-primary btn-large">Sign up today</a></p>
                </div>
            </div>
        </div>
    </div>    
    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
</div>    
    
<!--Carousel End -->

    <div class="intro-block">
        <div class="container">
            <div class="row">
                <div class="col-xs-3 padding-20">
                     <img src="<c:url value='/resources/images/musicHeart2.png'/>">
                </div>
                <div class="col-xs-9">
                    <h1>Resonance <span class="text-muted">&raquo; Boost Your Mood</span></h1>
                    <p class="lead">Resonance is a unique application designed for people all over the world to listen to music on web while you work or browse. Search for any track, artist or album and listen for free. Also, Get relaxed with personal music therapy recommendations. </p>
                </div>
            </div>
        </div>
    </div>

    <!--End of Intro section-->
   <div class="container padded">
    <div class="row">
        <div class="col-lg-12"><h2>FOUR MODES</h2><hr></div>
    </div>
    <div class="row modes">
        <div class="col-sm-6 col-md-3">
            <img class="img-circle img-responsive" src="<c:url value='resources/images/recommend.jpg' />" width='200' height='200'>
            <h3>Recommend Music</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <p><a class="btn btn-default" href="#">View details &raquo;</a></p>
        </div>
        <div class="col-sm-6 col-md-3">
            <img class="img-circle img-responsive" src="<c:url value='resources/images/socialmusic.png'/>"  width='200' height='200'>
            <h3>Social Music</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <p><a class="btn btn-default" href="#">View details &raquo;</a></p>
        </div>
        
        <div class="clearfix hidden-md hidden-lg"></div>
        
        <div class="clearfix hidden-md hidden-lg"></div>
        <div class="col-sm-6 col-md-3">
           <img class="img-circle img-responsive" src="<c:url value='resources/images/story.jpg' />" width='200' height='200'>
            <h3>Music Story</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <p><a class="btn btn-default" href="#">View details &raquo;</a></p>
        </div>
        <div class="col-sm-6 col-md-3">
            <img class="img-circle img-responsive" src="<c:url value='resources/images/events.jpg'/>"  width='200' height='200'>
            <h3>Events</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <p><a class="btn btn-default" href="#">View details &raquo;</a></p>
        </div>
    </div>
</div>    

    <!-- End Page Content -->
    <div class="marketing">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img class="img-responsive" src="<c:url value='/resources/images/blue.jpg'/>">
                </div>
                <div class="col-sm-6">
                    <h3 class="tpad">MUSIC FOR EVERYONE</h3>
                    <hr>
                    <p>Try this App now. Enjoy your favorite music and artists, with music therapy.</p>
                    <p><a class="btn btn-large btn-primary" href="#">Try it now!</a></p>
                </div>
            </div>
        </div>
    </div>
    <!-- End Marketing Section -->
    <div class="info">
        <div class="container">
            <div class="row">
                <div class="col-lg-12"><h2>CONTRIBUTERS</h2><hr></div>
    </div>
    <div class="row modes">
        <div class="col-sm-6 col-md-3">
            <img class="img-circle img-responsive" src="<c:url value='/resources/images/h1.jpg'/>" width="200" height="200">
            <h4 class="namePosition">Harkirat</h4>
        </div>
        <div class="col-sm-6 col-md-3">
             <img class="img-circle img-responsive" src="<c:url value='/resources/images/a.jpg'/>" width="200" height="200">
              <h4 class="namePosition">Amit</h4>
        </div>
        
        <div class="clearfix hidden-md hidden-lg"></div>
        
        
        <div class="col-sm-6 col-md-3">
             <img class="img-circle img-responsive" src="<c:url value='/resources/images/s.jpg'/>" width="200" height="200">
              <h4 class="namePosition">Surbhi</h4>
        </div>
        <div class="col-sm-6 col-md-3">
            <img class="img-circle img-responsive" src="<c:url value='/resources/images/r.jpg'/>" width="200" height="200">
             <h4 class="namePosition">Rajas</h4>
        </div>
            </div>
        </div>
    </div>
    <!-- info panel end -->
    <div class="ftr">
        <div class="container">
            <div class="row">
                <footer>
                    <div class="pull-left ft_space">
                        <address>
                    <h3>Resonance</h3>
                    San Jose State University<br>
                    One Washington Square<br>
                    San Jose, CA 95112 <br>
                    <a href="mailto: first.last@resonance.com">hello@resonance.com</a><br>
                    <abbr title="Phone">P:</abbr>906 123-4567
                    </address>
                    </div>
                    <div class="pull-right ft_space">
                        <img class="img-responsive" src="<c:url value='/resources/images/musicHeart.png'/>">
                        <p>&copy; Resonance 2016</p>
                    </div>
                </footer>
            </div>
        </div>

    </div>






    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/resources/js/jquery-1.12.3.min.js' />"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script>
    (function (){
        $('.carousel').carousel({
            interval: 4000
        });
    })
    </script>
</body>

</html>