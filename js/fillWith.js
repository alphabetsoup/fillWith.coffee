// Generated by CoffeeScript 1.9.2
(function() {
  var InputMatcher,
    slice = [].slice;

  jQuery.expr[':'].regex = function(elem, index, match) {
    var attr, matchParams, regex, regexFlags, validLabels;
    matchParams = match[3].split(',');
    validLabels = /^(data|css|text):/;
    attr = {
      method: matchParams[0].match(validLabels) ? matchParams[0].split(':')[0] : 'attr',
      property: matchParams.shift().replace(validLabels, '')
    };
    regexFlags = 'ig';
    regex = new RegExp(matchParams.join('').replace(/^s+|s+$/g, ''), regexFlags);
    if (attr.method !== 'text') {
      return regex.test(jQuery(elem)[attr.method](attr.property));
    } else {
      return regex.test(jQuery(elem)[attr.method]());
    }
  };

  window.fillWith = {
    "in": function(k, o) {
      return k in o && o[k] && o[k].length;
    },
    makeAddressLine1: function(data) {
      var line, usefields, useslash;
      line = "";
      usefields = {
        ln: "AddressDetails.HomeAddress.LevelNumber",
        un: "AddressDetails.HomeAddress.UnitNumber",
        so: "AddressDetails.HomeAddress.StreetNumber",
        sn: "AddressDetails.HomeAddress.StreetName",
        st: "AddressDetails.HomeAddress.StreetType",
        bn: "AddressDetails.HomeAddress.BuildingName"
      };
      useslash = false;
      if (fillWith["in"](usefields.un, data)) {
        line += "U " + data[usefields.un] + " ";
        useslash = true;
      }
      if (fillWith["in"](usefields.ln, data)) {
        line += "L " + data[usefields.ln] + " ";
        useslash = true;
      }
      if (useslash) {
        line += "/ ";
      }
      if (fillWith["in"](usefields.so, data)) {
        line += data[usefields.so] + " ";
      } else if (fillWith["in"](usefields.bn, data)) {
        line += data[usefields.bn] + " ";
      }
      if (fillWith["in"](usefields.sn, data)) {
        line += data[usefields.sn] + " ";
        if (fillWith["in"](usefields.st, data)) {
          line += data[usefields.st];
        }
      }
      return line.replace(/\s+$/g, "");
    },
    escRE: function(str) {
      return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
    }
  };

  InputMatcher = (function() {
    function InputMatcher(names, _match_options, _populate_fn) {
      this.names = names;
      this._match_options = _match_options;
      this._populate_fn = _populate_fn;
      this._match_options = $.extend({
        include: {},
        exclude: {}
      }, this._match_options);
    }

    InputMatcher.prototype.hasFields = function(fields) {
      if (typeof fields === !'array') {
        throw new "hasFields requires array as first argument.";
      }
      if (typeof this.names === 'string') {
        return fillWith["in"](this.names, fields);
      } else if ($.isArray(this.names)) {
        return 0 < $.map(this.names, function(n) {
          if (fillWith["in"](n, fields)) {
            return true;
          } else {
            return void 0;
          }
        }).length;
      }
    };

    InputMatcher.prototype.match = function(_) {
      var res;
      res = $([]);
      $.each(this._match_options.include, function(i, e) {
        if (i === "label_for") {
          _.find('label:regex(text:,name)').each(function(i, e) {
            res = res.add(_.find("input[name='" + $(e).attr('for') + "']"));
            res = res.add(_.find("select[name='" + $(e).attr('for') + "']"));
          });
        } else {
          res = res.add(_.find(i + ":regex(name," + e + ")"));
        }
        return true;
      });
      $.each(this._match_options.exclude, function(i, e) {
        if (i === "label_for") {
          res = res.not(res.find("label:regex(text:," + e + ")").attr("for"));
        } else {
          res = res.not(i + ":regex(name," + e + ")");
        }
        return true;
      });
      return res;
    };

    InputMatcher.prototype.populate = function(el, v) {
      var vals;
      if (typeof this.names === 'string') {
        return this._populate_fn(el, v[this.names]);
      } else if ($.isArray(this.names)) {
        vals = {};
        $.each(this.names, function(i, n) {
          vals[n] = v[n];
          return true;
        });
        return this._populate_fn(el, vals);
      }
    };

    return InputMatcher;

  })();

  (function($, window) {
    var FillWith;
    FillWith = (function() {
      FillWith.prototype.defaults = {
        "PersonalDetails.Honorific": "",
        "PersonalDetails.FirstName": "",
        "PersonalDetails.MiddleName": "",
        "PersonalDetails.LastName": "",
        "PersonalDetails.BirthDate.Day": "",
        "PersonalDetails.BirthDate.Month": "",
        "PersonalDetails.BirthDate.Year": "",
        "ContactDetails.Emails.Email.Address": "",
        "AddressDetails.HomeAddress.LevelNumber": "",
        "AddressDetails.HomeAddress.UnitNumber": "",
        "AddressDetails.HomeAddress.StreetNumber": "",
        "AddressDetails.HomeAddress.StreetName": "",
        "AddressDetails.HomeAddress.StreetType": "",
        "AddressDetails.HomeAddress.Suburb": "",
        "AddressDetails.HomeAddress.AdministrativeArea": "",
        "AddressDetails.HomeAddress.PostalCode": "",
        "AddressDetails.HomeAddress.Country": "",
        "AddressDetails.HomeAddress.BuildingName": "",
        "AddressDetails.PostalAddress.POBox": "",
        "AddressDetails.PostalAddress.LevelNumber": "",
        "AddressDetails.PostalAddress.UnitNumber": "",
        "AddressDetails.PostalAddress.StreetNumber": "",
        "AddressDetails.PostalAddress.StreetName": "",
        "AddressDetails.PostalAddress.StreetType": "",
        "AddressDetails.PostalAddress.Suburb": "",
        "AddressDetails.PostalAddress.AdministrativeArea": "",
        "AddressDetails.PostalAddress.PostalCode": "",
        "AddressDetails.PostalAddress.Country": "",
        "AddressDetails.PostalAddress.BuildingName": "",
        "AddressDetails.BillingAddress.POBox": "",
        "AddressDetails.BillingAddress.LevelNumber": "",
        "AddressDetails.BillingAddress.UnitNumber": "",
        "AddressDetails.BillingAddress.StreetNumber": "",
        "AddressDetails.BillingAddress.StreetName": "",
        "AddressDetails.BillingAddress.StreetType": "",
        "AddressDetails.BillingAddress.Suburb": "",
        "AddressDetails.BillingAddress.AdministrativeArea": "",
        "AddressDetails.BillingAddress.PostalCode": "",
        "AddressDetails.BillingAddress.Country": "",
        "AddressDetails.WorkAddress.POBox": "",
        "AddressDetails.WorkAddress.LevelNumber": "",
        "AddressDetails.WorkAddress.UnitNumber": "",
        "AddressDetails.WorkAddress.StreetNumber": "",
        "AddressDetails.WorkAddress.StreetName": "",
        "AddressDetails.WorkAddress.StreetType": "",
        "AddressDetails.WorkAddress.Suburb": "",
        "AddressDetails.WorkAddress.AdministrativeArea": "",
        "AddressDetails.WorkAddress.PostalCode": "",
        "AddressDetails.WorkAddress.Country": ""
      };

      FillWith.prototype.matchers = [
        new InputMatcher("PersonalDetails.Honorific", {
          include: {
            input: "honorific|prefix|title",
            select: "honorific|prefix|title",
            label_for: "honorific|prefix|title"
          },
          exclude: {
            input: "sp|sup",
            select: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          if ($(el).is("input")) {
            return $(el).val(v);
          } else if ($(el).is("select")) {
            return $(el).children("option").each(function(i, e) {
              var res, titlematch;
              titlematch = new RegExp("^" + fillWith.escRE(v) + "[^A-Za-z]?$", "gi");
              res = $(e).val().match(titlematch);
              if (!res) {
                return true;
              }
              if (res.length === 1) {
                $(e).prop('selected', true);
                return false;
              } else if (res.length > 1) {
                console.log("Failed Honorific match. Option is:");
                console.log($(e).val());
                return false;
              }
            });
          }
        }), new InputMatcher("PersonalDetails.FirstName", {
          include: {
            input: "((first|given).*name|^name$)",
            label_for: "(first|given)\\s*name"
          },
          exclude: {
            input: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          return $(el).val(v);
        }), new InputMatcher("PersonalDetails.MiddleName", {
          include: {
            input: "middle.*names?",
            label_for: "middle.*names?"
          },
          exclude: {
            input: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          return $(el).val(v);
        }), new InputMatcher("PersonalDetails.MiddleName", {
          include: {
            input: "((middle.*|^)initials?)",
            label_for: "((middle.*|^)initials?)"
          },
          exclude: {
            input: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          return $(el).val(v.substring(0, 1));
        }), new InputMatcher("PersonalDetails.LastName", {
          include: {
            input: "(last|sur).*names?",
            label_for: "(last|sur)\\s*names?"
          },
          exclude: {
            input: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          return $(el).val(v);
        }), new InputMatcher("PersonalDetails.BirthDate.Day", {
          include: {
            input: "(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)",
            select: "(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)",
            label_for: "(birth.*(day|date)|^dob$|^d\\.o\\.b\\.?$)"
          },
          exclude: {
            input: "sp|sup",
            select: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          if ($(el).is("input")) {
            return $(el).val(v);
          } else if ($(el).is("select")) {
            return $(el).children("option").each(function(i, e) {
              var daymatch, res;
              daymatch = new RegExp("0?" + fillWith.escRE(v) + "$", "gi");
              res = $(e).val().match(daymatch);
              if (!res) {
                return true;
              } else if (res.length === 1) {
                $(e).prop('selected', true);
                return false;
              } else if (res.length > 1) {
                console.log("Failed BirthDate.Day match. Option is:");
                console.log($(e).val());
                return false;
              }
            });
          }
        }), new InputMatcher("PersonalDetails.BirthDate.Month", {
          include: {
            input: "(birth|dob|d\\.o\\.b\\.?).*(mm|m|month)",
            select: "(birth|dob|d\\.o\\.b\\.?).*(mm|m|month)",
            label_for: "(birth.*(month|mm)|^dob$|^d\\.o\\.b\\.?$)"
          },
          exclude: {
            input: "sp|sup",
            select: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          var month_a_v, months_a;
          if ($(el).is("input")) {
            return $(el).val(v);
          } else if ($(el).is("select")) {
            months_a = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
            month_a_v = months_a[parseInt(v, 10) - 1];
            return $(el).children("option").each(function(i, e) {
              var month_a_el_v, monthmatch, monthmatch2, res, res2;
              monthmatch = new RegExp("^0?" + fillWith.escRE(v) + "$|^" + month_a_v, "gi");
              res = $(e).val().match(monthmatch);
              month_a_el_v = months_a[parseInt($(e).val(), 10) - 1];
              if (month_a_el_v != null) {
                monthmatch2 = new RegExp("^0?" + fillWith.escRE($(e).val()) + "$|^" + month_a_el_v, "gi");
              } else {
                monthmatch2 = new RegExp("^0?" + fillWith.escRE($(e).val()) + "$", "gi");
              }
              res2 = v.match(monthmatch2);
              res = res ? res : [];
              res2 = res2 ? res2 : [];
              res = $.merge(res, res2);
              if (!res) {
                return true;
              } else if (res.length >= 1) {
                $(e).prop('selected', true);
                return false;
              }
            });
          }
        }), new InputMatcher("PersonalDetails.BirthDate.Year", {
          include: {
            input: "(birth|dob|d\\.o\\.b\\.?).*(yy|y|year)",
            select: "(birth|dob|d\\.o\\.b\\.?).*(yy|y|year)",
            label_for: "year|^dob$|^d\\.o\\.b\\.?"
          },
          exclude: {
            input: "sp|sup",
            select: "sp|sup",
            label_for: "spouse|supplementary"
          }
        }, function(el, v) {
          if ($(el).is("input")) {
            return $(el).val(v);
          } else if ($(el).is("select")) {
            return $(el).children("option").each(function(i, e) {
              var res, yearmatch;
              yearmatch = new RegExp("^" + fillWith.escRE(v) + "$", "gi");
              res = $(e).val().match(yearmatch);
              if (!res) {
                return true;
              } else if (res.length === 1) {
                $(e).prop('selected', true);
                return false;
              } else if (res.length > 1) {
                console.log("Failed BirthDate.Year match. Option is:");
                console.log($(e).val());
                return false;
              }
            });
          }
        }), new InputMatcher(["AddressDetails.HomeAddress.LevelNumber", "AddressDetails.HomeAddress.UnitNumber", "AddressDetails.HomeAddress.StreetNumber", "AddressDetails.HomeAddress.StreetName", "AddressDetails.HomeAddress.StreetType", "AddressDetails.HomeAddress.BuildingName"], {
          include: {
            input: "add|address",
            label_for: "add|address"
          },
          exclude: {
            input: "post|permanent|code|(2|two)|billing|suburb|city",
            label_for: "post|permanent|code|(2|two)|billing|suburb|city"
          }
        }, function(el, vals) {
          return $(el).val(fillWith.makeAddressLine1(vals));
        }), new InputMatcher("ContactDetails.Emails.Email.Address", {
          include: {
            input: "email|^eadd",
            label_for: "email"
          }
        }, function(el, v) {
          return $(el).val(v);
        })
      ];

      function FillWith(el, options) {
        this.options = $.extend({}, this.defaults, options);
        this.$el = $(el);
      }

      return FillWith;

    })();
    return $.fn.extend({
      fillWith: function() {
        var args, option;
        option = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
        return this.each(function() {
          var $this, data;
          $this = $(this);
          data = $this.data('fillWith');
          if (!data) {
            $this.data('fillWith', (data = new FillWith(this, option)));
          }
          if (typeof option === 'string') {
            data[option].apply(data, args);
          }
          return $.each(data.matchers, function(_, matcher) {
            var el;
            el = matcher.match($this);
            el.css({
              'background-color': '#00CC99'
            });
            if (matcher.hasFields(data.options)) {
              return $(el).each(function(i, e) {
                return matcher.populate(e, data.options);
              });
            } else {
              console.log("fillWith option not found: ");
              return console.log(matcher.names);
            }
          });
        });
      }
    });
  })(window.jQuery, window);

}).call(this);
