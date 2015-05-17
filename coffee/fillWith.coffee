# Extend jQuery selectors with regex
jQuery.expr[':'].regex = (elem, index, match) ->
  matchParams = match[3].split(',')
  validLabels = /^(data|css|text):/
  attr =
    method: if matchParams[0].match(validLabels) then matchParams[0].split(':')[0] else 'attr'
    property: matchParams.shift().replace(validLabels, '')
  regexFlags = 'ig'
  regex = new RegExp(matchParams.join('').replace(/^s+|s+$/g, ''), regexFlags)
  if attr.method != 'text' then regex.test(jQuery(elem)[attr.method](attr.property)) else regex.test(jQuery(elem)[attr.method]())

# Create a root fillWjth object for static helpers
window.fillWith =
    in: (k,o) -> k of o && o[k] && o[k].length
    makeAddressLine1: (data) ->
        # street address line should fill in the format 'U 23 / 222 Chapel Street'
        # ensure relevant data exists
        line = ""
        usefields =
            ln: "AddressDetails.HomeAddress.LevelNumber"
            un: "AddressDetails.HomeAddress.UnitNumber"
            so: "AddressDetails.HomeAddress.StreetNumber"
            sn: "AddressDetails.HomeAddress.StreetName"
            st: "AddressDetails.HomeAddress.StreetType"
            bn: "AddressDetails.HomeAddress.BuildingName"
        useslash = false
        if fillWith.in usefields.un, data
            line += "U " + data[usefields.un] + " "
            useslash = true
        if fillWith.in usefields.ln, data
            line += "L " + data[usefields.ln] + " "
            useslash = true
        if useslash
            line += "/ "
        if fillWith.in usefields.so, data
            line += data[usefields.so] + " "
        else if fillWith.in usefields.bn, data
            line += data[usefields.bn] + " "
        if fillWith.in usefields.sn, data
            line += data[usefields.sn] + " "
            if fillWith.in usefields.st, data
                line += data[usefields.st]
        # remove trailing space
        line.replace /\s+$/g, ""

# Escape a string for injection into a RegExp
escRE = (str) ->
      str.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"

##
# @name           InputMatcher
# @description    Matches an input using a match callback and 
#                 populates an element using a populate callback and
#                 a standard list of input data
# @usage          new InputMatcher data.input | [data.input1,data.input2], (match), (el,vals)
# @author         Laurence Davies
# @todo           Use a better match function.
#                 Propose to use a multi-pass matcher
#                   1) Use a loose jQuery input/select + regex selector to obtain
#                      a list of likely fields.
#                        { include: 
#                           {input: <regex_string>, select: <re_s>, label_for: <re_s>}, 
#                           exclude: {input: <re_s>, etc}
#                        }
#                   2) Evaluate likelihood of each field using an n-gram style weight
#                      applied to the field name and surrounding html elements.
#                      Can use negative weights
#                   3) Return the first n largest matches, where n is specified 
#                      (usually 1).
class InputMatcher
    constructor: (@names, @_match_fn, @_match_options, @_populate_fn) ->
        @_match_options = $.extend { include: { }, exclude: { } }, @_match_options
    hasFields: (fields) ->
        if typeof fields is not 'array' then throw new "hasFields requires array as first argument."
        if typeof @names is 'string'
            return fillWith.in @names, fields
        else if $.isArray @names
            return 0 < $.map @names, (n) ->
                if fillWith.in n, fields then return true else return undefined
            .length
    match: (_) ->
        mm = @_match_fn _
        #console.log @names
        #console.log mm
        #m = mm.first()
        #console.log m
        mm
    match2: (_) ->
        res = $ []
        $.each @_match_options.include, (i,e) ->
            if i == "label_for"
                res = res.add _.find _.find("label:regex(text:,"+e+")").attr "for"
            else
                res = res.add _.find i+":regex(name,"+e+")"
            true
        $.each @_match_options.exclude, (i,e) ->
            if i == "label_for"
                res = res.not res.find("label:regex(text:,"+e+")").attr "for"
            else
                res = res.not "input:regex(name,"+e+")"
            true
        res
    populate: (el,v) ->
        # pass either a single string or a hash of keys/values to pop fn
        if typeof @names is 'string'
            return @_populate_fn el, v[@names]
        else if $.isArray @names
            vals = {}
            $.each @names, (i,n) ->
                vals[n]=v[n]
                true
            return @_populate_fn el, vals


