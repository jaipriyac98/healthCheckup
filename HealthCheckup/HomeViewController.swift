//
//  HomeViewController.swift
//  HealthCheckup
//
//  Created by MAC on 02/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func profileView_btn(_ sender: Any) {
        
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    @IBAction func questions_Btn(_ sender: Any){
                let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionnaireViewController") as! QuestionnaireViewController
                self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
//    @IBAction func changePwd_Btn(_ sender: Any) {
//        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
//        self.navigationController?.pushViewController(HomeViewController, animated: true)
//    }

    @IBAction func createPwd_Btn(_ sender: Any){
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreatePasswordViewController") as! CreatePasswordViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
    }
    @IBAction func home_Btn(_ sender: Any){
        let Practice_ViewController = self.storyboard?.instantiateViewController(withIdentifier: "DailyPracticeViewController") as! DailyPracticeViewController
        self.navigationController?.pushViewController(Practice_ViewController, animated: true)
    }
    
    @IBAction func result_Btn(_ sender: Any) {
        let Result_ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        self.navigationController?.pushViewController(Result_ViewController, animated: true)
    }
}
