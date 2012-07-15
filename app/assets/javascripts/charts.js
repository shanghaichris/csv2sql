// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
function showOption(select_id,question_id,series_type) {  
	$.ajax({
	    url: "/get_options",
	    type: "GET",
	    data: {"series_question_id" : select_id,"original_question_id": question_id,"series_type": series_type},
	    dataType: "html",
	    success: function(data) {
	      $("#more_series").html(data);
	    }
	  });
}