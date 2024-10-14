//
//  String+Validation.swift
//  Belly
//
//  Created by Madasamy Prasath on 3/13/19.
//  Copyright © 2019 VTMTech. All rights reserved.
//

import UIKit

extension String {
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    
    var isEmail: Bool {
            let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    //validate Password
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{5,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    var isValidContact: Bool {
//        let phoneNumberRegex = "^[6-9]\\d{10}$"
//        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
//        let isValidPhone = phoneTest.evaluate(with: self)
//        return isValidPhone
        
        let PHONE_REGEX = "[0-9]{9,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let isValidPhone =  phoneTest.evaluate(with: self)
        return isValidPhone
    }
    
   
}

extension UILabel {
    func myTitleLabel() {
        textAlignment = .left
        textColor = UIColor.init(red: 187/255.0, green: 187/255.0, blue: 187/255.0, alpha: 1.0)
        backgroundColor = .clear
        font = UIFont(name: "AvenirNextLTPro-Regular", size: 13)
        numberOfLines = 0
        lineBreakMode = .byCharWrapping
        sizeToFit()
    }
    
    func selectTitleLabel() {
        textAlignment = .center
        textColor = .white
        font = UIFont(name: "AvenirNextLTPro-Regular", size: 13)
        backgroundColor = .clear
        font = UIFont.systemFont(ofSize: 19)
        numberOfLines = 0
        lineBreakMode = .byCharWrapping
        sizeToFit()
    }
}
