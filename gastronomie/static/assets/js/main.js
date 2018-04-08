"use strict";


jQuery(document).ready(function ($) {

// pre loader

	$(window).load(function () {
		$(".loaded").fadeOut();
		$(".preloader").delay(1000).fadeOut("slow");
	});
    /*---------------------------------------------*
     * Mobile menu
     ---------------------------------------------*/
    $('#navbar-collapse').find('a[href*=#]:not([href=#])').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: (target.offset().top - 40)
                }, 1000);
                if ($('.navbar-toggle').css('display') != 'none') {
                    $(this).parents('.container').find(".navbar-toggle").trigger("click");
                }
                return false;
            }
        }
    });



    /*---------------------------------------------*
     * STICKY scroll
     ---------------------------------------------*/



    /*---------------------------------------------*
     * WOW
     ---------------------------------------------*/

    var wow = new WOW({
        mobile: false // trigger animations on mobile devices (default is true)
    });
    wow.init();


    /*---------------------------------------------*
     * Counter 
     ---------------------------------------------*/

    $('.statistic-counter').counterUp({
        delay: 10,
        time: 2000
    });
    $('.statistic').counterUp({
        delay: 10,
        time: 2000
    });





    /* ---------------------------------------------------------------------
     Carousel
     ---------------------------------------------------------------------= */

    $('.main_home_slider').owlCarousel({
        responsiveClass: true,
        autoplay: false,
        items: 1,
        loop: true,
        dots: true,
        nav: false,
        navText: [
            "<i class='lnr lnr-chevron-left'></i>",
            "<i class='lnr lnr-chevron-right'></i>"
        ],
        autoplayHoverPause: true

    });


    $('.main_team_content').owlCarousel({
        responsiveClass: true,
        autoplay: false,
        items: 1,
        loop: true,
        dots: false,
        nav: true,
        navText: [
            "<i class='lnr lnr-chevron-left'></i>",
            "<i class='lnr lnr-chevron-right'></i>"
        ],
        autoplayHoverPause: true

    });


    $('.main_blog').owlCarousel({
        responsiveClass: true,
        autoplay: false,
        items: 4,
        loop: true,
        dots: false,
        nav: true,
        navText: [
            "<i class='lnr lnr-chevron-left'></i>",
            "<i class='lnr lnr-chevron-right'></i>"
        ],
        autoplayHoverPause: true

    });

    // $('.main_gellary_content').owlCarousel({
    //     responsiveClass: true,
    //     autoplay: false,
    //     items: 1,
    //     loop: true,
    //     dots: false,
    //     nav: true,
    //     navText: [
    //         "<i class='lnr lnr-chevron-left'></i>",
    //         "<i class='lnr lnr-chevron-right'></i>"
    //     ],
    //     autoplayHoverPause: true

    // });




// main-menu-scroll

    // jQuery(window).scroll(function () {
    //     var top = jQuery(document).scrollTop();
    //     var height = 300;
     
    //     if (top > height) {
    //         jQuery('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
    //         //jQuery('.navbar-fixed-top').removeClass('nave_menu');

    //     } else {
    //         //jQuery('.navbar-static-top').removeClass('navbar-fixed-top menu-scroll');
    //         jQuery('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
    //          //jQuery('.navbar-fixed-top').addClass('nave_menu');
    //     }
    // });

  

// scroll Up

    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $('.scrollup').fadeIn('slow');
        } else {
            $('.scrollup').fadeOut('slow');
        }
    });
    $('.scrollup').click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
        return false;
    });



    // $('#menu').slicknav();

    // $('#mixcontent').mixItUp({
    //     animation: {
    //         animateResizeContainer: false,
    //         effects: 'fade rotateX(-45deg) translateY(-10%)'
    //     }
    // });


    // $('.dropdown-menu').click(function (e) {
    //     e.stopPropagation();
    // });


    //End
});




$(document).on("scroll", function () {
    if ($(document).scrollTop() > 120) {
        $("nav").addClass('small navbar-fixed-top');
        $("header").addClass('menu-scroll');
        $("header").removeClass('main_menu');
        

        
        
    } else {
        $("nav").removeClass('small navbar-fixed-top');
      
        $("header").removeClass('menu-scroll');
        $("header").addClass('main_menu');
    }
});

$(document).on('click','.navbar-collapse.in',function(e) {
    if( $(e.target).is('a') ) {
        $(this).collapse('hide');
    }
});


  // Ajouter  function like
$(document).ready(function() {
    // $('.like').click(function() {
    // var pk;
    //     pk = $(this).attr('data-recipe-pk');
    //     $.get('/recipe/like/', {
    //         recipe_pk: pk
    //     }, function(data) {
    //         $('#count-like-'+pk).html(data);
            
    //     });
    //     return false;
    // });

    
});

$(document).ready(function() {

    $('#likes').click(function(){
        var projid;
        projid = $(this).attr("data-projid");
        $.get('/recipe/like/', {recipe_pk: projid}, function(data){
                   $('#like_count').html(data);
                   $('#likes').hide();
        });
    });
});

$(document).ready(function() {
    $('.likepost').click(function() {
    var pk;
        pk = $(this).attr('data-post-pk');
        $.get('/blog/like/', {
            post_pk: pk
        }, function(data) {
            $('#count-like-'+pk).html(data);
            
        });
        return false;
    });

});

$(document).ready(function() {
    $('.likevideo').click(function() {
    var pk;
        pk = $(this).attr('data-video-pk');
        $.get('/video/like/', {
            video_pk: pk
        }, function(data) {
            $('#count-like-'+pk).html(data);
            
        });
        return false;
    });

});
  

