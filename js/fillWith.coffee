#         $('.target').fillWith({ "PersonalDetails.FirstName" : "Steve" });
#         #$('.target').myPlugin('myMethod', 'Hello, world');
#
(($, window) ->

    # Define the plugin class
    class FillWith

        defaults:
            "PersonalDetails.Honorific" : "",
            "PersonalDetails.FirstName" : "",
            "PersonalDetails.MiddleName" : "",
            "PersonalDetails.LastName" : "",
            "PersonalDetails.BirthDate.Day" : "",
            "PersonalDetails.BirthDate.Month" : "",
            "PersonalDetails.BirthDate.Year" : "",
            "ContactDetails.Emails.Email.Address" : "",
            "AddressDetails.HomeAddress.LevelNumber" : "",
            "AddressDetails.HomeAddress.UnitNumber" : "",
            "AddressDetails.HomeAddress.StreetNumber" : "",
            "AddressDetails.HomeAddress.StreetName" : "",
            "AddressDetails.HomeAddress.StreetType" : "",
            "AddressDetails.HomeAddress.Suburb" : "",
            "AddressDetails.HomeAddress.AdministrativeArea" : "",
            "AddressDetails.HomeAddress.PostalCode" : "",
            "AddressDetails.HomeAddress.Country" : "",
            "AddressDetails.HomeAddress.BuildingName" : "",
            "AddressDetails.PostalAddress.POBox" : "",
            "AddressDetails.PostalAddress.LevelNumber" : "",
            "AddressDetails.PostalAddress.UnitNumber" : "",
            "AddressDetails.PostalAddress.StreetNumber" : "",
            "AddressDetails.PostalAddress.StreetName" : "",
            "AddressDetails.PostalAddress.StreetType" : "",
            "AddressDetails.PostalAddress.Suburb" : "",
            "AddressDetails.PostalAddress.AdministrativeArea" : "",
            "AddressDetails.PostalAddress.PostalCode" : "",
            "AddressDetails.PostalAddress.Country" : "",
            "AddressDetails.PostalAddress.BuildingName" : "",
            "AddressDetails.BillingAddress.POBox" : "",
            "AddressDetails.BillingAddress.LevelNumber" : "",
            "AddressDetails.BillingAddress.UnitNumber" : "",
            "AddressDetails.BillingAddress.StreetNumber" : "",
            "AddressDetails.BillingAddress.StreetName" : "",
            "AddressDetails.BillingAddress.StreetType" : "",
            "AddressDetails.BillingAddress.Suburb" : "",
            "AddressDetails.BillingAddress.AdministrativeArea" : "",
            "AddressDetails.BillingAddress.PostalCode" : "",
            "AddressDetails.BillingAddress.Country" : "",
            "AddressDetails.WorkAddress.POBox" : "",
            "AddressDetails.WorkAddress.LevelNumber" : "",
            "AddressDetails.WorkAddress.UnitNumber" : "",
            "AddressDetails.WorkAddress.StreetNumber" : "",
            "AddressDetails.WorkAddress.StreetName" : "",
            "AddressDetails.WorkAddress.StreetType" : "",
            "AddressDetails.WorkAddress.Suburb" : "",
            "AddressDetails.WorkAddress.AdministrativeArea" : "",
            "AddressDetails.WorkAddress.PostalCode" : "",
            "AddressDetails.WorkAddress.Country" : ""


        selectors:
            "PersonalDetails.Honorific" : [],
            "PersonalDetails.FirstName" : [
                (_) ->
                    _.find("input:regex(name,(^first.*name$|^name$))")
                    .add _find _.find("label:regex(text:,^first\\s*name$)").attr "for"
                ],
            "PersonalDetails.MiddleName" : [],
            "PersonalDetails.LastName" : [],
            "PersonalDetails.BirthDate.Day" : [],
            "PersonalDetails.BirthDate.Month" : [],
            "PersonalDetails.BirthDate.Year" : [],
            "ContactDetails.Emails.Email.Address" : [],
            "AddressDetails.HomeAddress.LevelNumber" : [],
            "AddressDetails.HomeAddress.UnitNumber" : [],
            "AddressDetails.HomeAddress.StreetNumber" : [],
            "AddressDetails.HomeAddress.StreetName" : [],
            "AddressDetails.HomeAddress.StreetType" : [],
            "AddressDetails.HomeAddress.Suburb" : [],
            "AddressDetails.HomeAddress.AdministrativeArea" : [],
            "AddressDetails.HomeAddress.PostalCode" : [],
            "AddressDetails.HomeAddress.Country" : [],
            "AddressDetails.HomeAddress.BuildingName" : [],
            "AddressDetails.PostalAddress.POBox" : [],
            "AddressDetails.PostalAddress.LevelNumber" : [],
            "AddressDetails.PostalAddress.UnitNumber" : [],
            "AddressDetails.PostalAddress.StreetNumber" : [],
            "AddressDetails.PostalAddress.StreetName" : [],
            "AddressDetails.PostalAddress.StreetType" : [],
            "AddressDetails.PostalAddress.Suburb" : [],
            "AddressDetails.PostalAddress.AdministrativeArea" : [],
            "AddressDetails.PostalAddress.PostalCode" : [],
            "AddressDetails.PostalAddress.Country" : [],
            "AddressDetails.PostalAddress.BuildingName" : [],
            "AddressDetails.BillingAddress.POBox" : [],
            "AddressDetails.BillingAddress.LevelNumber" : [],
            "AddressDetails.BillingAddress.UnitNumber" : [],
            "AddressDetails.BillingAddress.StreetNumber" : [],
            "AddressDetails.BillingAddress.StreetName" : [],
            "AddressDetails.BillingAddress.StreetType" : [],
            "AddressDetails.BillingAddress.Suburb" : [],
            "AddressDetails.BillingAddress.AdministrativeArea" : [],
            "AddressDetails.BillingAddress.PostalCode" : [],
            "AddressDetails.BillingAddress.Country" : [],
            "AddressDetails.WorkAddress.POBox" : [],
            "AddressDetails.WorkAddress.LevelNumber" : [],
            "AddressDetails.WorkAddress.UnitNumber" : [],
            "AddressDetails.WorkAddress.StreetNumber" : [],
            "AddressDetails.WorkAddress.StreetName" : [],
            "AddressDetails.WorkAddress.StreetType" : [],
            "AddressDetails.WorkAddress.Suburb" : [],
            "AddressDetails.WorkAddress.AdministrativeArea" : [],
            "AddressDetails.WorkAddress.PostalCode" : [],
            "AddressDetails.WorkAddress.Country" : []

        constructor: (el, options) ->
            @options = $.extend({}, @defaults, options)
            @$el = $(el)
            @selectors = @selectors

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

            $.each data.options, (opt, val) ->
                if data.selectors[opt].length
                    el = data.selectors[opt] $this
                    el.css({'background-color' : '#00CC99'});
                    console.log el

) window.jQuery, window
