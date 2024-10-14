//
//  CreatePasswordViewController.swift
//  HealthCheckup
//
//  Created by MAC on 10/03/23.
//

import UIKit

class CreatePasswordViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var oldPwd_Textfield: UITextField!
    
    @IBOutlet weak var confirmPwd_Textfield: UITextField!
    
    @IBOutlet weak var oldPwd_Eyeimg: UIImageView!
    
    @IBOutlet weak var confirmPwd_EyeImg: UIImageView!
    
    var iconClick = false
    let imageicon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oldPwd_Textfield.setLeftPaddingPoints(10)
        confirmPwd_Textfield.setLeftPaddingPoints(10)
        self.navigationItem.setHidesBackButton(true, animated: false)
        confirmPwd_Textfield.delegate = self
        oldPwd_Textfield.delegate = self
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func updatePwd(_ sender: UIButton) {
        if (oldPwd_Textfield.text?.isEmpty)! {
            oldPwd_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: true)
        } else if (confirmPwd_Textfield.text?.isEmpty)! {
            confirmPwd_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: true)
            
        }  else if !(confirmPwd_Textfield.text?.isValidPassword)!
        {
            confirmPwd_Textfield.setError( CONSTANT.invalidPasswordRange, show: true)
            self.showAlertError(messageStr: CONSTANT.CONFIRM_PASSWORD)
        }
    }
    
    @IBAction func confirmPwd_btn(_ sender: Any) {
        confirmPwd_Textfield.isSecureTextEntry.toggle()
        if confirmPwd_Textfield.isSecureTextEntry {
            confirmPwd_EyeImg.image = UIImage(named:"eyeclose")
        } else {
            confirmPwd_EyeImg.image = UIImage(named:"eyeopen")
        }
    }
    
    @IBAction func confirmPwd_Btn(_ sender: Any) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Dismiss any validation error messages
        oldPwd_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: false)
        confirmPwd_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: false)
           return true
       }
    @IBAction func oldPwd_Btn(_ sender: Any) {
        oldPwd_Textfield.isSecureTextEntry.toggle()
        if oldPwd_Textfield.isSecureTextEntry {
            oldPwd_Eyeimg.image = UIImage(named:"eyeclose")
        } else {
            oldPwd_Eyeimg.image = UIImage(named:"eyeopen")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
