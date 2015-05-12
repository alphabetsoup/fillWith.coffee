expect = chai.expect

testdata =
    "PersonalDetails.Honorific" : "Mr."
    "PersonalDetails.FirstName" : "Steve"
    "PersonalDetails.MiddleName" : "Roberto"
    "PersonalDetails.LastName" : "McQueen"
    "PersonalDetails.BirthDate.Day" : "12"
    "PersonalDetails.BirthDate.Month" : "05"
    "PersonalDetails.BirthDate.Year" : "1973"
    "ContactDetails.Emails.Email.Address" : "steve@mcqueen.com"
    "AddressDetails.HomeAddress.LevelNumber" : ""
    "AddressDetails.HomeAddress.UnitNumber" : ""
    "AddressDetails.HomeAddress.StreetNumber" : "27"
    "AddressDetails.HomeAddress.StreetName" : "Oakmont"
    "AddressDetails.HomeAddress.StreetType" : "DRIVE"
    "AddressDetails.HomeAddress.Suburb" : "Brentwood"
    "AddressDetails.HomeAddress.AdministrativeArea" : "California"
    "AddressDetails.HomeAddress.PostalCode" : "94513"
    "AddressDetails.HomeAddress.Country" : "United States"
    "AddressDetails.HomeAddress.BuildingName" : ""
    "AddressDetails.PostalAddress.POBox" : "555"
    "AddressDetails.PostalAddress.LevelNumber" : ""
    "AddressDetails.PostalAddress.UnitNumber" : ""
    "AddressDetails.PostalAddress.StreetNumber" : "18"
    "AddressDetails.PostalAddress.StreetName" : "Oak"
    "AddressDetails.PostalAddress.StreetType" : "STREET"
    "AddressDetails.PostalAddress.Suburb" : "Los Angeles"
    "AddressDetails.PostalAddress.AdministrativeArea" : "CA"
    "AddressDetails.PostalAddress.PostalCode" : "90096"
    "AddressDetails.PostalAddress.Country" : "United States"
    "AddressDetails.PostalAddress.BuildingName" : ""
    "AddressDetails.BillingAddress.POBox" : ""
    "AddressDetails.BillingAddress.LevelNumber" : "6"
    "AddressDetails.BillingAddress.UnitNumber" : "34"
    "AddressDetails.BillingAddress.StreetNumber" : "1419"
    "AddressDetails.BillingAddress.StreetName" : "Westwood"
    "AddressDetails.BillingAddress.StreetType" : "BOULEVARD"
    "AddressDetails.BillingAddress.Suburb" : "Los Angeles"
    "AddressDetails.BillingAddress.AdministrativeArea" : "CA"
    "AddressDetails.BillingAddress.PostalCode" : "90024"
    "AddressDetails.BillingAddress.Country" : "United States"
    "AddressDetails.WorkAddress.POBox" : ""
    "AddressDetails.WorkAddress.LevelNumber" : ""
    "AddressDetails.WorkAddress.UnitNumber" : "12a"
    "AddressDetails.WorkAddress.StreetNumber" : "100"
    "AddressDetails.WorkAddress.StreetName" : "Universal City"
    "AddressDetails.WorkAddress.StreetType" : "PLAZA"
    "AddressDetails.WorkAddress.Suburb" : "Universal City"
    "AddressDetails.WorkAddress.AdministrativeArea" : "CA"
    "AddressDetails.WorkAddress.PostalCode" : "91608"
    "AddressDetails.WorkAddress.Country" : "United States"
    
