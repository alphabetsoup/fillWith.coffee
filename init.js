jQuery(document).ready(function($) {
    var urlroot = "https://rawgit.com/alphabetsoup/fillWith.coffee/master/";
    // load mocha
    $("head").prepend("<link>");;
    var css = $("head").children(":first");
    css.attr({
      rel:  "stylesheet",
      type: "text/plain",
      href: urlroot + "mocha/mocha.css"
    });
    // assume jQuery has already loaded, otherwise this won't run.
    $.getScript(urlroot+'chai/chai.js');
    $.getScript(urlroot+'mocha/mocha.js', function() {
            $('<div />').appendTo('body').attr('id','mocha');
            mocha.setup('bdd');
        });
    $.getScript(urlroot+'js/regex-select.js');
    $('<script />').appendTo('body')
                   .attr('type','text/coffeescript')
                   .attr('src',urlroot+'js/fillWith.coffee');
    $('<script />').appendTo('body')
                   .attr('type','text/coffeescript')
                   .attr('src',urlroot+'js/tests.coffee');
    $.getScript("https://github.com/jashkenas/coffee-script/raw/master/extras/coffee-script.js", function() {

        var runScripts,
          indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };
        
        runScripts = function() {
          var coffees, coffeetypes, execute, fn, i, index, j, len, s, script, scripts;
          scripts = window.document.getElementsByTagName('script');
          coffeetypes = ['text/coffeescript', 'text/literate-coffeescript'];
          coffees = (function() {
            var j, len, ref, results;
            results = [];
            for (j = 0, len = scripts.length; j < len; j++) {
              s = scripts[j];
              if (ref = s.type, indexOf.call(coffeetypes, ref) >= 0) {
                results.push(s);
              }
            }
            return results;
          })();
          index = 0;
          execute = function() {
            var param;
            param = coffees[index];
            if (param instanceof Array) {
              CoffeeScript.run.apply(CoffeeScript, param);
              index++;
              return execute();
            }
          };
          fn = function(script, i) {
            var options, source;
            options = {
              literate: script.type === coffeetypes[1]
            };
            source = script.src || script.getAttribute('data-src');
            if (source) {
              return CoffeeScript.load(source, function(param) {
                coffees[i] = param;
                return execute();
              }, options, true);
            } else {
              options.sourceFiles = ['embedded'];
              return coffees[i] = [script.innerHTML, options];
            }
          };
          for (i = j = 0, len = coffees.length; j < len; i = ++j) {
            script = coffees[i];
            fn(script, i);
          }
          return execute();
        };
        
        // run
        runScripts();
    });
});
// ---
// generated by coffee-script 1.9.2
