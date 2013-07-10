/*!
 * print a list of links in the page as footnotes
 * Author: Small Hadron Collider
 * Author URI: http://www.smallhadroncollider.com/
 */
jQuery(function ($) {
    var area = $('.content-main'),
        links = area.find('a'),
        list = $(document.createElement('ul')),
        n = 1;

    links.each(function () {
        var link = $(this),
            href = link.attr('href');

        if (href && !href.match(/^#/)) {
            link.after('<sup class="print">' + n + '</sup>');
            list.append('<li>' + n + '. ' + href + '</li>');
            n += 1;
        }
    });

    list.attr('id', 'print-links');
    area.addClass('no-links');
    area.append(list);
});