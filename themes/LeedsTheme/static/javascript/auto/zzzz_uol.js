/*!
 * Javascript for University of Leeds eprints theme
 * @author Peter Edwards <p.l.edwards@leeds.ac.uk>
 * @version 1.2
 * @requires jQuery
 */
document.documentElement.className="js";jQuery(function($){$("[placeholder]").each(function(){var phtxt=$(this).attr("placeholder");$(this).attr("data-placeholder",phtxt);if($(this).val()==""){$(this).css({color:"#aaa"}).val(phtxt)}$(this).attr("placeholder","")}).focus(function(){if($(this).val()==$(this).attr("data-placeholder")){$(this).val("")}$(this).css({color:"#000"})}).blur(function(){if($(this).val()==""){$(this).val($(this).attr("data-placeholder"));$(this).css({color:"#aaa"})}})});/*!
 * print a list of links in the page as footnotes
 * Author: Small Hadron Collider
 * Author URI: http://www.smallhadroncollider.com/
 */
jQuery(function($){var area=$(".content-main"),links=area.find("a"),list=$(document.createElement("ul")),n=1;links.each(function(){var link=$(this),href=link.attr("href");if(href&&!href.match(/^#/)){link.after('<sup class="print">'+n+"</sup>");list.append("<li>"+n+". "+href+"</li>");n+=1}});list.attr("id","print-links");area.addClass("no-links");area.append(list)});