#         $('.mug').fillWith({ "PersonalDetails.FirstName" : "Steve" });
#
(($, window) ->

    class FillWith

        defaults:
            "PersonalDetails.Honorific" : ""
            "PersonalDetails.FirstName" : ""
            "PersonalDetails.MiddleName" : ""
            "PersonalDetails.LastName" : ""
            "PersonalDetails.BirthDate.Day" : ""
            "PersonalDetails.BirthDate.Month" : ""
            "PersonalDetails.BirthDate.Year" : ""
            "ContactDetails.Emails.Email.Address" : ""
            "AddressDetails.HomeAddress.LevelNumber" : ""
            "AddressDetails.HomeAddress.UnitNumber" : ""
            "AddressDetails.HomeAddress.StreetNumber" : ""
            "AddressDetails.HomeAddress.StreetName" : ""
            "AddressDetails.HomeAddress.StreetType" : ""
            "AddressDetails.HomeAddress.Suburb" : ""
            "AddressDetails.HomeAddress.AdministrativeArea" : ""
            "AddressDetails.HomeAddress.PostalCode" : ""
            "AddressDetails.HomeAddress.Country" : ""
            "AddressDetails.HomeAddress.BuildingName" : ""
            "AddressDetails.PostalAddress.POBox" : ""
            "AddressDetails.PostalAddress.LevelNumber" : ""
            "AddressDetails.PostalAddress.UnitNumber" : ""
            "AddressDetails.PostalAddress.StreetNumber" : ""
            "AddressDetails.PostalAddress.StreetName" : ""
            "AddressDetails.PostalAddress.StreetType" : ""
            "AddressDetails.PostalAddress.Suburb" : ""
            "AddressDetails.PostalAddress.AdministrativeArea" : ""
            "AddressDetails.PostalAddress.PostalCode" : ""
            "AddressDetails.PostalAddress.Country" : ""
            "AddressDetails.PostalAddress.BuildingName" : ""
            "AddressDetails.BillingAddress.POBox" : ""
            "AddressDetails.BillingAddress.LevelNumber" : ""
            "AddressDetails.BillingAddress.UnitNumber" : ""
            "AddressDetails.BillingAddress.StreetNumber" : ""
            "AddressDetails.BillingAddress.StreetName" : ""
            "AddressDetails.BillingAddress.StreetType" : ""
            "AddressDetails.BillingAddress.Suburb" : ""
            "AddressDetails.BillingAddress.AdministrativeArea" : ""
            "AddressDetails.BillingAddress.PostalCode" : ""
            "AddressDetails.BillingAddress.Country" : ""
            "AddressDetails.WorkAddress.POBox" : ""
            "AddressDetails.WorkAddress.LevelNumber" : ""
            "AddressDetails.WorkAddress.UnitNumber" : ""
            "AddressDetails.WorkAddress.StreetNumber" : ""
            "AddressDetails.WorkAddress.StreetName" : ""
            "AddressDetails.WorkAddress.StreetType" : ""
            "AddressDetails.WorkAddress.Suburb" : ""
            "AddressDetails.WorkAddress.AdministrativeArea" : ""
            "AddressDetails.WorkAddress.PostalCode" : ""
            "AddressDetails.WorkAddress.Country" : ""


        matchers: [
            new InputMatcher(
                "PersonalDetails.Honorific", ((_) ->
                    _.find "input:regex(name,honorific|prefix|title)"
                    .add _.find "select:regex(name,honorific|prefix|title)"
                    .add _.find _.find("label:regex(text:,honorific|prefix|title)").attr "for"
                ), {
                     include:
                         input: "honorific|prefix|title"
                         select: "honorific|prefix|title"
                         label_for: "honorific|prefix|title"
                     exclude:
                         input: "sp|sup"
                         label_for: "spouse|supplementary"
                }, (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        # parse select options
                        $(el).children("option").each (i,e) ->
                            # try to match numeric only, then alpha, then abbrev alpha
                            titlematch = new RegExp "^"+escRE(v)+"[^A-Za-z]?$", "gi"
                            res = $(e).val().match titlematch
                            if !res
                                return true
                            if res.length == 1
                                $(e).prop 'selected', true
                                return false
                            else if res.length > 1
                                console.log "Failed Honorific match. Option is:"
                                console.log $(e).val()
                                return false
            )
            new InputMatcher(
                "PersonalDetails.FirstName", ((_) ->
                    _.find "input:regex(name,((first|given).*name|^name$))"
                    .add _.find _.find("label:regex(text:,(first|given)\\s*name)").attr "for"
                ), {
                     include:
                         input: "((first|given).*name|^name$)"
                         label_for: "(first|given)\\s*name"
                     exclude:
                         input: "sp|sup"
                         label_for: "spouse|supplementary"
                }, (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find "input:regex(name,middle.*names?)"
                    .add _.find _.find("label:regex(text:,middle.*names?)").attr "for"
                ), {
                     include:
                         input: "middle.*names?"
                         label_for: "middle.*names?"
                     exclude:
                         input: "sp|sup"
                         label_for: "spouse|supplementary"
                }, (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find "input:regex(name,((middle.*|^)initials?))"
                    .add _.find _.find("label:regex(text:,(middle.*|^)initials?)").attr "for"
                ), {
                     include:
                         input: "((middle.*|^)initials?)"
                         label_for: "((middle.*|^)initials?)"
                     exclude:
                         input: "sp|sup"
                         label_for: "spouse|supplementary"
                }, (el,v) ->
                    $(el).val v.substring 0, 1
            )
            new InputMatcher(
                "PersonalDetails.LastName", ((_) ->
                    _.find "input:regex(name,(last|sur).*names?)"
                    .add _.find _.find("label:regex(text:,(last|sur)\\s*names?)").attr "for"
                ), {
                     include:
                         input: "(last|sur).*names?"
                         label_for: "(last|sur)\\s*names?"
                     exclude:
                         input: "sp|sup"
                         label_for: "spouse|supplementary"
                }, (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Day", ((_) ->
                    _.find "input:regex(name,(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date))"
                    .add _.find "select:regex(name,(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)$)"
                    .add _.find _.find("label:regex(text:,(birth.*(day|date)|^dob$|^d\\.o\\.b\\.?$))").attr "for"
                ), {
                     include:
                         input: "(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)"
                         select: "(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)"
                         label_for: "(birth.*(day|date)|^dob$|^d\\.o\\.b\\.?$)"
                }, (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        # parse select options
                        $(el).children("option").each (i,e) -> 
                            # try to match numeric only
                            daymatch = new RegExp "0?"+escRE(v)+"$", "gi"
                            res = $(e).val().match daymatch
                            if !res
                                return true
                            else if res.length == 1
                                $(e).prop 'selected', true
                                return false
                            else if res.length > 1
                                console.log "Failed BirthDate.Day match. Option is:"
                                console.log $(e).val()
                                return false
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Month", ((_) ->
                    _.find("input:regex(name,(birth|dob|d\\.o\\.b\\.?).*(mm|m|month))")
                    .add _.find("select:regex(name,(birth|dob|d\\.o\\.b\\.?).*(mm|m|month))")
                    .add _.find _.find("label:regex(text:,(birth.*(month|mm)|^dob$|^d\\.o\\.b\\.?$))").attr "for"
                ), {
                     include:
                         input: "(birth|dob|d\\.o\\.b\\.?).*(mm|m|month)"
                         select: "(birth|dob|d\\.o\\.b\\.?).*(mm|m|month)"
                         label_for: "(birth.*(month|mm)|^dob$|^d\\.o\\.b\\.?$)"
                }, (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        months_a = [
                                'jan'
                                'feb'
                                'mar'
                                'apr'
                                'may'
                                'jun'
                                'jul'
                                'aug'
                                'sep'
                                'oct'
                                'nov'
                                'dec'
                        ]
                        month_a_v = months_a[parseInt(v,10)-1]
                        # parse select options
                        $(el).children("option").each (i,e) ->
                            # try to match numeric only, then alpha/abbrev alpha

                            monthmatch = new RegExp "^0?"+escRE(v)+"$|^"+month_a_v, "gi"
                            res = $(e).val().match monthmatch

                            month_a_el_v = months_a[parseInt($(e).val(),10)-1]
                            if month_a_el_v?
                                monthmatch2 = new RegExp "^0?"+escRE($(e).val())+"$|^"+month_a_el_v, "gi"
                            else
                                monthmatch2 = new RegExp "^0?"+escRE($(e).val())+"$", "gi"
                            res2 = v.match monthmatch2
                            res = if res then res else []
                            res2 = if res2 then res2 else []
                            res = $.merge res, res2
                            if !res
                                return true
                            else if res.length >= 1
                                $(e).prop 'selected', true
                                return false
                            #else if res.length > 1
                            #   console.log "Failed BirthDate.Month match. Option is:"
                            #    console.log $(e).val()
                            #    return false
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Year", ((_) ->
                    _.find("input:regex(name,(birth|dob|d\\.o\\.b\\.?).*(yy|y|year))")
                    .add _.find("select:regex(name,(birth|dob|d\\.o\\.b\\.?).*(yy|y|year))")
                    .add _.find _.find("label:regex(text:,year|^dob$|^d\\.o\\.b\\.?)").attr "for"
                ), {
                     include:
                         input: "(birth|dob|d\\.o\\.b\\.?).*(yy|y|year)"
                         select: "(birth|dob|d\\.o\\.b\\.?).*(yy|y|year)"
                         label_for: "year|^dob$|^d\\.o\\.b\\.?"
                }, (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        # parse select options
                        $(el).children("option").each (i,e) ->
                            # try to match numeric only
                            yearmatch = new RegExp "^"+escRE(v)+"$", "gi"
                            res = $(e).val().match yearmatch
                            if !res
                                return true
                            else if res.length == 1
                                $(e).prop 'selected', true
                                return false
                            else if res.length > 1
                                console.log "Failed BirthDate.Year match. Option is:"
                                console.log $(e).val()
                                return false
            )
            new InputMatcher(
                [
                    "AddressDetails.HomeAddress.LevelNumber"
                    "AddressDetails.HomeAddress.UnitNumber"
                    "AddressDetails.HomeAddress.StreetNumber"
                    "AddressDetails.HomeAddress.StreetName"
                    "AddressDetails.HomeAddress.StreetType"
                    "AddressDetails.HomeAddress.BuildingName"
                ]
                , ((_) ->
                    _.find "input:regex(name,(add|address))"
                    .add _.find _.find("label:regex(text:,(add|address))").attr "for"
                ), {
                     include:
                         input: "add|address"
                         label_for: "add|address"
                     exclude:
                         input: "permanent|postal|(2|two)|billing|suburb|city"
                         label_for: "permanent|postal|(2|two)|billing|suburb|city"
                }, (el,vals) ->
                    $(el).val fillWith.makeAddressLine1 vals
            )
            new InputMatcher(
                "ContactDetails.Emails.Email.Address", ((_) ->
                    _.find "input:regex(name,email|^eadd)"
                    .add _.find _.find("label:regex(text:,email|^eadd)").attr "for"
                ), {
                     include:
                         input: "email|^eadd"
                         label_for: "email"
                }, (el,v) ->
                    $(el).val v
            )
        ]

        constructor: (el, options) ->
            @options = $.extend({}, @defaults, options)
            @$el = $(el)


    $.fn.extend fillWith: (option, args...) ->
        @each ->
            $this = $(this)
            data = $this.data('fillWith')

            if !data
                $this.data 'fillWith', (data = new FillWith(this, option))
            if typeof option == 'string'
                data[option].apply(data, args)

            $.each data.matchers, (_, matcher) ->
                el = matcher.match2 $this
                el.css({'background-color' : '#00CC99'})
                if matcher.hasFields data.options
                    # set the value
                    $(el).each (i,e) ->
                        matcher.populate e, data.options
                else
                    console.log "fillWith option not found: "
                    console.log matcher.names

) window.jQuery, window
