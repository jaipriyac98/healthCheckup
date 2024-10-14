//
//  EditProfileViewController.swift
//  HealthCheckup
//
//  Created by MAC on 04/03/23.
//

import UIKit

class ChangeUserNameViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
  
    @IBOutlet weak var changeUserName_Textfield: UITextField!

    @IBOutlet weak var email_textfield: UITextField!
    @IBOutlet weak var changeMale_btn: UIButton!

    @IBOutlet weak var changeUser_ScrollView: UIScrollView!
    
    @IBOutlet weak var changeFemale_btn: UIButton!

    @IBOutlet weak var ChangeOthers_btn: UIButton!
    
    
    @IBOutlet weak var dobEdit_DatePicker: UITextField!
    
    @IBOutlet weak var changeProfilePic: UIImageView!
    
    @IBOutlet weak var changeUser_Scrollview: UIScrollView!
    
    var data: String?
    var myData: String?
    var emailData: String?
    var genderData: String?
    var dobData: String?
    let datePicker = UIDatePicker()
    var dateEmpty: String?
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
//        if Reachability .isConnectedToNetwork() {
//            showActivityIndicator()
//        }else{
//            hideActivityIndicator()
//        }
        changeUser_Scrollview.showsVerticalScrollIndicator = false
        changeUserName_Textfield.setLeftPaddingPoints(10)
        email_textfield.setLeftPaddingPoints(10)
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        changeUserName_Textfield.text = myData
        email_textfield.text = emailData
        changeUser_ScrollView.delegate = self
      
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        changeProfilePic.layer.masksToBounds = true
        changeProfilePic.backgroundColor = .gray
        changeProfilePic.layer.cornerRadius = changeProfilePic.frame.height / 2
        
        changeUserName_Textfield.delegate = self
       // changeGender.delegate = self
        email_textfield.delegate = self
       dobEdit_DatePicker.delegate = self
        
   
        createDatepicker()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @objc func keyboardWillHide(notification: NSNotification) {
       // scrollView.setContentOffset(CGPoint.zero, animated: true)
        changeUser_ScrollView.setContentOffset(CGPoint(x: 0, y: -changeUser_ScrollView.contentInset.top), animated: true)
        changeUser_ScrollView.contentInset = .zero
        changeUser_ScrollView.scrollIndicatorInsets = .zero
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo, let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
                let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            changeUser_ScrollView.contentInset = contentInsets
            changeUser_ScrollView.scrollIndicatorInsets = contentInsets
            }
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeUser_ScrollView.contentOffset = CGPoint(x: 0, y: 200)
        }
    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        dobEdit_DatePicker.inputView = datePicker
        dobEdit_DatePicker.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {

        let formatter = DateFormatter()
        //let date = NSDate()
        formatter.dateStyle = DateFormatter.Style.short

        formatter.dateFormat = "dd/MM/yyyy"
        dateEmpty = formatter.string(from: datePicker.date)
        // dateEmpty = formatter.string(from: date as Date)
        let new = String(dateEmpty!.prefix(10))
        dobEdit_DatePicker.text = new
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
            dobEdit_DatePicker.text = ""

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
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    @IBAction func BackButton(_ sender: UIButton) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    
    @IBAction func saveChanges_Btn(_ sender: UIButton) {
        if (changeUserName_Textfield.text?.isEmpty)! {
            changeUserName_Textfield.setError(CONSTANT.VAILD_EMAIL_Empty, show: true)
        }else if ((changeMale_btn).isUserInteractionEnabled == false)&&((changeFemale_btn).isUserInteractionEnabled == false)&&((ChangeOthers_btn).isUserInteractionEnabled == false) {
            self.showToast(message: "Select Gender", font: .systemFont(ofSize: 12.0))
            showAlertError(messageStr: "Select Gender")
        
        }else if (email_textfield.text?.isEmpty)! {
            email_textfield.setError(CONSTANT.VAILD_PASSWORD_Empty, show: true)
        }else if (dobEdit_DatePicker.text?.isEmpty)! {
            dobEdit_DatePicker.setError(CONSTANT.ENTER_DOB_EMPTY, show: true)
        } else {
            let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            self.navigationController?.pushViewController(HomeViewController, animated: true)
        }
    }
    
    @IBAction func changePwd_Btn(_ sender: UIButton) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    @IBAction func changeMale_Btn(_ sender: UIButton) {
        if changeMale_btn.isUserInteractionEnabled == true {
            changeMale_btn.backgroundColor = .black
            changeFemale_btn.backgroundColor = .white
            ChangeOthers_btn.backgroundColor = .white
            
        } else if changeMale_btn.isUserInteractionEnabled == true {
            changeMale_btn.backgroundColor = .white
           
            
        }
    }
    
    @IBAction func changeFemale_Btn(_ sender: UIButton) {
        if changeFemale_btn.isUserInteractionEnabled == true {
            changeFemale_btn.backgroundColor = .black
            changeMale_btn.backgroundColor = .white
            ChangeOthers_btn.backgroundColor = .white
            
        } else if changeMale_btn.isUserInteractionEnabled == true {
            changeFemale_btn.backgroundColor = .white
           
            
        }
    }
    
    @IBAction func changeOthers_Btn(_ sender: UIButton) {
        if ChangeOthers_btn.isUserInteractionEnabled == true {
            ChangeOthers_btn.backgroundColor = .black
            changeMale_btn.backgroundColor = .white
            changeFemale_btn.backgroundColor = .white
            
        } else if changeMale_btn.isUserInteractionEnabled == true {
            ChangeOthers_btn.backgroundColor = .white
           
            
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Dismiss any validation error messages
        changeUserName_Textfield.setError(CONSTANT.ENTER_NAME, show: false)
        dobEdit_DatePicker.setError( CONSTANT.VAILD_PASSWORD_Empty, show: false)
        email_textfield.setError( CONSTANT.VAILD_PASSWORD_Empty, show: false)
        
           return true
       }



    
}
