jQuery.noConflict();
(function($) {
    $(document).on('click', '.mega-dropdown', function(e) {
    	alert("here")
    	  e.stopPropagation()
    });
})(jQuery);
