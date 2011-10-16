// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery  
//= require jquery-ui
//= require jquery_ujs  
//= require_tree .
//= require_self  

$(document).ready(function(){
	$('.alert-message').alert();
	$('.topbar').dropdown();
	$('.tabs').tabs();
	$(".span4 .filter a").popover();
	$('.slide-out-div').tabSlideOut({
      tabHandle: '.handle',                     //class of the element that will become your tab
      pathToTabImage: 'assets/add-event-button.jpg', //path to the image for the tab //Optionally can be set using css
      imageHeight: '202px',                     //height of tab image           //Optionally can be set using css
      imageWidth: '41px',                       //width of tab image            //Optionally can be set using css
      tabLocation: 'left',                      //side of screen where tab lives, top, right, bottom, or left
      speed: 300,                               //speed of animation
      action: 'click',                          //options: 'click' or 'hover', action to trigger animation
      topPos: '200px',                          //position from the top/ use if tabLocation is left or right
      leftPos: '20px',                          //position from left/ use if tabLocation is bottom or top
      fixedPosition: false                      //options: true makes it stick(fixed position) on scroll
  });
});

function keys(obj){
var a = [];
$.each(obj, function(k){ a.push(k) });
return a;
}

