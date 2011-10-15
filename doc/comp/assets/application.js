// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :application

//= require jquery  
//= require jquery-ui
//= require jquery_ujs  
//= require_tree .
//= require_self  

$(document).ready(function(){
	$('.alert-message').alert();
	$('.topbar').dropdown();
});

function keys(obj){
var a = [];
$.each(obj, function(k){ a.push(k) });
return a;
}

