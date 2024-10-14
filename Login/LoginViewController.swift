//
//  ViewController.swift
//  HealthCheckup
//
//  Created by MAC on 01/03/23.
//

import UIKit
import SkeletonView
import Network



class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var interactor: LoginInteractorInput?
    var dataModelObject: LoginModel.LoginData.Response?
    let inetReachability = InternetReachability()!
  
    @IBOutlet weak var username_Textfield: UITextField!
    
    @IBOutlet weak var password_Textfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgotBtn: UIButton!
    
    @IBOutlet weak var passwordImage: UIImageView!
    
    @IBOutlet weak var loginPwdTextField: UITextField!
    
 
    var Logininteractor: LoginInteractorInput?
    var data: String?
   
  
    static let shared = LoginViewController()
    
    // MARK: - init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inetReachability.whenReachable = { _ in
            DispatchQueue.main.async {
                print("Internet is OK!")
            }
        }
        inetReachability.whenUnreachable = { _ in
            DispatchQueue.main.async {
                self.inetAlert()
                    print("Internet connection FAILED!")
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: Notification.Name.reachabilityChanged, object: inetReachability)
        
        do {
            try inetReachability.startNotifier()
        } catch {
            print("Could not start notifier")
        }
        //session management
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            //if user is already loggein in
            let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(HomeViewController, animated: false)
            
           
        }

        
        username_Textfield.setLeftPaddingPoints(10)
        password_Textfield.setLeftPaddingPoints(10)
        self.navigationItem.setHidesBackButton(true, animated: false)
       // self.showSpinner(view: self.view)
        username_Textfield.layer.cornerRadius = 5
        username_Textfield.layer.borderWidth = 1
        username_Textfield.layer.borderColor = UIColor.gray.cgColor
        
        password_Textfield.layer.cornerRadius = 5
        password_Textfield.layer.borderWidth = 1
        password_Textfield.layer.borderColor = UIColor.gray.cgColor
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.gray.cgColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        
        username_Textfield.delegate = self
        password_Textfield.delegate = self
        username_Textfield.text = data
        


        
        }
    
    func inetAlert() {
        //Alert Pop-up no internet connection
        let alertController = UIAlertController(title: "", message: "Please, check your internet connection", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }


    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
     //   presenter.outputVC = viewController
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        self.navigationController?.navigationBar.isHidden = true

    }
    override func viewDidAppear(_ animated: Bool) {
       
        LoginUser()
    }
    func LoginUser() {

        let params = LoginModel.LoginData.Request(identifier:"9840233166",password: "Mako@123",device_token:"asdfghjkl")
        interactor?.LoginUser(request: params)
    }



    @IBAction func forgotBtb_Tapped(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
        } else {
            displayErrorMessage(title: "Network Error", message: "Please Check Your Internet Connection", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
                        }])

        }
        }
    @IBAction func loginEyeButton(_ sender: UIButton) {
        password_Textfield.isSecureTextEntry.toggle()
        if password_Textfield.isSecureTextEntry {
            passwordImage.image = UIImage(named:"eyeclose")
        } else {
            passwordImage.image = UIImage(named:"eyeopen")
           
        }
    }
    
    @objc func internetChanged(note:Notification) {
        
                let reachability =  note.object as! InternetReachability
                if reachability.connection != .none {
                    if reachability.connection == .wifi {
                        DispatchQueue.main.async {
                            self.showToast(message: "Internet via WIFI is OK!", font: .systemFont(ofSize: 12.0))
                        }
        
                    } else {
                        DispatchQueue.main.async {
                            self.showToast(message: "Internet via Cellular is OK!", font: .systemFont(ofSize: 12.0))
                        }
                    }
                } else {
                    inetAlert()
                    self.showToast(message: "No Internet connection!", font: .systemFont(ofSize: 12.0))
                }
            }
    
    func displaySuccess<T>(data: T, success: Bool?, apiName: String) where T: Encodable {
        if let dataEncode: LoginModel.LoginData.Response = data as? LoginModel.LoginData.Response {
            dataModelObject = dataEncode
            DispatchQueue.main.async { [unowned self] in
             //   EZLoadingActivity.hide()
                           
                print("Success")
            }
        }
    }
    func displayError(errorMessage: String?, apiName: String) {
        DispatchQueue.main.async {[unowned self] in
            
            print("Error")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username_Textfield.resignFirstResponder()
        password_Textfield.resignFirstResponder()
        
           return true
       }
    }
    //dissmiss ALERT
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Dismiss any validation error messages
        username_Textfield.setError(CONSTANT.VAILD_EMAIL_Empty, show: false)
        password_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: false)
           return true
       }
    
    @objc func dismissKeyboard() {
       
        view.endEditing(true)
    }

    
    @IBAction func loginBtn(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
         if  (password_Textfield.text?.isEmpty)! {
            password_Textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: true)
        }
        else {
            //session management
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
          //  self.showSpinner(view: self.view)
           let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
           self.navigationController?.pushViewController(HomeViewController, animated: true)
        }
       
        } else {
            displayErrorMessage(title: "Network Error", message: "Please Check Your Internet Connection", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
            }])
        }
    }

    @IBAction func signupBtn(_ sender: Any) {
        if Reachability.isConnectedToNetwork(){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    } else {
        displayErrorMessage(title: "Network Error", message: "Please Check Your Internet Connection", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
        }])
    }
}
}
extension String {

    var containsNonWhitespace: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
