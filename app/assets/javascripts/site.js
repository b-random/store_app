/*any new JS files you put into this folder should be included by your application automatically- this file will contain site wide functions*/

$(document).on('ready page:load', function() {
	$('.rating').raty( { path: '/assets/images' });
});

/* When the page is loaded raty will init. on the rating class*/
/* path: method points up to the assets folder to find images */