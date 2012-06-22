// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.noConflict();

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery(document).ready(function() {

	jQuery("ul#topnav li").hover(function() { //Hover over event on list item
		jQuery(this).css({ 'background' : '#1376c9'}); //Add background color and image on hovered list item
		jQuery(this).find("span").show(); //Show the subnav
	} , function() { //on hover out...
		jQuery(this).css({ 'background' : 'none'}); //Ditch the background
		jQuery(this).find("span").hide(); //Hide the subnav
	});

});

jQuery(document).ready(function(){
   var maxHeight = 0;
   jQuery('.content_block')
     .each(function() { maxHeight = Math.max(maxHeight, jQuery(this).height()); })
     .height(maxHeight);
   jQuery(".image_block").width('100%');
   jQuery(".image_block").height('145px'); 
    
   jQuery("a.switch_thumb").toggle(function(){
     jQuery(this).addClass("swap");
     if (jQuery.browser.msie && jQuery.browser.version == "7.0" ) {
    
     }else {
      jQuery('#images').addClass("image_block");
 	 }
     jQuery("ul.display").fadeOut("fast", function() {
       jQuery(this).fadeIn("fast").removeClass("thumb_view");
       jQuery(".content_block").height('');
            if (jQuery.browser.msie ) {
    		  
  			}else {
    		  jQuery(".image_block").width('0px');
    		  jQuery(".image_block").height('0px');
 			}
     });
    }, function () {
        jQuery(this).removeClass("swap");
        jQuery("ul.display").fadeOut("fast", function() {
          jQuery(this).fadeIn("fast").addClass("thumb_view");
          var maxHeight = 0;
   		  jQuery('.content_block')
     	  	.each(function() { maxHeight = Math.max(maxHeight, jQuery(this).height()); })
     		.height(maxHeight);
   		  jQuery(".image_block").width('100%');
   		  jQuery(".image_block").height('145px'); 
        });
    }); 
});

jQuery(document).ready(function() {
  jQuery("#new_artwork_button").click(function () {
      jQuery("#artwork_form").show("slow");
      jQuery("#new_artwork_button").hide("slow");
      jQuery("#cancel_artwork_button").show("slow");
    });
});

jQuery(document).ready(function() {
  jQuery("#new_gallery_button").click(function () {
      jQuery("#gallery_form").show("slow");
      jQuery("#new_gallery_button").hide("slow");
      jQuery("#cancel_gallery_button").show("slow");
      jQuery("#artwork_form").hide("slow");
    });
});

jQuery(document).ready(function() {
  jQuery("#cancel_artwork_button").click(function () {
      jQuery("#artwork_form").hide("slow");
      jQuery("#cancel_artwork_button").hide("slow");
      jQuery("#new_artwork_button").show("slow");
    });
});

jQuery(document).ready(function() {
  jQuery("#cancel_gallery_button").click(function () {
      jQuery("#gallery_form").hide("slow");
      jQuery("#cancel_gallery_button").hide("slow");
      jQuery("#new_gallery_button").show("slow");
    });
});

jQuery(document).ready(function() {
  jQuery("#new_artwork_button").click(function () {
      jQuery("#artwork_form").show("slow");
      jQuery("#gallery_form").hide("slow");
    });
});

jQuery(document).ready(function() {
  jQuery("#new_artwork").submitWithAjax();	
})

jQuery(document).ready(function() {
  jQuery("#new_gallery").submitWithAjax();	
})



