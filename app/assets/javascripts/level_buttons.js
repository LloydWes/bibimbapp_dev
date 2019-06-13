/*
*
*= require_self
*
*/  





  $(document).ready(function(){
    $("#levelA1").click(function(){
      $(".levelA2").hide();
      $(".levelB1").hide();
      $(".levelB2").hide();
      $(".levelA1").show();
    });
  });

  $(document).ready(function(){
    $("#levelA2").click(function(){
      $(".levelA1").hide();
      $(".levelB1").hide();
      $(".levelB2").hide();
      $(".levelA2").show();
    });
  });

  $(document).ready(function(){
    $("#levelB1").click(function(){
      $(".levelA1").hide();
      $(".levelA2").hide();
      $(".levelB2").hide();
      $(".levelB1").show();
    });
  });

  $(document).ready(function(){
    $("#levelB2").click(function(){
      $(".levelA1").hide();
      $(".levelA2").hide();
      $(".levelB1").hide();
      $(".levelB2").show();
    });
  });

  $(document).ready(function(){
    $("#levelAll").click(function(){
      $(".levelA1").show();
      $(".levelA2").show();
      $(".levelB1").show();
      $(".levelB2").show();
    });
  });
  