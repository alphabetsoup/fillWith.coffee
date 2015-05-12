#         $('.mug').fillWith({ "PersonalDetails.FirstName" : "Steve" });
#
(($, window) ->

    class InputMatcher
        constructor: (@name, @_match_fn, @_populate_fn) ->
        match: (_) ->
            #$([])
            @_match_fn _
        populate: (v) ->
            @_populate_fn v

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
                    _.find("input:regex(name,^(honorific|prefix)$))").add _.find _.find("label:regex(text:,^(honorific|prefix)$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "PersonalDetails.FirstName", ((_) ->
                    _.find("input:regex(name,(^first.*name$|^name$))")
                    .add _.find _.find("label:regex(text:,^first\\s*name$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find("input:regex(name,(^middle.*names?$))")
                    .add _.find _.find("label:regex(text:,^middle\\s*names?$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "PersonalDetails.MiddleName", ((_) ->
                    _.find("input:regex(name,(^(?middle.*)initial$))")
                    .add _.find _.find("label:regex(text:,^middle\\s*names?$)").attr "for"
                ), (v) ->
                    console.log "Initial "
                    console.log v
                    v.substring 0, 1
            )
            new InputMatcher(
                "PersonalDetails.LastName", ((_) ->
                    _.find("input:regex(name,(^middle.*names?$))")
                    .add _.find _.find("label:regex(text:,^last\\s*names?$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Day", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Month", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "PersonalDetails.BirthDate.Year", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "ContactDetails.Emails.Email.Address", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.LevelNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.UnitNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.StreetNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.StreetName", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.StreetType", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.Suburb", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.AdministrativeArea", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.PostalCode", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.Country", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.HomeAddress.BuildingName", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.POBox", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.LevelNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.UnitNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.StreetNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.StreetName", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.StreetType", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.Suburb", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.AdministrativeArea", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.PostalCode", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.Country", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.PostalAddress.BuildingName", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.POBox", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.LevelNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.UnitNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.StreetNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.StreetName", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.StreetType", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.Suburb", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.AdministrativeArea", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.PostalCode", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.BillingAddress.Country", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.POBox", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.LevelNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.UnitNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.StreetNumber", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.StreetName", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.StreetType", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.Suburb", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.AdministrativeArea", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.PostalCode", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
            new InputMatcher(
                "AddressDetails.WorkAddress.Country", ((_) ->
                    _.find("input:regex(name,^$))").add _.find _.find("label:regex(text:,^$)").attr "for"
                ), (v) ->
                    v
            )
        ]

        constructor: (el, options) ->
            @options = $.extend({}, @defaults, options)
            @$el = $(el)

        # Additional plugin methods go here
        # myMethod: (echo) ->
        #     @$el.html(@options.paramA + ': ' + echo)


    # Define the plugin
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
                    if el.is "input"
                        el.val matcher.populate data.options[matcher.name]
                    else if el.is "select"
                        console.log "select not supported"
                else
                    console.log "fillWith option not found: " + matcher.name

) window.jQuery, window
