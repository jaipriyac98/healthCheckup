//
//  Extension + String.swift
//  BettingApp
//
//  Created by Sri Ramakrishnan on 12/09/21.
//

import Foundation
import UIKit


enum ErrorMessage: String {
  
  case invalidEmptyEmail = "Please enter a email ID"
  case fieldEmpty = "Field is Empty"
  case invalidEmail = "Please enter a valid email"
  case invalidPassword = "* Atleast one upper case and one lower case letter\n* Atleast one number\n* Atleast one special letter\n* Be at least 8 characters"
  case invalidPasswordLengh = "must be 12 numbers"
  case invalidEmptyPassword = "Please enter a Password"
  case invalidPasswordRange = "Please enter a Password must contain at least 6 Characters"
  case invalidcompanyname = "Please enter the company name"
  case invalidcompanysite = "Please enter the company site"
  case invalidcompanysiteURL = "Please enter the valid company site"
  case invalidsubscriptionplan = "Please enter the subscriptionplan"
  case invalidaccountemail = "Please enter the accountemail"
  case invalidconfirmpassword = "Please enter the confirmpassword"
  case invalidPasswordMismatch = "Password doesn't match"
  case invalidCompanyName = "Please enter a valid Companyname"
  case invalidCompanySite = "Please enter a valid Companysite"
  case invalidSubscriptionPlan = "Please enter a valid Subscriptionplan"
  case invalidAccountEmail = "please enter a valid Account"
  case invalidEnterPassword = "please enter a  valid Newpassword"
  case invalidConfirmNewPassword = "please enter a  valid ConfirmNewPassword"
  case invalidPropertyCode = "please enter a valid PropertyCode"
  case invalidEmptyCurrentPassword = "Please enter a valid Current Password"
  case invalidEmptyNewPassword = "Please enter a valid New Password"
  case invalidEmptyConformNewPassword = "Please enter a valid Conform New Password"
  
  case invalidEmptyLocation = "Please select a Location"
  case invalidEmptyLocationNumber = "Please select a Location ContactNumber"
  case invalidEmptyTicketNumber = "Please enter a TicketNumber"
  case invalidEmptyArrival = "Please select a Arrival Date"
  case invalidEmptyRequest = "Please select a Request Date"
  case invalidEmptyCustomerName = "Please enter a CustomerName"
  case invalidEmptyCustomerPhone = "Please enter a CustomerPhone"
  case invalidEmptyCustomerEmail = "Please enter a CustomerEmail"
  case invalidEmptyVehicleMakeName = "Please select a VehicleMakeName"
  case invalidEmptyVehicleModel = "Please select a vehicleModel"
  case invalidEmptyVehicleLicensePlate = "Please enter a vehicleLicensePlate"
  case invalidEmptyDateOfReport = "Please select a dateOfReport Date"
  case invalidEmptyTimeOfReport = "Please select a TimeOfReport"
  case invalidEmptyRental = "Please select a rental"
  case invalidEmptyDamageArea = "Please select a DamageArea"
  case invalidEmptyVehicleColor = "Please select a Vehicle Color"
  case invalidEmptyVehicleImage = "Please Add a Vehicle Image"
  case invalidEmptySignature = "Please Add a Signature Image"
  case invalidEmptyRentalCarCompany = "Please enter a RentalCar Company"
  
  
  case invalidEmptyAddress = "Please enter the Address"
  case invalidEmptyState = "Please enter the State"
  case invalidEmptyCity = "Please enter the City"
  case invalidEmptyZip = "Please enter the Zip"
  
  case invalidEmptyVehicleYear = "Please enter the VehicleYear"
  case invalidEmptyVehicleLicensePlateState = "Please enter the VehicleLicensePlateState"
  case invalidEmptyLast6NumberOfVin = "Please enter the Last6NumberOfVin"
  case invalidLast6NumberOfVinRange = "Please enter a Vin must contain at least 6 Characters"
  
}




extension String {
//    var isPhonenumberValid : Bool {
//        do {
//            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
//            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
//            if let res = matches.first {
//                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count <= 12
//            } else{
//                return false
//            }
//        } catch {
//            return false
//        }
//    }

    var isPhonenumberValid: Bool {
           // let phoneRegex = "^[+]?[0-9]{8,8}$"
            let phoneRegex = "^\\d{8}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: self)
        }
    
    var isRegPhonenumberValid: Bool {
            let phoneRegex = "^\\d{8}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: self)
        }
    
    var isPasswordValid: Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let passwordtest = NSPredicate(format: "SELF MATCHES %@",passwordRegex)
        return passwordtest.evaluate(with: self)
    }
    var isValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidUserName: Bool{
        let UserNameRegEx = "^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*${3,50}"
        let UserNameTest = NSPredicate(format: "SELF MATCHES %@", UserNameRegEx)
        return UserNameTest.evaluate(with: self)
    }
    
    
}

// SignUpPage Password Strength Validation
extension String {
    var isRegValidSmallLetter:Bool{
        let inputRegEx = "[a-z]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidCapitalLetter:Bool {
        let inputRegEx = "[A-Z]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidNumbers:Bool {
        let inputRegEx = "[0-9]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegSpecialChar:Bool {
        let inputRegEx = "[!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegSpecialSmall:Bool {
        let inputRegEx = "[a-z!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegSpecialCapital:Bool {
        let inputRegEx = "[A-Z!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegSpecialNumber:Bool {
        let inputRegEx = "[0-9!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidSmallNumber:Bool {
        let inputRegEx = "[a-z0-9]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidCapitalNumber:Bool {
        let inputRegEx = "[A-Z0-9]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidSmallCapital:Bool {
        let inputRegEx = "[A-Za-z]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidSmallCapitalNumber:Bool {
        let inputRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{5,7}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    var isRegValidSmallCapitalSpecialcharNumber:Bool {
        let inputRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
}

// Changepassword Page Password Strength Validation

extension String {
    var isValidSmallLetter:Bool {
        let inputRegEx = "[a-z]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidCapitalLetter:Bool {
        let inputRegEx = "[A-Z]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidNumbers:Bool {
        let inputRegEx = "[0-9]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isSpecialChar:Bool {
        let inputRegEx = "[!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isSpecialSmall:Bool {
        let inputRegEx = "[a-z!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isSpecialCapital:Bool {
        let inputRegEx = "[A-Z!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isSpecialNumber:Bool {
        let inputRegEx = "[0-9!.*&^%$#@()/]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidSmallNumber:Bool {
        let inputRegEx = "[a-z0-9]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidCapitalNumber:Bool {
        let inputRegEx = "[A-Z0-9]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidSmallCapital:Bool {
        let inputRegEx = "[A-Za-z]+"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidSmallCapitalNumber:Bool {
        let inputRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{5,7}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
    var isValidSmallCapitalSpecialcharNumber:Bool {
        let inputRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
      }
}





extension String {
 func processDate(string: String, fromFormat: String, toFormat: String) -> String? {
  let formatter = DateFormatter()
  formatter.dateFormat = fromFormat
  guard let date = formatter.date(from: string) else { return nil }
  formatter.dateFormat = toFormat
  return formatter.string(from: date)
 }
}
