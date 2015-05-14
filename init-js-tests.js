jQuery(document).ready(function($) {
    var urlroot;
    urlrootnoproto = "rawgit.com/alphabetsoup/fillWith.coffee/master/";
    urlroot = "https://" + urlrootnoproto;
    // load mocha
    // css
    var mochacssurl = urlroot + "mocha/mocha.css";
    var extracssurl = urlroot + "fillWith.css";
    var loadCSS = function(cssurl) {
        console.log("Dynamically loading css " + cssurl);
        if (document.createStyleSheet){
            document.createStyleSheet(cssurl);
        }
        else {
            $("head").append($("<link rel='stylesheet' href='"+cssurl+"' type='text/css' media='screen' crossorigin='anonymous' />"));
        }
    };
    loadCSS(mochacssurl);
    $.getScript('http://chaijs.com/chai.js', function() {
        $.getScript(urlroot+'mocha/mocha.js', function() {
             $('<div />').prependTo('body').attr('id','mocha');
             mocha.setup('bdd');
            $.getScript(urlroot+'js/regex-select.js',function() {
                $.getScript(urlroot+'js/fillWith.js', function() {
                    $.getScript(urlroot+'js/tests.js');
                });
            });
        });
    });
});
