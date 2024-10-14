//
//  Activity Indicator.swift
//  BettingApp
//
//  Created by Sri Ramakrishnan on 23/11/21.
//

import Foundation
import UIKit

var activityView: UIActivityIndicatorView?
extension UIViewController {
    func showActivityIndicator() {
        
//        activityView?.color = UIColor.ActivityIndicatorColor
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        //self.view.isUserInteractionEnabled = false
      }
      func hideActivityIndicator(){
        
        if (activityView != nil){
          DispatchQueue.main.async {
           activityView?.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            //self.view.isUserInteractionEnabled = true
        }
        }
      }
}
