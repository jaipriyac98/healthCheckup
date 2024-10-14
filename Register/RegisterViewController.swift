////
////  LoginViewController.swift
////  HealthCheckup
////
////  Created by MAC on 01/03/23.
////
//
import UIKit


class RegisterViewController: UIViewController, UITextFieldDelegate {
    
   var interactor: LoginInteractorInput?

    
    @IBOutlet weak var registerName_Textfield: UITextField!

    @IBOutlet weak var registerEmail_Textfield: UITextField!

    @IBOutlet weak var registerPassword_Textfield: UITextField!

    @IBOutlet weak var male_btn: UIButton!

    @IBOutlet weak var female_btn: UIButton!

    @IBOutlet weak var others_btn: UIButton!

    @IBOutlet weak var Dob_DatePicker: UITextField!

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var confirmpwd_textfield: UITextField!
    
    @IBOutlet weak var genderView: UIView!


    let datePicker = UIDatePicker()
    var dateEmpty: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.showsVerticalScrollIndicator = false
        registerName_Textfield.setLeftPaddingPoints(10)
        registerEmail_Textfield.setLeftPaddingPoints(10)
        registerPassword_Textfield.setLeftPaddingPoints(10)
        confirmpwd_textfield.setLeftPaddingPoints(10)
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.genderView.layer.borderWidth = 1
        self.genderView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        genderView.layer.borderColor = UIColor.gray.cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        Dob_DatePicker.delegate = self
        createDatepicker()
      
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height + 200)

        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
                toolbar.items = [doneButton]

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        registerName_Textfield.delegate = self
        registerEmail_Textfield.delegate = self
        registerPassword_Textfield.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.setContentOffset(CGPoint(x: 0, y: -scrollView.contentInset.top), animated: true)
           scrollView.contentInset = .zero
           scrollView.scrollIndicatorInsets = .zero
    }

    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo, let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
                let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
                scrollView.contentInset = contentInsets
                scrollView.scrollIndicatorInsets = contentInsets
            }
    }
    


    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        Dob_DatePicker.inputView = datePicker
        Dob_DatePicker.inputAccessoryView = createToolbar()
    }
    @objc func donePressed() {

        let formatter = DateFormatter()
        //let date = NSDate()
        formatter.dateStyle = DateFormatter.Style.short

        formatter.dateFormat = "dd/MM/yyyy"
        dateEmpty = formatter.string(from: datePicker.date)
        // dateEmpty = formatter.string(from: date as Date)
        let new = String(dateEmpty!.prefix(10))
        Dob_DatePicker.text = new
        formatter.dateFormat = "yyyy-MM-dd"
        dateEmpty = formatter.string(from: datePicker.date)
        //dateEmpty = formatter.string(from: date as Date)
        self.view.endEditing(true)
        let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
            
            // Age of 100.
        let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
        var isValidAge = validateAge(birthDate: datePicker.date)
        
        if isValidAge {
            print("Valid Age")
            showAlert(title: "Valid Age", message: "You are between 18 and 100 years old");
        } else {
//            showAlert(title: "Invalid Age", message: "User must be above 18");
//            dobEdit_DatePicker.text = ""
            var refreshAlert = UIAlertController(title: "Invalid Age", message: "User must be above 18.", preferredStyle: UIAlertController.Style.alert)
            Dob_DatePicker.text = ""

            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                
              }))

            

            present(refreshAlert, animated: true, completion: nil)
            
        }
        func validateAge(birthDate: Date) -> Bool {
            var isValid: Bool = true;
            
            if birthDate < MAXIMUM_AGE || birthDate > MINIMUM_AGE {
                isValid = false;
            }
            
            return isValid;
        }
        
        func showAlert(title: String, message: String) {
            // Create alert controller.
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);
            // Create alert action to add to controller.
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil);
            // Add action.
            alertController.addAction(alertAction);
            // Display alert.
            self.present(alertController, animated: true, completion: nil);
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
            scrollView.contentOffset = CGPoint(x: 0, y: 200)
        }

    @objc func dismissKeyboard() {

        view.endEditing(true)
    }



    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        registerEmail_Textfield.resignFirstResponder()
        registerPassword_Textfield.resignFirstResponder()
        registerName_Textfield.resignFirstResponder()

           return true
       }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Dismiss any validation error messages
        registerName_Textfield.setError(CONSTANT.ENTER_NAME, show: false)
        registerEmail_Textfield.setError( CONSTANT.VAILD_EMAIL, show: false)
        registerPassword_Textfield.setError( CONSTANT.VAILD_PASSWORD, show: false)

           return true
       }
    @IBAction func register_Backbtn(_ sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
       


        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func male_btn(_ sender: UIButton) {
        if male_btn.isUserInteractionEnabled == true {
            male_btn.backgroundColor = .black
            female_btn.backgroundColor = .white
            others_btn.backgroundColor = .white
        }else {
            male_btn.backgroundColor = .white
        }
        }
    
    @IBAction func female_btn(_ sender: UIButton) {
        if female_btn.isUserInteractionEnabled == true {
            female_btn.backgroundColor = .black
            male_btn.backgroundColor = .white
            others_btn.backgroundColor = .white
            
            
        }else {
            female_btn.backgroundColor = .white
        }
    }

    @IBAction func others_btn(_ sender: UIButton) {
        if others_btn.isUserInteractionEnabled == true {
            others_btn.backgroundColor = .black
            female_btn.backgroundColor = .white
            male_btn.backgroundColor = .white
        }else{
            others_btn.backgroundColor = .white
        }
    }

    @IBAction func registerBtn(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
        if (registerName_Textfield.text?.isEmpty)! {
            registerName_Textfield.setError(CONSTANT.ENTER_NAME, show: true)
        }
        else if !(registerEmail_Textfield.text?.isEmail)!
        {
            registerEmail_Textfield.setError( CONSTANT.VAILD_EMAIL, show: true)
        }

        else if !(registerPassword_Textfield.text?.isValidPassword)!
        {
            registerPassword_Textfield.setError( CONSTANT.invalidPasswordRange, show: true)
            self.showAlertError(messageStr: CONSTANT.CONFIRM_PASSWORD)
        }
        else {
           // callWelfareClaim()
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            secondViewController.data = registerEmail_Textfield.text ?? ""


            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        }else{
            displayErrorMessage(title: "Network Error", message: "Please Check Your Internet Connection", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
            }])
        }
    }
    @IBAction func signIn_Btn(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        secondViewController.data = registerEmail_Textfield.text ?? ""


        self.navigationController?.pushViewController(secondViewController, animated: true)
        } else {
            displayErrorMessage(title: "Network Error", message: "Please Check Your Internet Connection", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
            }])
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
extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.black
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
      toastLabel.removeFromSuperview()
    })
} }
