/*!
 * Javascript for University of Leeds eprints theme
 * @author Peter Edwards <p.l.edwards@leeds.ac.uk>
 * @version 1.2
 * @requires jQuery
 */

/* add a js class to the html element to target CSS */
document.documentElement.className = 'js';

/* page load stuff */
jQuery(function($){
	/* placeholders */
	$('[placeholder]').each(function(){
		var phtxt = $(this).attr('placeholder');
		$(this).attr('data-placeholder', phtxt);
		if ($(this).val() == '') {
			$(this).css({color:'#aaa'}).val(phtxt);
		}
		$(this).attr('placeholder', '');
	}).focus(function() {
		if ($(this).val() == $(this).attr('data-placeholder')) {
			$(this).val('');
		}
		$(this).css({color:'#000'});
	}).blur(function(){
		if ($(this).val() == '') {
			$(this).val($(this).attr('data-placeholder'));
			$(this).css({color:'#aaa'});
		}
	});
});