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
        "PersonalDetails.MiddleName" : "input[name='MiddleName']"
        "PersonalDetails.LastName" : "input[name='LastName']"
        "PersonalDetails.BirthDate.Day" : "select[name='BirthDD']"
        "PersonalDetails.BirthDate.Month" : "select[name='BirthMM']"
        "PersonalDetails.BirthDate.Year" : "select[name='BirthYY']"
        "ContactDetails.Emails.Email.Address" : "input[name='EmailAdd']"
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

runTests = (doc, verify, data) ->
    # populate form with test data
    doc.fillWith data
    describe "First Name", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["PersonalDetails.FirstName"]).val()
                .to.equal data["PersonalDetails.FirstName"]
    describe "Middle Name", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["PersonalDetails.MiddleName"]).val()
                .to.equal data["PersonalDetails.MiddleName"]
    describe "Surname", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["PersonalDetails.LastName"]).val()
                .to.equal data["PersonalDetails.LastName"]
    describe "Birthdate Day", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["PersonalDetails.BirthDate.Day"]).val()
                .to.equal data["PersonalDetails.BirthDate.Day"]
    describe "Birthdate Month", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["PersonalDetails.BirthDate.Month"]).val()
                .to.equal data["PersonalDetails.BirthDate.Month"]
    describe "Birthdate Year", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["PersonalDetails.BirthDate.Year"]).val()
                .to.equal data["PersonalDetails.BirthDate.Year"]
    describe "Contact Email", ->
        it "should be populated by the test data", ->
            expect doc.find(verify["ContactDetails.Emails.Email.Address"]).val()
                .to.equal data["ContactDetails.Emails.Email.Address"]
    mocha.run()

$(document).ready ->
    testformurl = if typeof test_staging == "undefined" then window.location.href else "https://info.bpiexpressonline.com/bpiprod/eolappli.nsf/CreditCardApplicationForm?OpenForm"
    $ '<button />'
        .prependTo 'body'
        .text "Run tests"
        .click ->
            runTests $("body"), verifydata[testformurl], testdata