verifydata =
    "https://info.bpiexpressonline.com/bpiprod/eolappli.nsf/CreditCardApplicationForm?OpenForm" :
        "PersonalDetails.Honorific" : "input[name='Honorific']"
        "PersonalDetails.FirstName" : "input[name='FirstName']"
        "PersonalDetails.MiddleName" : "input[name='Middlename']"
        "PersonalDetails.LastName" : "input[name='Surname']"
        "PersonalDetails.BirthDate.Day" : "12"
        "PersonalDetails.BirthDate.Month" : "05"
        "PersonalDetails.BirthDate.Year" : "1973"
        "ContactDetails.Emails.Email.Address" : "steve@mcqueen.com"
        "AddressDetails.HomeAddress.LevelNumber" : ""
        "AddressDetails.HomeAddress.UnitNumber" : ""
        "AddressDetails.HomeAddress.StreetNumber" : "27"
        "AddressDetails.HomeAddress.StreetName" : "Oakmont"
        "AddressDetails.HomeAddress.StreetType" : "DRIVE"
        "AddressDetails.HomeAddress.Suburb" : "Brentwood"
        "AddressDetails.HomeAddress.AdministrativeArea" : "California"
        "AddressDetails.HomeAddress.PostalCode" : "94513"
        "AddressDetails.HomeAddress.Country" : "United States"
        "AddressDetails.HomeAddress.BuildingName" : ""
        "AddressDetails.PostalAddress.POBox" : "555"
        "AddressDetails.PostalAddress.LevelNumber" : ""
        "AddressDetails.PostalAddress.UnitNumber" : ""
        "AddressDetails.PostalAddress.StreetNumber" : "18"
        "AddressDetails.PostalAddress.StreetName" : "Oak"
        "AddressDetails.PostalAddress.StreetType" : "STREET"
        "AddressDetails.PostalAddress.Suburb" : "Los Angeles"
        "AddressDetails.PostalAddress.AdministrativeArea" : "CA"
        "AddressDetails.PostalAddress.PostalCode" : "90096"
        "AddressDetails.PostalAddress.Country" : "United States"
        "AddressDetails.PostalAddress.BuildingName" : ""
        "AddressDetails.BillingAddress.POBox" : ""
        "AddressDetails.BillingAddress.LevelNumber" : "6"
        "AddressDetails.BillingAddress.UnitNumber" : "34"
        "AddressDetails.BillingAddress.StreetNumber" : "1419"
        "AddressDetails.BillingAddress.StreetName" : "Westwood"
        "AddressDetails.BillingAddress.StreetType" : "BOULEVARD"
        "AddressDetails.BillingAddress.Suburb" : "Los Angeles"
        "AddressDetails.BillingAddress.AdministrativeArea" : "CA"
        "AddressDetails.BillingAddress.PostalCode" : "90024"
        "AddressDetails.BillingAddress.Country" : "United States"
        "AddressDetails.WorkAddress.POBox" : ""
        "AddressDetails.WorkAddress.LevelNumber" : ""
        "AddressDetails.WorkAddress.UnitNumber" : "12a"
        "AddressDetails.WorkAddress.StreetNumber" : "100"
        "AddressDetails.WorkAddress.StreetName" : "Universal City"
        "AddressDetails.WorkAddress.StreetType" : "PLAZA"
        "AddressDetails.WorkAddress.Suburb" : "Universal City"
        "AddressDetails.WorkAddress.AdministrativeArea" : "CA"
        "AddressDetails.WorkAddress.PostalCode" : "91608"
        "AddressDetails.WorkAddress.Country" : "United States"

$(document).ready ->
    #$("#SelectPage button").click () ->
    #    d = new Date
    #    $("#Testframe").attr "src", $("#SelectPage select").val()+"?"+d.getMinutes()+d.getSeconds()
    #$("#Testframe").on "load", ->
    #    console.log "Attempting to get contents of iframe."
    #    window.iframedom = $("#Testframe").contents()
    #    runTests($("#Testframe").contents(), verifydata[$("#SelectPage select").val()], testdata)
    runTests($(window), verifydata[window.location.href], testdata)

runTests = (doc, verify, data) ->
    # populate form with test data
    doc.fillWith data
    describe "First Name", () ->
        describe "#val()", () ->
            it "should be populated by the test data", () ->
                expect(doc.find(verify["PersonalDetails.FirstName"]).val()).to.equal data["PersonalDetails.FirstName"]
    mocha.run()
