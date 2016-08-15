$('img').on('click', function(event) {
  $(this).toggleClass('img-circle');
});

// will call on the element clicked on only
//
//
//
$('#images).on('click', "img" function(event) {
  $(this).toggleClass('img-circle');
});
//to listen to all images
//
//
//
//
$('img').on('click', function(event) {
  $('img').toggleClass('img-circle');
});

// will select all img elements.


//Alternative syntax:
$(".clickable").click(function(event) {

});


$("#apply").on("submit", function(event) {
  // Code executed when a form is submitted

  return false; // prevent it from being submitted (errors, etc.)
});


//activate plugin
$(document).ready(function(){
  $("member").tooltip();
})

$(document).ready(function(){
  $(".class").popover(){
    html: true,
    contenet: "Wake up!"
    trigger: "hover"
  }
})

$(document).ready(function(){
  $("member").popover();
})


$(document).ready(function(){
  $(".class").popover(){
    html: true,
    contenet: function(){
    var   $(this).attr("data-popover")
    }
    trigger: "hover"
  }
})



