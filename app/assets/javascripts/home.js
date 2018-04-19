$(document).ready(function(){
             if (jQuery) {
               // jQuery is loaded
               alert("Yeah!");
             } else {
               // jQuery is not loaded
               alert("Doesn't Work");
             }
          });

$ (document).ready(function(){

  $("#about-link").click(function(){
    $("#about_me").show("fast");
    $("#contact_me").hide("fast");
    $("#stylist_review").hide("fast");
    $("#stylist_portfolio").hide("fast");
  });

  $("#contacts-link").click(function(){
    $("#contact_me").show("fast");
    $("#about_me").hide("fast");
    $("#stylist_review").hide("fast");
    $("#stylist_portfolio").hide("fast");
  });

  $("#reviews-link").click(function(){
    $("#stylist_review").show("fast");
    $("#about_me").hide("fast");
    $("#contact_me").hide("fast");
    $("#stylist_portfolio").hide("fast");
  });

  $("#portfolio-link").click(function(){
    $("#stylist_portfolio").show("fast");
    $("#about_me").hide("fast");
    $("#contact_me").hide("fast");
    $("#stylist_review").hide("fast");
  });




});
