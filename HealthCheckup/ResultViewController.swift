//
//  ResultViewController.swift
//  HealthCheckup
//
//  Created by MAC on 15/03/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var beatYourStress_Label: UILabel!
    
    @IBOutlet weak var beatYourStress_Label2: UILabel!
    
    @IBOutlet weak var progressBar1: UIProgressView!
    @IBOutlet weak var progressBar2: UIProgressView!
    
    @IBOutlet weak var progressBar3: UIProgressView!
    
    @IBOutlet weak var progressBar4: UIProgressView!
    
    @IBOutlet weak var progressBar5: UIProgressView!
    
    @IBOutlet weak var result_Scrollview: UIScrollView!
    
    var noCorrect: Int = 0
    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        result_Scrollview.showsVerticalScrollIndicator = false
        self.navigationItem.setHidesBackButton(true, animated: false)
      
        let currentvalue = 5.0
        let maxValue = 100.0
        
        let progressValue = Float(currentvalue) / Float(maxValue)
        print("")
        progressBar1.progress = progressValue
        progressBar2.progress = 0.5
        
        progressBar3.progress = 0.75
        
        progressBar4.progress = 0.65
        
        progressBar5.progress = 0.45
        
        
        progressBar1.progressTintColor = #colorLiteral(red: 0, green: 0.3910164535, blue: 0.9960674644, alpha: 1)
        progressBar1.trackTintColor = #colorLiteral(red: 0.86498034, green: 0.9163036942, blue: 0.9996483922, alpha: 1)
        
        
        progressBar2.progressTintColor = #colorLiteral(red: 0, green: 0.3910164535, blue: 0.9960674644, alpha: 1)
        progressBar2.trackTintColor = #colorLiteral(red: 0.86498034, green: 0.9163036942, blue: 0.9996483922, alpha: 1)
        
        progressBar3.progressTintColor = #colorLiteral(red: 0, green: 0.3910164535, blue: 0.9960674644, alpha: 1)
        progressBar3.trackTintColor = #colorLiteral(red: 0.86498034, green: 0.9163036942, blue: 0.9996483922, alpha: 1)
        
        progressBar4.progressTintColor = #colorLiteral(red: 0, green: 0.3910164535, blue: 0.9960674644, alpha: 1)
        progressBar4.trackTintColor = #colorLiteral(red: 0.86498034, green: 0.9163036942, blue: 0.9996483922, alpha: 1)
        
        progressBar5.progressTintColor = #colorLiteral(red: 0, green: 0.3910164535, blue: 0.9960674644, alpha: 1)
        progressBar5.trackTintColor = #colorLiteral(red: 0.86498034, green: 0.9163036942, blue: 0.9996483922, alpha: 1)
        
        beatYourStress_Label.text = "People who score like you show several symptoms of stress of stress such as mood swings, problems with focus, as well as body aches and pains."
        
        beatYourStress_Label2.text = "You might get overwhelmed at times. You might also feel like you don't have enoughcontrol over your stress"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func result_Close(_ sender: Any) {
        let Home_ViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(Home_ViewController, animated: true)
    }
    
    

}
