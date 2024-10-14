//
//  ForgotPasswordViewController.swift
//  HealthCheckup
//
//  Created by MAC on 08/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotPwd_Textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forgotPwd_Textfield.setLeftPaddingPoints(10)
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        forgotPwd_Textfield.layer.cornerRadius = 5
        forgotPwd_Textfield.layer.borderWidth = 1
        forgotPwd_Textfield.layer.borderColor = UIColor.gray.cgColor
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func close_Btn(_ sender: Any) {
        
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    @IBAction func continue_Btn(_ sender: Any) {
        if (forgotPwd_Textfield.text?.isEmpty)! {
            forgotPwd_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: true)
        }
    }
    
    
   
}
