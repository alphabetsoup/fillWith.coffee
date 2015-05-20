// Generated by CoffeeScript 1.9.2
(function() {
  var getClosestProperty, runTests, testdata, verifydata;

  testdata = {
    "PersonalDetails.Honorific": "Mr.",
    "PersonalDetails.FirstName": "Steve",
    "PersonalDetails.MiddleName": "Roberto",
    "PersonalDetails.LastName": "McQueen",
    "PersonalDetails.BirthDate.Day": "12",
    "PersonalDetails.BirthDate.Month": "05",
    "PersonalDetails.BirthDate.Year": "1973",
    "ContactDetails.Emails.Email.Address": "steve@mcqueen.com",
    "AddressDetails.HomeAddress.LevelNumber": "",
    "AddressDetails.HomeAddress.UnitNumber": "7",
    "AddressDetails.HomeAddress.StreetNumber": "27",
    "AddressDetails.HomeAddress.StreetName": "Oakmont",
    "AddressDetails.HomeAddress.StreetType": "DRIVE",
    "AddressDetails.HomeAddress.Suburb": "Brentwood",
    "AddressDetails.HomeAddress.AdministrativeArea": "California",
    "AddressDetails.HomeAddress.PostalCode": "94513",
    "AddressDetails.HomeAddress.Country": "United States",
    "AddressDetails.HomeAddress.BuildingName": "",
    "AddressDetails.PostalAddress.POBox": "555",
    "AddressDetails.PostalAddress.LevelNumber": "",
    "AddressDetails.PostalAddress.UnitNumber": "",
    "AddressDetails.PostalAddress.StreetNumber": "18",
    "AddressDetails.PostalAddress.StreetName": "Oak",
    "AddressDetails.PostalAddress.StreetType": "STREET",
    "AddressDetails.PostalAddress.Suburb": "Los Angeles",
    "AddressDetails.PostalAddress.AdministrativeArea": "CA",
    "AddressDetails.PostalAddress.PostalCode": "90096",
    "AddressDetails.PostalAddress.Country": "United States",
    "AddressDetails.PostalAddress.BuildingName": "",
    "AddressDetails.BillingAddress.POBox": "",
    "AddressDetails.BillingAddress.LevelNumber": "6",
    "AddressDetails.BillingAddress.UnitNumber": "34",
    "AddressDetails.BillingAddress.StreetNumber": "1419",
    "AddressDetails.BillingAddress.StreetName": "Westwood",
    "AddressDetails.BillingAddress.StreetType": "BOULEVARD",
    "AddressDetails.BillingAddress.Suburb": "Los Angeles",
    "AddressDetails.BillingAddress.AdministrativeArea": "CA",
    "AddressDetails.BillingAddress.PostalCode": "90024",
    "AddressDetails.BillingAddress.Country": "United States",
    "AddressDetails.WorkAddress.POBox": "",
    "AddressDetails.WorkAddress.LevelNumber": "",
    "AddressDetails.WorkAddress.UnitNumber": "12a",
    "AddressDetails.WorkAddress.StreetNumber": "100",
    "AddressDetails.WorkAddress.StreetName": "Universal City",
    "AddressDetails.WorkAddress.StreetType": "PLAZA",
    "AddressDetails.WorkAddress.Suburb": "Universal City",
    "AddressDetails.WorkAddress.AdministrativeArea": "CA",
    "AddressDetails.WorkAddress.PostalCode": "91608",
    "AddressDetails.WorkAddress.Country": "United States"
  };

  verifydata = {
    "https://info.bpiexpressonline.com/bpiprod/eolappli.nsf/CreditCardApplicationForm?OpenForm": {
      "PersonalDetails.Honorific": "input[name='Honorific']",
      "PersonalDetails.FirstName": "input[name='FirstName']",
      "PersonalDetails.MiddleName": "input[name='MiddleName']",
      "PersonalDetails.LastName": "input[name='LastName']",
      "PersonalDetails.BirthDate.Day": "select[name='BirthDD']",
      "PersonalDetails.BirthDate.Month": "select[name='BirthMM']",
      "PersonalDetails.BirthDate.Year": "select[name='BirthYY']",
      "ContactDetails.Emails.Email.Address": "input[name='EmailAdd']",
      "AddressDetails.HomeAddress.Line1": "input[name='ResidenceAdd']",
      "AddressDetails.HomeAddress.Suburb": "input[name='ResidenceAdd2']",
      "AddressDetails.HomeAddress.AdministrativeArea": "input[name='ResidenceAdd1']",
      "AddressDetails.HomeAddress.PostalCode": "select[name='ResidenceAdd3']",
      "AddressDetails.HomeAddress.Country": ""
    },
    "http://www.garnier.com.au/register": {
      "PersonalDetails.Honorific": "input[name='Honorific']",
      "PersonalDetails.FirstName": "input[name='FirstName']",
      "PersonalDetails.MiddleName": "input[name='MiddleName']",
      "PersonalDetails.LastName": "input[name='LastName']",
      "PersonalDetails.BirthDate.Day": "select[name='BirthDD']",
      "PersonalDetails.BirthDate.Month": "select[name='BirthMM']",
      "PersonalDetails.BirthDate.Year": "select[name='BirthYY']",
      "ContactDetails.Emails.Email.Address": "input[name='EmailAdd']",
      "AddressDetails.HomeAddress.Line1": "input[name='main_0$RegisterUserDetails$txtAddress1']",
      "AddressDetails.HomeAddress.Suburb": "input[name='main_0$RegisterUserDetails$txtCity']",
      "AddressDetails.HomeAddress.PostalCode": "input[name='main_0$RegisterUserDetails$txtZipCode']",
      "AddressDetails.HomeAddress.Country": "select[name='main_0$RegisterUserDetails$ddlCountry']"
    },
    "https://www.qantas.com.au/fflyer/do/dyns/joinff": {
      "PersonalDetails.Honorific": "input[name='Honorific']",
      "PersonalDetails.FirstName": "input[name='customerNameGivenName']",
      "PersonalDetails.MiddleName": "input[name='customerNameMiddleInitial']",
      "PersonalDetails.LastName": "input[name='customerNameSurname']",
      "PersonalDetails.BirthDate.Day": "select[name='dobDay']",
      "PersonalDetails.BirthDate.Month": "select[name='dobMonth']",
      "PersonalDetails.BirthDate.Year": "select[name='dobYear']",
      "ContactDetails.Emails.Email.Address": "input[name='emailAddressAddress']",
      "AddressDetails.HomeAddress.Line1": "input[name='postalAddressLine1']",
      "AddressDetails.HomeAddress.Suburb": "nput[name='postalAddressCity']",
      "AddressDetails.HomeAddress.AdministrativeArea": "select[name='postalAddressState']",
      "AddressDetails.HomeAddress.PostalCode": "input[name='postalAddressPostCode']",
      "AddressDetails.HomeAddress.Country": "select[name='homePhoneNumberCountry']",
      "AddressDetails.HomeAddress.BuildingName": ""
    }
  };

  runTests = function(doc, verify, data) {
    var convertMonthToNumber, expect;
    convertMonthToNumber = function(mon) {
      if (typeof mon === 'string' && mon.length) {
        return new Date(Date.parse(mon + " 1, 2015")).getMonth() + 1;
      } else {
        return 0;
      }
    };
    expect = chai.expect;
    describe("Make Address Line 1", function() {
      it("should correctly form an address line with unit", function() {
        return expect(fillWith.makeAddressLine1({
          "AddressDetails.HomeAddress.LevelNumber": "",
          "AddressDetails.HomeAddress.UnitNumber": "1234",
          "AddressDetails.HomeAddress.StreetNumber": "5678",
          "AddressDetails.HomeAddress.StreetName": "Oakmont",
          "AddressDetails.HomeAddress.StreetType": "DRIVE",
          "AddressDetails.HomeAddress.BuildingName": ""
        })).to.equal("U 1234 / 5678 Oakmont DRIVE");
      });
      return it("should correctly form an address line without unit", function() {
        return expect(fillWith.makeAddressLine1({
          "AddressDetails.HomeAddress.LevelNumber": "",
          "AddressDetails.HomeAddress.UnitNumber": "",
          "AddressDetails.HomeAddress.StreetNumber": "5678",
          "AddressDetails.HomeAddress.StreetName": "Oakmont",
          "AddressDetails.HomeAddress.StreetType": "DRIVE",
          "AddressDetails.HomeAddress.BuildingName": ""
        })).to.equal("5678 Oakmont DRIVE");
      });
    });
    describe("Honorific selected option", function() {
      before(function() {
        $('<select name="' + verify['PersonalDetails.Honorific'] + '" id="temptitletest"></select>').append('<option value="MRS">MRS</option>').append('<option value="MR">MR</option>').appendTo('body');
        return $('body').fillWith(data);
      });
      after(function() {
        return $('body').remove('#temptitletest');
      });
      return it("should match correctly in an unusually ordered list", function() {
        $('body').find(verify['PersonalDetails.Honorific']).each;
        return function(i, e) {
          return expect(e.val()).to.equal(data['PersonalDetails.Honorific']);
        };
      });
    });
    doc.fillWith(data);
    describe("First Name", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["PersonalDetails.FirstName"]).val()).to.equal(data["PersonalDetails.FirstName"]);
      });
    });
    describe("Middle Name", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["PersonalDetails.MiddleName"]).val()).to.equal(data["PersonalDetails.MiddleName"]);
      });
    });
    describe("Surname", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["PersonalDetails.LastName"]).val()).to.equal(data["PersonalDetails.LastName"]);
      });
    });
    describe("Birthdate Day", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["PersonalDetails.BirthDate.Day"]).val()).to.equal(data["PersonalDetails.BirthDate.Day"]);
      });
    });
    describe("Birthdate Month", function() {
      return it("should be populated by the test data", function() {
        return expect(convertMonthToNumber(doc.find(verify["PersonalDetails.BirthDate.Month"]).val())).to.equal(convertMonthToNumber(data["PersonalDetails.BirthDate.Month"]));
      });
    });
    describe("Birthdate Year", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["PersonalDetails.BirthDate.Year"]).val()).to.equal(data["PersonalDetails.BirthDate.Year"]);
      });
    });
    describe("Contact Email", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["ContactDetails.Emails.Email.Address"]).val()).to.equal(data["ContactDetails.Emails.Email.Address"]);
      });
    });
    describe("Home Address Line 1", function() {
      return it("should be populated by the test data", function() {
        return expect(doc.find(verify["AddressDetails.HomeAddress.Line1"]).val()).to.equal(fillWith.makeAddressLine1(data));
      });
    });
    return mocha.run();
  };

  getClosestProperty = function(obj, propName) {
    var key, re;
    key = void 0;
    for (key in obj) {
      re = new RegExp(fillWith.escRE(key), 'i');
      if (re.test(propName)) {
        return obj[key];
      }
    }
    return null;
  };

  $(document).ready(function() {
    var fillbox, testformurl;
    testformurl = typeof test_staging === "undefined" ? window.location.href : "https://info.bpiexpressonline.com/bpiprod/eolappli.nsf/CreditCardApplicationForm?OpenForm";
    fillbox = $('<div />').css('margin', '5px').css('border', '1px solid red').css('border-radius', '3px');
    $('<textarea />').attr('id', 'filldata').attr('rows', '5').attr('cols', '40').text('{"PersonalDetails.Honorific":"Mr.","PersonalDetails.FirstName":"Steve","PersonalDetails.MiddleName":"Roberto","PersonalDetails.LastName":"McQueen","PersonalDetails.BirthDate.Day":"12","PersonalDetails.BirthDate.Month":"05","PersonalDetails.BirthDate.Year":"1973","ContactDetails.Emails.Email.Address":"steve@mcqueen.com","AddressDetails.HomeAddress.LevelNumber":"","AddressDetails.HomeAddress.UnitNumber":"","AddressDetails.HomeAddress.StreetNumber":"27","AddressDetails.HomeAddress.StreetName":"Oakmont","AddressDetails.HomeAddress.StreetType":"DRIVE","AddressDetails.HomeAddress.Suburb":"Brentwood","AddressDetails.HomeAddress.AdministrativeArea":"California","AddressDetails.HomeAddress.PostalCode":"94513","AddressDetails.HomeAddress.Country":"United States","AddressDetails.HomeAddress.BuildingName":"","AddressDetails.PostalAddress.POBox":"555","AddressDetails.PostalAddress.LevelNumber":"","AddressDetails.PostalAddress.UnitNumber":"","AddressDetails.PostalAddress.StreetNumber":"18","AddressDetails.PostalAddress.StreetName":"Oak","AddressDetails.PostalAddress.StreetType":"STREET","AddressDetails.PostalAddress.Suburb":"Los Angeles","AddressDetails.PostalAddress.AdministrativeArea":"CA","AddressDetails.PostalAddress.PostalCode":"90096","AddressDetails.PostalAddress.Country":"United States","AddressDetails.PostalAddress.BuildingName":"","AddressDetails.BillingAddress.POBox":"","AddressDetails.BillingAddress.LevelNumber":"6","AddressDetails.BillingAddress.UnitNumber":"34","AddressDetails.BillingAddress.StreetNumber":"1419","AddressDetails.BillingAddress.StreetName":"Westwood","AddressDetails.BillingAddress.StreetType":"BOULEVARD","AddressDetails.BillingAddress.Suburb":"Los Angeles","AddressDetails.BillingAddress.AdministrativeArea":"CA","AddressDetails.BillingAddress.PostalCode":"90024","AddressDetails.BillingAddress.Country":"United States","AddressDetails.WorkAddress.POBox":"","AddressDetails.WorkAddress.LevelNumber":"","AddressDetails.WorkAddress.UnitNumber":"12a","AddressDetails.WorkAddress.StreetNumber":"100","AddressDetails.WorkAddress.StreetName":"Universal City","AddressDetails.WorkAddress.StreetType":"PLAZA","AddressDetails.WorkAddress.Suburb":"Universal City","AddressDetails.WorkAddress.AdministrativeArea":"CA","AddressDetails.WorkAddress.PostalCode":"91608","AddressDetails.WorkAddress.Country":"United States"}').prependTo(fillbox);
    $('<button />').text("Fill with").click(function() {
      var filldata;
      filldata = $.parseJSON($('#filldata').text());
      console.log("Fill data");
      console.log(filldata);
      return $('body').fillWith(filldata);
    }).prependTo(fillbox);
    $('<button />').appendTo(fillbox).text("Run tests (does not use data in the box to the left)").click(function() {
      var vdata;
      vdata = getClosestProperty(verifydata, testformurl);
      if (vdata) {
        return runTests($("body"), vdata, testdata);
      } else {
        $("<div />").text("Could not run tests because this form has no verification data yet. Filling form instead.").css("border", "1px solid #CCCC00").css("border-radius", "5px").appendTo(fillbox).fadeOut(5000);
        return $('body').fillWith(testdata);
      }
    });
    return fillbox.prependTo('body');
  });

}).call(this);
