//
//  ChangePasswordViewController.swift
//  HealthCheckup
//
//  Created by MAC on 04/03/23.
//

import UIKit

class ChangePasswordViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var changePassword_Textfield: UITextField!
    @IBOutlet weak var newPassword_Textfield: UITextField!
   
    @IBOutlet weak var confirmPassword_Textfield: UITextField!
    @IBOutlet weak var OldPwdEyeImage: UIImageView!
   @IBOutlet weak var newPwd_Eyeimg: UIImageView!
    @IBOutlet weak var confirmPwd_Eyeimg: UIImageView!
    @IBOutlet weak var oldPwd_eyeBtn: UIButton!
    @IBOutlet weak var newPwd_eyeBtn: UIButton!
    @IBOutlet weak var confirmPwd_eyeBtn: UIButton!

    var iconClick = false
    let imageicon = UIImageView()
    
    override func viewDidLoad() {

        changePassword_Textfield.setLeftPaddingPoints(10)
        newPassword_Textfield.setLeftPaddingPoints(10)
        confirmPassword_Textfield.setLeftPaddingPoints(10)
       // registerEmail_Textfield.setLeftPaddingPoints(10)
        self.navigationItem.setHidesBackButton(true, animated: false)
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        changePassword_Textfield.delegate = self
        newPassword_Textfield.delegate = self
        confirmPassword_Textfield.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func save_btnTapped(_ sender: Any){
        if (changePassword_Textfield.text?.isEmpty)! {
            changePassword_Textfield.setError(CONSTANT.ENTER_CURRENT_PASSWORD, show: true)
        } else if !(changePassword_Textfield.text?.isValidPassword)! {
            
            changePassword_Textfield.setError(CONSTANT.CONFIRM_PASSWORD, show: true)
        }
        else if (newPassword_Textfield.text?.isEmpty)! {
            newPassword_Textfield.setError(CONSTANT.ENTER_NEW_PASSWORD, show: true)
        }
        else if  !(newPassword_Textfield.text?.isValidPassword)! {
            newPassword_Textfield.setError(CONSTANT.CONFIRM_PASSWORD, show: true)

        }
        else if (newPassword_Textfield.text?.isEmpty)! {
            newPassword_Textfield.setError(CONSTANT.ENTER_NEW_PASSWORD, show: true)
        }
        else if  !(confirmPassword_Textfield.text?.isValidPassword)! {
            confirmPassword_Textfield.setError(CONSTANT.CONFIRM_PASSWORD, show: true)

        }else {
            if newPassword_Textfield.text! == confirmPassword_Textfield.text! {
                print("Success")
            }else{
                
                confirmPassword_Textfield.setError(CONSTANT.PASSWORD_MISMATCH, show: true)
            }
        
        }
    }
    @IBAction func changePwd_BackBtn(_ sender: UIButton) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    @IBAction func newPasswordEyeBtnAction(_ sender: UIButton) {
        newPassword_Textfield.isSecureTextEntry.toggle()
        if newPassword_Textfield.isSecureTextEntry {
            newPwd_Eyeimg.image = UIImage(named:"eyeclose")
        } else {
            newPwd_Eyeimg.image = UIImage(named:"eyeopen")
        }

    }
    @IBAction func confirmPwdEyeBtn(_ sender: UIButton){
        confirmPassword_Textfield.isSecureTextEntry.toggle()
        if confirmPassword_Textfield.isSecureTextEntry {
            confirmPwd_Eyeimg.image = UIImage(named: "eyeclose")
        }else{
            confirmPwd_Eyeimg.image = UIImage(named: "eyeopen")
        }
    }
    @IBAction func changePwd_Backbtn(_ sender: Any){
//        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
//        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }

    
    @IBAction func oldPassword_BtnAction(_ sender: UIButton) {

        changePassword_Textfield.isSecureTextEntry.toggle()
        if changePassword_Textfield.isSecureTextEntry {
            OldPwdEyeImage.image = UIImage(named:"eyeclose")
        } else {
            OldPwdEyeImage.image = UIImage(named:"eyeopen")
           
        }
   
    //dissmiss ALERT
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Dismiss any validation error messages
        changePassword_Textfield.setError(CONSTANT.OLD_PASSWORD, show: false)
        newPassword_Textfield.setError(CONSTANT.NEW_PASSWORD, show: false)
   //  confirmPassword_Textfield.setError(CONSTANT.CONFIRM_PASSWORD, show: false)
        return true
       }
   
   
}
}
