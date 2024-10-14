//
//  Constant+String.swift
//  Taxi App
//
//  Created by Pyramidions on 30/01/19.
//  Copyright © 2019 Pyramidions. All rights reserved.
//

import Foundation
import Localize_Swift

//typealias CONSTANT = String

struct CONSTANT
{
  
    public static var VALID_PASSWORD_SPECIAL_CASE = "Password should have atleast 1 special character".localized()
    public static var VALID_PASSWORD_NUMBERIC_CASE = "Password should have atleast 1 numeric character".localized()
    public static var VALID_PASSWORD_MAXIMUM_CASE = "Password should be minimum 8 character".localized()
    public static var PASSWORD_SHOULD_NOT_SAME = "Your old and new password should be not same".localized()
    public static var PASSWORD_SHOULD_SAME = "Your new and confirm password should be same".localized()
    public static var ENTER_CURRENT_PASSWORD = "Please fill current password".localized()
    public static var ENTER_NEW_PASSWORD = "Please fill new password".localized()
    public static var ENTER_CONFIRM_PASSWORD = "Please fill confirm password".localized()

    
  
    public static var LOGIN = "LOGIN".localized()
    public static var MOBILE_NUMBER = "Mobile number should be 8 numbers".localized()
    public static var PASSWORD = "Password".localized()
    public static var OLD_PASSWORD = "Please fill Old Password".localized()
    public static var DONT_ACCOUNT = "Don’t have an account ?".localized()
    public static var SIGN_UP = "SIGN UP".localized()

    public static var SIGNUP = "SIGNUP".localized()
    public static var INSURANCE = "Insurance".localized()
    public static var EMAIL = "Email".localized()
    public static var OK = "Ok".localized()
    public static var ALREADY_HAVE = "Already have an account ?".localized()
    public static var SIGN_IN = "SIGN IN".localized()

    public static var FIRST_NAME = "First name".localized()
    public static var LAST_NAME = "Last name".localized()

    public static var VALID_FIRST_NAME = "Please fill the name".localized()
    public static var VAILD_LAST_NAME = "Please fill last name".localized()

    
    public static var VAILD_EMAIL_Empty = "Please fill the email".localized()
    public static var VALID_USERNAME_EMPTY = "please fill the email".localized()
    public static var VAILD_PASSWORD_Empty = "Please fill the password".localized()
    public static var ENTER_DOB_EMPTY = "Please select the DOB".localized()
    public static var VAILD_EMAIL = "Please fill valid email".localized()
    public static var VALID_Username = "Please Enter the User Name".localized()
 
    public static var VAILD_PASSWORD = "Please fill valid password".localized()
    public static var CHECK_INTERNET_CONNECTION = "Check Internet Connection".localized()
    public static var invalidPasswordRange = "Please enter a Password must contain at least 6 Characters".localized()
 
    
   
    public static var CREATE_PASSWORD = "Create password".localized()
    public static var NEW_PASSWORD = "Please fill Valid New password".localized()
    public static var CONFIRM_PASSWORD = "Please fill Valid Confirm password".localized()
    public static var PASSWORD_MISMATCH = "Password does not match".localized()

    public static var UPLOAD_PROFILE_IMAGE = "Upload your profile picture".localized()
    public static var MY_PROFILE = "My profile".localized()
    public static var CHANGE_PASSWORD = "Change password".localized()
    public static var CHANGE_ADDRESS = "Change address".localized()
    public static var ABOUT_US = "About us".localized()
    public static var LOGOUT = "Logout".localized()

  
    
    public static var CANCEL = "Cancel".localized()
    public static var CHOOSE_GALLERY = "Choose Gallery".localized()
    public static var CHOOSE_CAMERA = "Choose Camera".localized()

    public static var ENTER_NAME = "Please fill your name".localized()

    public static var UPLOAD_IMAGE = "Please upload your image".localized()

    public static var FORGOT_PASSWORD = "Forgot password?".localized()


    public static var DO_YOU_WANT_LOGOUT = "Do you want to logout?".localized()


    
  
  
    
 

   
    
    
    
}

