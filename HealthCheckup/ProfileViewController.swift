//
//  ProfileViewController.swift
//  HealthCheckup
//
//  Created by MAC on 03/03/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profile_Image: UIImageView!
    
    @IBOutlet weak var fullName_Label: UILabel!
    
    @IBOutlet weak var email_Label: UILabel!
    
    @IBOutlet weak var gender_Label: UILabel!
    
    @IBOutlet weak var dob_Label: UILabel!
    
    @IBOutlet weak var profile_Scrollview: UIScrollView!
    
   
    
    
    var myData: String?
    var emailData: String?
    var genderData: String?
    var dobData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profile_Scrollview.showsVerticalScrollIndicator = false
     
        self.navigationItem.setHidesBackButton(true, animated: false)
        profile_Image.layer.masksToBounds = true
        profile_Image.backgroundColor = .gray
        profile_Image.layer.cornerRadius = profile_Image.frame.height / 2
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func editProfile_Btn(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeUserNameViewController") as! ChangeUserNameViewController
        secondViewController.myData = fullName_Label.text ?? ""
        secondViewController.emailData = email_Label.text ?? ""
        secondViewController.genderData = gender_Label.text ?? ""
        secondViewController.dobData = dob_Label.text ?? ""
        self.navigationController?.pushViewController(secondViewController, animated: true)
        }else{
            displayErrorMessage(title: "Network Error", message: "Please Check Your Internet Connection", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
                        }])

        }
    }
    
    @IBAction func changePwd_Btn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    @IBAction func profile_BackBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func SignoutBtn(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        showAlertWithCancel(title: "Logout", msg: "Are you sure to logout from the app?", btnName: "OK", handlerObj : { _ in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        })
    }
    
    
}
