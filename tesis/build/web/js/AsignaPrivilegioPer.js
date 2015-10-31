/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function asignaPrivilegio(perId) {
    var href = "AsignaPrivilegio.jsp?perId=" + perId;

    parent.$("#asignaPrivilegio").fancybox({
        'href': href,
        'scrolling': 'no',
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 600,
        'height': 350
    });
    parent.$("#asignaPrivilegio").trigger('click');
}