/*
func setText()
{
    CONSTANT.APP_NAME = "DocNow".localized()

    CONSTANT.TRY_AGAIN = "TRY AGAIN".localized()
    CONSTANT.YOU_ARE_OFFLINE = "You are offline, connect to the internet".localized()
    CONSTANT.PLEASE_TRY_IN_A_WHILE = "Please try in a while".localized()
        
    CONSTANT.VALID_PASSWORD_UPPER_CASE = "Password should have atleast 1 upper case letter".localized()
    CONSTANT.VALID_PASSWORD_LOWER_CASE = "Password should have atleast 1 lower case letter".localized()
    CONSTANT.VALID_PASSWORD_SPECIAL_CASE = "Password should have atleast 1 special character".localized()
    CONSTANT.VALID_PASSWORD_NUMBERIC_CASE = "Password should have atleast 1 numeric character".localized()
    CONSTANT.VALID_PASSWORD_MAXIMUM_CASE = "Password should be minimum 8 character".localized()
    CONSTANT.PASSWORD_SHOULD_NOT_SAME = "Your old and new password should be not same".localized()
    CONSTANT.PASSWORD_SHOULD_SAME = "Your new and confirm password should be same".localized()
    CONSTANT.ENTER_CURRENT_PASSWORD = "Please fill current password".localized()
    CONSTANT.ENTER_NEW_PASSWORD = "Please fill new password".localized()
    CONSTANT.ENTER_CONFIRM_PASSWORD = "Please fill confirm password".localized()

        
    CONSTANT.OOPS = "Oops".localized()
    CONSTANT.SUCCESS = "Success".localized()
    CONSTANT.OK = "Ok".localized()

    CONSTANT.LOGIN = "LOGIN".localized()
    CONSTANT.MOBILE_NUMBER = "Mobile Number".localized()
    CONSTANT.PASSWORD = "Password".localized()
    CONSTANT.DONT_ACCOUNT = "Don’t have an account ?".localized()
    CONSTANT.SIGN_UP = "SIGN UP".localized()

    CONSTANT.SIGNUP = "SIGNUP".localized()
    CONSTANT.INSURANCE = "Insurance".localized()
    CONSTANT.EMAIL = "Email".localized()
    CONSTANT.ALREADY_HAVE = "Already have an account ?".localized()
    CONSTANT.SIGN_IN = "SIGN IN".localized()

    CONSTANT.FIRST_NAME = "First name".localized()
    CONSTANT.LAST_NAME = "Last name".localized()

    CONSTANT.VALID_FIRST_NAME = "Please fill first name".localized()
    CONSTANT.VAILD_LAST_NAME = "Please fill last name".localized()

        
        
    CONSTANT.VAILD_PHONE_NUMBER = "Please fill valid phone number".localized()
    CONSTANT.VAILD_EMAIL = "Please fill valid email".localized()

    CONSTANT.VAILD_PASSWORD = "Please fill valid password".localized()
    CONSTANT.CHECK_INTERNET_CONNECTION = "Check Internet Connection".localized()
    CONSTANT.ENTER_OTP = "Please fill OTP".localized()
        
    CONSTANT.OTP_DES = "We have sent the access code \nVia SMS to your register mobile number".localized()
    CONSTANT.ENTER_CODE = "fill Code here".localized()
    CONSTANT.RESEND_CODE = "Resend code".localized()
        
        
    CONSTANT.RESET_PASSWORD = "Reset password".localized()
    CONSTANT.CREATE_PASSWORD = "Create password".localized()
    CONSTANT.NEW_PASSWORD = "New password".localized()
    CONSTANT.CONFIRM_PASSWORD = "Confirm password".localized()
    CONSTANT.CAP_OK = "OK".localized()
    CONSTANT.PASSWORD_SAME = "New & confirm password must be same".localized()
        
    CONSTANT.HOME = "Home".localized()
    CONSTANT.APPOINTMENTS = "Appointments".localized()
    CONSTANT.DOCTOR = "Doctor".localized()
    CONSTANT.MY_ACCOUNT = "My account".localized()

    CONSTANT.SPECIALIZATION_LIST = "Specialization List".localized()

    CONSTANT.INSURANCE_NAME = "Insurance name".localized()

    CONSTANT.APPOINTMENT = "Appointment".localized()
    CONSTANT.BOOKING_CONFIRMED = "Booking Confirmed".localized()
    CONSTANT.CONFIRMATION_EMAIL = "Confirmation email has been sent to your registered details".localized()
    CONSTANT.APPOINTMENT_DETAILS = "Appointment Details".localized()
    CONSTANT.TIME_DATE = "Time & Date".localized()
    CONSTANT.CANCEL_APPOINTMENT = "Cancel Appointment".localized()

    CONSTANT.MY_PROFILE = "My profile".localized()
    CONSTANT.CHANGE_PASSWORD = "Change password".localized()
    CONSTANT.CHANGE_ADDRESS = "Change address".localized()
    CONSTANT.ABOUT_US = "About us".localized()
    CONSTANT.LOGOUT = "Logout".localized()

    CONSTANT.SELECT_BOOKING_DATE = "Please select your booking date".localized()

    CONSTANT.BOOKING_APPOINTMENT = "Booking Appointment".localized()
    CONSTANT.PICK_DATE = "Pick Date".localized()
    CONSTANT.PICK_TIME = "Pick Time".localized()

    CONSTANT.NEAR_ME = "Near me".localized()
    CONSTANT.AVAILABLE_TODAY = "Available Today".localized()
    CONSTANT.INSURANCE_CARRIER = "Insurance carrier or plan".localized()
    CONSTANT.FIND_DOCTOR = "Find doctor Now".localized()

    CONSTANT.UPCOMING = "Upcoming".localized()
    CONSTANT.PAST = "Past".localized()

    CONSTANT.NAME = "Name".localized()
    CONSTANT.SAVE = "SAVE".localized()

    CONSTANT.CURRENT_PASSWORD = "Current password".localized()
        
    CONSTANT.ADDRESS = "Address".localized()
    CONSTANT.TYPE_YOUR_ADDRESS = "Type your address".localized()
    CONSTANT.INVALID_REQUEST = "Invalid request".localized()
        
    CONSTANT.CANCEL = "Cancel".localized()
    CONSTANT.CHOOSE_GALLERY = "Choose Gallery".localized()
    CONSTANT.CHOOSE_CAMERA = "Choose Camera".localized()

    CONSTANT.ENTER_NAME = "Please fill your name".localized()
    CONSTANT.ENTER_INSURANCE = "Please fill your insurance".localized()
    CONSTANT.UPLOAD_IMAGE = "Please upload your image".localized()
    CONSTANT.ENTER_ADDRESS = "Please fill the address".localized()

    CONSTANT.IN = "In".localized()
    CONSTANT.DAYS = "days".localized()
    CONSTANT.TODAY = "Today".localized()

    CONSTANT.LIST_DOCTOR = "Try dentist, flu shot, dermatologist".localized()
    CONSTANT.FIND = "Find".localized()

    CONSTANT.ENTER_DATE = "Select your date".localized()
    CONSTANT.ENTER_DOCTORTYPE = "Select your doctor type".localized()
    CONSTANT.DONE = "Done".localized()

    CONSTANT.FORGOT_PASSWORD = "Forgot password?".localized()

    CONSTANT.PROFESSIONAL_STATEMENT = "Professional Statement".localized()
    CONSTANT.EDUCATION = "Education".localized()
    CONSTANT.PRACTICE_LOCATION = "Practice Location".localized()
    CONSTANT.PATIENT_REVIEWS = "Patient Reviews".localized()
    CONSTANT.SEE_ALL_REVIEWS = "See All Reviews".localized()

    CONSTANT.DO_YOU_WANT_LOGOUT = "Do you want to logout?".localized()

    CONSTANT.OOP = "Oops!".localized()
    CONSTANT.NO_INTERNET = "No internet connection found\nCheck your connection".localized()
    CONSTANT.TRY = "Try Again".localized()
    CONSTANT.NO_DOCTOR = "No doctors found".localized()
    CONSTANT.NO_APPOINTMENT = "No appointment found".localized()
        
    CONSTANT.ENTER_YOUR_FEEDBACK = "fill your feedback".localized()
    CONSTANT.COMMENTS = "Comments".localized()
    CONSTANT.TYPE_YOUR_COMMENTS = "Type your comments".localized()
    CONSTANT.SUBMIT = "Submit".localized()

    CONSTANT.RATING_ERROR = "Please provide rating".localized()
    CONSTANT.REVIEW_ERROR = "Please fill your feedback".localized()
    CONSTANT.HI = "Hi".localized()
    CONSTANT.FIND_HEALTHCARE = "var's find your healthcare provider".localized()
    CONSTANT.TYPE_INSURANCE = "Type your insurance".localized()

    CONSTANT.HELLO = "Hello ".localized()
    CONSTANT.YOUR_BOOKING = "Your booking on ".localized()
    CONSTANT.RESCHEDULE = "Re schedule".localized()
    CONSTANT.ONE_STEP = "We are one step away from finishing the signup process, we will just need your number so that we can confirm future bookings.".localized()
    CONSTANT.ENTER_MOBILE = "fill your mobile number".localized()
    CONSTANT.STEP_EMAIL = "We will just need your email id so that we can find your profile.".localized()
    CONSTANT.SEARCH_DOCTOR = "Search doctor".localized()

    CONSTANT.WAITING_LIST = "Switch on the waiting list to be notified of earlier\nappointments as they become available".localized()
    CONSTANT.ON = "ON".localized()
    CONSTANT.OFF = "OFF".localized()
    CONSTANT.TELEMATE_BOOKING = "Do you want have a telehealth booking ?".localized()

    CONSTANT.TYPE_MESSAGE = "Type your message".localized()
    CONSTANT.SEND = "Send".localized()
    CONSTANT.MY_WALLET = "My Wallet".localized()
    CONSTANT.AVAILABLE = "Available".localized()
    CONSTANT.CREDITS = "Credits".localized()
    CONSTANT.CONSULTATION_FEE = "Consultation fee : ".localized()
    CONSTANT.TELEHEALTH_ENABLED = "Telehealth Enabled".localized()
    CONSTANT.ADD_MONEY = "Add money".localized()

        
    CONSTANT.ENTER_AMOUNT = "fill the amount".localized()
    CONSTANT.AVILABLE_BALANCE = "Available Balance:".localized()
    CONSTANT.CHOOSE_PAYMENT = "Choose payment".localized()
        
    CONSTANT.AMOUNT_TO_BE_PAID = "Amount to be paid".localized()
    CONSTANT.CARD = "Card".localized()
    CONSTANT.ADD_CARD = "Add card".localized()
    CONSTANT.MAKE_PAYMENT = "Make payment".localized()
        
    CONSTANT.CARD_NUMBER = "CARD NUMBER".localized()
    CONSTANT.CARD_NAME = "CARD NAME".localized()
    CONSTANT.CARD_HOLDER = "CARD HOLDER".localized()
    CONSTANT.ENTER_CARD_HOLDER = "Please fill card holder name".localized()
    CONSTANT.PLEASE_SELECT_CARD = "Please select card".localized()

    CONSTANT.WALLET = "Wallet".localized()
    CONSTANT.YOUR_BALANCE = "Your balance".localized()
    CONSTANT.LAST_TRANSACTIONS = "Last Transactions".localized()
        
    CONSTANT.DELETE = "Delete".localized()
    CONSTANT.YOUR_BILL = "Your bill".localized()
    CONSTANT.PAYMENT_SUCCESSFUL = "Payment Successful".localized()
    CONSTANT.WALLET_ADDED = "added to your wallet".localized()
    CONSTANT.CARD_TITLE = "Card title".localized()
    CONSTANT.PAYMENT = "Payment".localized()
    CONSTANT.CHAT_OPEN = "Chat would be open on the day of booking".localized()
    CONSTANT.WALLET_BALANCE_LOW = "Your wallet balance is too low for make the booking. Would you like to add money to your wallet ?".localized()
        
    CONSTANT.VIEW_IMAGE = "View image".localized()
    CONSTANT.ADD_IMAGE = "Add image".localized()
    CONSTANT.INSURANCE_IMAGE = "Insurance Images".localized()
    CONSTANT.WANT_INSURANCE = "Do you want to share your insurance public ?".localized()

    CONSTANT.FRONT_INS_IMAGE = "Please upload front insurance image".localized()
    CONSTANT.BACK_INS_IMAGE = "Please upload back insurance image".localized()

    CONSTANT.APPLY_FILTERS = "Apply Filters".localized()
    CONSTANT.TELEMATE_DOCTORS = "Telehealth doctors".localized()
    CONSTANT.NON_TELEMATE_DOCTORS = "Non-telehealth doctors".localized()
    CONSTANT.CLEAR_FILTERS = "Clear filters".localized()
    CONSTANT.ADD_FILTERS = "Add filters".localized()
    CONSTANT.CHANGE_LANGUAGE = "Change language".localized()

    CONSTANT.SELECT_OPTION = "Please Select an Option".localized()
    CONSTANT.ENGLISH = "English".localized()
    CONSTANT.SPANISH = "Spanish".localized()
    CONSTANT.DISMISS = "Dismiss".localized()
    CONSTANT.TRANSACTION_HISTORY = "Transaction history".localized()
    CONSTANT.ID = "ID:".localized()
    CONSTANT.PLEASE_SEARCH_DOCTOR = "Please search doctor".localized()
    CONSTANT.RECENT_SEARCHES = "Recent searches".localized()
    CONSTANT.POPULAR_SPECIALTIES = "Popular specialties".localized()
    CONSTANT.POPULAR_DOCTOR = "Popular doctor".localized()
    CONSTANT.DIDNT_FIND_WHAT_LOOKING = "Didn't find what you looking for".localized()
    CONSTANT.SEARCH_MORE = "Search More".localized()
}
*/
