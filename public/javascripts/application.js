// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function notify(flash_message)
{
// jQuery: reference div, load in message, and fade in
var flash_div = $("#flash")
flash_div.html(flash_message);
flash_div.fadeIn(400);
// use Javascript timeout function to delay calling
// our jQuery fadeOut, and hide
setTimeout(function(){
flash_div.fadeOut(500,

function(){
		flash_div.html("");
		flash_div.hide()})},
		2400);
	}

$(function(){
	// JQUERY after dom is loaded event
	// hide our container div
	$("#flash").hide();
	        // grab flash message from our div
	var flash_message = $("#flash").html().trim();
	        // call our flash display function
	if(flash_message != "")
	        {
			notify(flash_message);
	        }
	})

$(document).ready(function(){
      $('#sortable').sortable({
        update: function(){
         $('#miejsca').val($('#sortable').sortable('toArray').join(';'));
        }        
       });
      });
