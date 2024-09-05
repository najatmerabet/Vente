<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="Tables.Users" %>
<%@page import="DAO.ProduitDaolmp" %>
<jsp:directive.page language="java"
                    contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Insert title here</title>
    <!-- Favicons -->
    <link href="photos/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="vendor/boxicons/css/boxicons.css/boxicons.min.css" rel="stylesheet">
    <link href="vendor/glightbox/css/glightbox.css/glightbox.min.css" rel="stylesheet">
    <link href="vendor/remixicon/remixicon.less/remixicon.css" rel="stylesheet">
    <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

            <!-- Slide 1 -->
            <div class="carousel-item active" style="background-image: url(photos/photos/slide/facebook-ray-ban-stories.jpg)">
                <div class="carousel-container">
                    <div class="container">
                        <h2 class="animate_animated animate_fadeInDown"><%
                            HttpSession rsession = (HttpSession) request.getSession();
                            String name=(String)rsession.getAttribute("Username");
                        %><LABEL>Bonjour Bienvenu <%=  name%>
                            <%  Users user=new Users ();
                            ProduitDaolmp dao=new ProduitDaolmp();
                           %>
                           </h2>

                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item" style="background-image: url(photos/photos/slide/ray-ban.jpg)">

            </div>

            <!-- Slide 3 -->
            <div class="carousel-item" style="background-image: url(photos/photos/slide/unnamed.jpg)">

            </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

    </div>
</section><!-- End Hero -->
<main id="main">



    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
        <div class="container">



            <div class="row portfolio-container">

                <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                    <div class="portfolio-wrap">
                        <img src="photos/photos/produits/produit1.jpg" class="img-fluid" alt="">
                        <div class="portfolio-info">
                            <h4></h4>
                            <p></p>
                            <div class="portfolio-links">
                                <a href="photos/photos/produits/produit1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="portfolio-details-lightbox" data-glightbox="type: external" title="Portfolio Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                    <div class="portfolio-wrap">
                        <img src="photos/photos/produits/produit2.jpg" class="img-fluid" alt="">
                        <div class="portfolio-info">
                            <h4></h4>
                            <p></p>
                            <div class="portfolio-links">
                                <a href="photos/photos/produits/produit2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="portfolio-details-lightbox" data-glightbox="type: external" title="Portfolio Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                    <div class="portfolio-wrap">
                        <img src="photos/photos/produits/produit3.jpg" class="img-fluid" alt="">
                        <div class="portfolio-info">
                            <h4></h4>
                            <p></p>
                            <div class="portfolio-links">
                                <a href="photos/photos/produits/produit3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="portfolio-details-lightbox" data-glightbox="type: external" title="Portfolio Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </section><!-- End Portfolio Section -->

</main><!-- End #main -->
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Vendor JS Files -->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/glightbox/js/glightbox.min.js"></script>
<script src="vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="vendor/swiper/swiper-bundle.min.js"></script>
<script src="vendor/waypoints/noframework.waypoints.js"></script>
<script src="vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="js/main.js"></script>
</body>
</html>