#         $('.mug').fillWith({ "PersonalDetails.FirstName" : "Steve" });
#
(($, window) ->

    # Escape a string for injection into a RegExp
    escRE = (str) ->
          str.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"

    class InputMatcher
        constructor: (@name, @_match_fn, @_populate_fn) ->
        match: (_) ->
            #$([])
            @_match_fn _
        populate: (el,v) ->
            @_populate_fn el,v

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
                ), (el,v) ->
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
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find "input:regex(name,middle.*names?)"
                    .add _.find _.find("label:regex(text:,middle.*names?)").attr "for"
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find "input:regex(name,((middle.*|^)initials?))"
                    .add _.find _.find("label:regex(text:,(middle.*|^)initials?)").attr "for"
                ), (el,v) ->
                    $(el).val v.substring 0, 1
            )
            new InputMatcher(
                "PersonalDetails.LastName", ((_) ->
                    _.find "input:regex(name,(last|sur).*names?)"
                    .add _.find _.find("label:regex(text:,(last|sur)\\s*names?)").attr "for"
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Day", ((_) ->
                    _.find "input:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)$)"
                    .add _.find "select:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)$)"
                    .add _.find _.find("label:regex(text:,(birth.*(day|date)|^dob$|^d\\.o\\.b\\.?$))").attr "for"
                ), (el,v) ->
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
                    _.find("input:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(mm|m|month)$)")
                    .add _.find("select:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(mm|m|month)$)")
                    .add _.find _.find("label:regex(text:,(birth.*(month|mm)|^dob$|^d\\.o\\.b\\.?$))").attr "for"
                ), (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        # parse select options
                        $(el).children("option").each (i,e) ->
                            # try to match numeric only, then alpha/abbrev alpha
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
                            monthmatch = new RegExp "^0?"+v+"$|^"+months_a[parseInt v, 10], "gi"
                            res = $(e).val().match monthmatch
                            if !res
                                return true
                            else if res.length == 1
                                $(e).prop 'selected', true
                                return false
                            else if res.length > 1
                                console.log "Failed BirthDate.Month match. Option is:"
                                console.log $(e).val()
                                return false
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Year", ((_) ->
                    _.find("input:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(yy|y|year)$)")
                    .add _.find("select:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(yy|y|year)$)")
                    .add _.find _.find("label:regex(text:,year|^dob$|^d\\.o\\.b\\.?$)").attr "for"
                ), (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        # parse select options
                        $(el).children("option").each (i,e) ->
                            # try to match numeric only
                            yearmatch = new RegExp "^"+v+"$", "gi"
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

            console.log data.matchers

            $.each data.matchers, (_, matcher) ->
                console.log matcher
                el = matcher.match $this
                el.css({'background-color' : '#00CC99'})
                if data.options[matcher.name]
                    # set the value
                    matcher.populate el, data.options[matcher.name]
                    #if el.is "input"
                    #else if el.is "select"
                    #    console.log "select not supported"
                else
                    console.log "fillWith option not found: " + matcher.name

) window.jQuery, window