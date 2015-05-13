#         $('.mug').fillWith({ "PersonalDetails.FirstName" : "Steve" });
#
(($, window) ->

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
                    _.find("input:regex(name,^(honorific|prefix)$)").add _.find _.find("label:regex(text:,^(honorific|prefix)$)").attr "for"
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.FirstName", ((_) ->
                    _.find("input:regex(name,(^first.*name$|^name$))")
                    .add _.find _.find("label:regex(text:,^first\\s*name$)").attr "for"
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find("input:regex(name,(^middle.*names?$))")
                    .add _.find _.find("label:regex(text:,^middle\\s*names?$)").attr "for"
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find("input:regex(name,(^(?=middle.*)initial$))")
                    .add _.find _.find("label:regex(text:,^middle\\s*names?$)").attr "for"
                ), (el,v) ->
                    $(el).val v.substring 0, 1
            )
            new InputMatcher(
                "PersonalDetails.LastName", ((_) ->
                    _.find("input:regex(name,(^middle.*names?$))")
                    .add _.find _.find("label:regex(text:,^last\\s*names?$)").attr "for"
                ), (el,v) ->
                    $(el).val v
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Day", ((_) ->
                    _.find("input:regex(name,^(birth|dob|d\\.o\\.b\\.?).*(dd|d|day|date)$)")
                    .add _.find _.find("label:regex(text:,(birth.*(day|date)|^dob$|^d\\.o\\.b\\.?$))").attr "for"
                ), (el,v) ->
                    if $(el).is "input"
                        $(el).val v
                    else if $(el).is "select"
                        # parse select options
                        $(el).children("option").each (i,e) -> 
                            # try to match numeric only, then alpha, then abbrev alpha
                            daymatch = new Regexp "0?"+v+"$", "gi"
                            res = $(e).val().match daymatch
                            if res.length == 1
                                $(e).prop 'selected', true
                                return false
                            else if res.length > 1
                                console.log "Failed BirthDate.Day match. Option is:"
                                console.log $(e).val()
                                return false
                            true
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
