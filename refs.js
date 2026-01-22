/* globals respecConfig, $, localRoleInfo, roleInfo, require */
/* exported linkCrossReferences, restrictReferences, fixIncludes */

// add a handler to come in after all the definitions are resolved
//

require(["core/pubsubhub"], function( respecEvents ) {

    respecEvents.sub('end', function(message) {
        var needs = {} ;

        if (message === 'core/link-to-dfn') {
            $.each(document.querySelectorAll("span.udef"), function(i, item) {
                var container = item.parentNode;
                var content = item.innerHTML;
                var sp = document.createElement("span");
                var title = item.getAttribute("title");
                if (!title) {
                    title = content;
                }

                var name = title.replace(/ .*$/, '');
                name = name.replace(/\./, "_");
                var id = "uneed_" + name;
                sp.id = id;
                sp.className = "userneed-name";
                sp.title = title;

                sp.innerHTML = content;
                container.replaceChild(sp, item);
                needs[id] = content;
            });

            $("span.uref").each(function() {
                var p = this.parentNode;
                var item = this.innerHTML;
                var id = item.replace(/\./, "_");
                id = "uneed_"+id;

                if (needs[id]) {
                    var ref = document.createElement("a");
                    ref.href = "#"+id;
                    ref.innerHTML = needs[id];
                    p.replaceChild(ref, this);
                }
            });
        }
    });

});
