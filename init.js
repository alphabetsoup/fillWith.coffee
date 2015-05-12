jQuery(document).ready(function($) {
    var urlroot = "https://raw.githubusercontent.com/alphabetsoup/fillWith.coffee/master/";
    // load mocha
    $("head").append("<link>");;
    var css = $("head").children(":last");
    css.attr({
      rel:  "stylesheet",
      type: "text/css",
      href: urlroot + "mocha/mocha.css"
    });
    // assume jQuery has already loaded, otherwise this won't run.
    $.getScript(urlroot+'chai/chai.js');
    $.getScript(urlroot+'mocha/mocha.js');
    $.getScript(urlroot+'js/regex-select.js');
    $.getScript("http://github.com/jashkenas/coffee-script/raw/master/extras/coffee-script.js", function() {
        $.getScript(urlroot+'js/fillWith.coffee');
        $.getScript(urlroot+'js/tests.coffee');
        $('<div />').appendTo('body').attr('id','mocha');
        mocha.setup('bdd');
    });
});
