/*any new JS files you put into this folder should be included by your application automatically- this file will contain site wide functions*/

$(document).on('turbolinks:load', function() {
	$('.img-zoom').elevateZoom({scrollZoom: true});
	$('.rating').raty( { path: '/assets/images/images', scoreName: 'comment[rating]' });

/* When the page is loaded raty will init. on the rating class*/
/* path: method points up to the assets folder to find images */
  $('.rated').raty({ path: '/assets/images/images', readOnly: true, score: function() {
  	  return $(this).attr('data-score');
    }
  });
});

