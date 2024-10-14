//
//  UIcontroller+network.swift
//  GoldBell
//
//  Created by Madasamy Prasath on 6/8/20.
//  Copyright © 2020 V, Madasamyprasath (Cognizant). All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

fileprivate var lView: UIView?

let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))

extension UIViewController{
    
    func showSpinner(view: UIView) {
        //Customize as per your need
        spinner.backgroundColor = UIColor(red: 227 / 255, green: 232 / 255, blue: 235 / 255, alpha: 1.0)
        spinner.color = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0)
        spinner.layer.cornerRadius = 3.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = UIActivityIndicatorView.Style.white;
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func removeSpinner() {

        DispatchQueue.main.async {
            print("spinnerRemoved")
//            self.view?.removeFromSuperview()
//            self.view = nil
            spinner.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    
    func openAlert(msg: String, btnName: String, handlerObj: @escaping (UIAlertAction) -> Void) {
        showAlert(title: "Alert!", msg: msg, btnName: btnName, handlerObj: handlerObj)
      }
      func showAlert(msg: String, btnName: String, handlerObj: @escaping (UIAlertAction) -> Void) {
        showAlert(title: "Info", msg: msg, btnName: btnName, handlerObj: handlerObj)
      }
      func showAlert(title: String, msg: String, btnName: String, handlerObj: @escaping (UIAlertAction) -> Void) {
        let blurEffect = UIBlurEffect(style:.dark)
        // Add effect to an effect view
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.frame
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnName, style: .cancel, handler: { (alertAction) in
          visualEffectView.removeFromSuperview()
          handlerObj(alertAction)
        }))
        visualEffectView.alpha = 0.2
    //    visualEffectView.backgroundColor = .black
        view.addSubview(visualEffectView)
        self.present(alert, animated: false, completion: nil)
      }
    
    
    
    func showAlertWithCancel(title: String, msg: String, btnName: String, handlerObj: @escaping (UIAlertAction) -> Void) {
      let blurEffect = UIBlurEffect(style:.dark)
      // Add effect to an effect view
      let visualEffectView = UIVisualEffectView(effect: blurEffect)
      visualEffectView.frame = view.frame
      let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: btnName, style: .cancel, handler: { (alertAction) in
        visualEffectView.removeFromSuperview()
          handlerObj(alertAction)
      }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (alertAction) in
          visualEffectView.removeFromSuperview()
//          handlerObj(alertAction)
        }))
      visualEffectView.alpha = 0.2
  //    visualEffectView.backgroundColor = .black
      view.addSubview(visualEffectView)
      self.present(alert, animated: false, completion: nil)
    }
    
    func showAlertWithCancelact(title: String, msg: String, btnName: String, handlerObj: @escaping (UIAlertAction) -> Void) {
      let blurEffect = UIBlurEffect(style:.dark)
      // Add effect to an effect view
      let visualEffectView = UIVisualEffectView(effect: blurEffect)
      visualEffectView.frame = view.frame
      let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnName, style: .default, handler: { (alertAction) in
        visualEffectView.removeFromSuperview()
          handlerObj(alertAction)
      }))
        
 
      visualEffectView.alpha = 0.2
  //    visualEffectView.backgroundColor = .black
      view.addSubview(visualEffectView)
      self.present(alert, animated: false, completion: nil)
    }
    
    
    
    
    
    
    
    
func isInternetAvailable() -> Bool{
       var zeroAddress = sockaddr_in()
       zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
       zeroAddress.sin_family = sa_family_t(AF_INET)

       let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
           $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
               SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
           }
       }
       var flags = SCNetworkReachabilityFlags()
       if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
           return false
       }
       let isReachable = flags.contains(.reachable)
       let needsConnection = flags.contains(.connectionRequired)
       return (isReachable && !needsConnection)
   }

func showLoader(view: UIView) -> UIActivityIndicatorView {
    //Customize as per your need
    let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
    spinner.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    spinner.layer.cornerRadius = 3.0
    spinner.clipsToBounds = true
    spinner.hidesWhenStopped = true
    spinner.style = UIActivityIndicatorView.Style.white;
    spinner.center = view.center
    view.addSubview(spinner)
    spinner.startAnimating()
    UIApplication.shared.beginIgnoringInteractionEvents()
    return spinner
}
}

extension UIActivityIndicatorView {
    func dismissLoader() {
        DispatchQueue.main.async {
            self.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}

extension UITableView {
  func setEmptyMessage(_ message: String) {
    let messageLbl = UILabel()
    messageLbl.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
    messageLbl.text = message
    messageLbl.textColor = .white
    messageLbl.numberOfLines = 0
    messageLbl.textAlignment = .center
   // messageLbl.textColor = .white
    messageLbl.font = UIFont(name: "Lato-Bold", size: 20)
    messageLbl.sizeToFit()
    self.backgroundView = messageLbl
    self.separatorStyle = .none
  }
  func restore() {
    self.backgroundView = nil
    self.separatorStyle = .singleLine
  }
}
