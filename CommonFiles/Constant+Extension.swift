//
//  Constant+Extension.swift

//
//  Created by Vignesh on 24/09/18.
//
//

import Foundation
import UIKit


extension UIViewController
{
    func showAlertError(titleStr:String = "", messageStr:String)
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: CONSTANT.OK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayErrorMessage(title: String,
                          message: String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)]){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated: true)
    }
    
    
    
//    func hideKeyboardWhenTappedAround()
//    {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard()
//    {
//        view.endEditing(true)
//    }

    func userInteractionFalse()
    {
        self.view.isUserInteractionEnabled = false
    }

    func userInteractionTrue()
    {
        self.view.isUserInteractionEnabled = true
    }
}


extension UIView
{
    
    func dropShadow(color: UIColor, opacity: Float,offset: CGSize,radius: CGFloat)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset 
        layer.cornerRadius = radius
    }
    
    func dropBottomShadow()
    {
/*        layer.masksToBounds = false
        layer.shadowColor =  UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.2).cgColor //UIColor.lightGray.cgColor //UIColor(hexString: "#F3F1E9").cgColor
        layer.shadowOpacity = 2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 2*/
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
    }
    
    func dropTopShadow()
    {
        /*        layer.masksToBounds = false
         layer.shadowColor =  UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.2).cgColor //UIColor.lightGray.cgColor //UIColor(hexString: "#F3F1E9").cgColor
         layer.shadowOpacity = 2
         layer.shadowOffset = CGSize(width: 0, height: 1)
         layer.shadowRadius = 2*/
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 0)
        layer.shadowRadius = 4
        
    }
    
    func addshadow(top: Bool, left: Bool, bottom: Bool, right: Bool, shadowRadius: CGFloat = 2.0) {
            
            layer.masksToBounds = false
            layer.shadowColor =  UIColor.lightGray.cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 1)
            layer.shadowRadius = shadowRadius
            layer.shadowOpacity = 2.0
            
            let path = UIBezierPath()
            var x: CGFloat = 0
            var y: CGFloat = 0
            var viewWidth = self.frame.width
            var viewHeight = self.frame.height
            
            // here x, y, viewWidth, and viewHeight can be changed in
            // order to play around with the shadow paths.
            if (!top) {
                y+=(shadowRadius+1)
            }
            if (!bottom) {
                viewHeight-=(shadowRadius+1)
            }
            if (!left) {
                x+=(shadowRadius+1)
            }
            if (!right) {
                viewWidth-=(shadowRadius+1)
            }
            // selecting top most point
            path.move(to: CGPoint(x: x, y: y))
            // Move to the Bottom Left Corner, this will cover left edges
            /*
             |☐
             */
            path.addLine(to: CGPoint(x: x, y: viewHeight))
            // Move to the Bottom Right Corner, this will cover bottom edge
            /*
             ☐
             -
             */
            path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
            // Move to the Top Right Corner, this will cover right edge
            /*
             ☐|
             */
            path.addLine(to: CGPoint(x: viewWidth, y: y))
            // Move back to the initial point, this will cover the top edge
            /*
             _
             ☐
             */
            path.close()
            //layer.shadowPath = path.cgPath
        }
    
    func shake()
    {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.5
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor)
    {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating()
    {
        if let background = viewWithTag(475647)
        {
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    
    func hideAndShow(view: UIView, hidden: Bool)
    {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations:
        {
            view.isHidden = hidden
        })
    }
    
    
    func hideShow(hidden: Bool)
    {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations:
        {
            self.isHidden = hidden
        })
    }
    
    func showCountryView()  {
     
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .calculationModeCubicPaced, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
               
                self.isHidden = false
                self.transform = .identity
                
            }
            
        }, completion: { finished in
            
        })
        
    }
    
    func hideCountryView()
    {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .calculationModeCubicPaced, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
             
                self.transform = CGAffineTransform(scaleX: 0, y: 0)
            }
        }, completion: { finished in
            
            self.isHidden = true
        })
    }
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in })
    {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }

}


extension UIButton
{
    func hideAndShow(hidden: Bool)
    {
        UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromTop, animations:
        {
                self.isHidden = hidden
        })
    }
    
    func buttonShake()
    {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension UIPageControl
{
    func hideAndShow(hidden: Bool)
    {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations:
        {
                self.isHidden = hidden
        })
    }
}

//extension UIColor
//{
//    convenience init(hexString: String, alpha: CGFloat = 1.0) {
//        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//        let scanner = Scanner(string: hexString)
//        if (hexString.hasPrefix("#")) {
//            scanner.scanLocation = 1
//        }
//        var color: UInt32 = 0
//        scanner.scanHexInt32(&color)
//        let mask = 0x000000FF
//        let r = Int(color >> 16) & mask
//        let g = Int(color >> 8) & mask
//        let b = Int(color) & mask
//        let red   = CGFloat(r) / 255.0
//        let green = CGFloat(g) / 255.0
//        let blue  = CGFloat(b) / 255.0
//        self.init(red:red, green:green, blue:blue, alpha:alpha)
//    }
//    func toHexString() -> String {
//        var r:CGFloat = 0
//        var g:CGFloat = 0
//        var b:CGFloat = 0
//        var a:CGFloat = 0
//        getRed(&r, green: &g, blue: &b, alpha: &a)
//        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//        return String(format:"#%06x", rgb)
//    }
//}

extension String
{
  //  func isValidEmail() -> Bool
//    {
///*        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
//        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil*/
//
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: self)
//
//    }
    
 //   func isValidPassword() -> (Bool,String)
//    {
//        if self.isEmpty
//        {
//            return (false,CONSTANT.VAILD_PASSWORD)
//        }
//        else if !VALID_UPPER_CASE.evaluate(with: self)
//        {
//            return (false,CONSTANT.VALID_PASSWORD_UPPER_CASE)
//        }
//        else if !VALID_LOWER_CASE.evaluate(with: self)
//        {
//            return (false,CONSTANT.VALID_PASSWORD_LOWER_CASE)
//        }
//        else if self.rangeOfCharacter(from: VALID_SPECIAL_CHAR_CASE.inverted) == nil
//        {
//            return (false,CONSTANT.VALID_PASSWORD_SPECIAL_CASE)
//        }
//        else if !VALID_NUMBER_CASE.evaluate(with: self)
//        {
//            return (false,CONSTANT.VALID_PASSWORD_NUMBERIC_CASE)
//        }
//        else if self.count < 8
//        {
//            return (false,CONSTANT.VALID_PASSWORD_MAXIMUM_CASE)
//        }
//        else
//        {
//            return (true, "")
//        }
//    }

}

extension NSString
{
    func isMaxmiumString(maxLength :Int, range :NSRange,string :String) -> Bool
    {
        let currentString: NSString = self
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func isMinimumString(minLength :Int, range :NSRange,string :String) -> Bool
    {
        let currentString: NSString = self
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= minLength
    }
}


extension CALayer
{
    func bottomAnimation(duration:CFTimeInterval)
    {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = duration
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        self.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
    func topAnimation(duration:CFTimeInterval)
    {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = duration
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromBottom
        self.add(animation, forKey: CATransitionType.push.rawValue)
    }
}


extension UIView
{
    
    func dropShadow()
    {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }

    func pushTransition(_ duration:CFTimeInterval)
    {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
}

extension UIButton
{
    func interactionFalse()
    {
        self.isUserInteractionEnabled = false
        self.alpha = 0.5
    }
    
    func interactionTrue()
    {
        self.isUserInteractionEnabled = true
        self.alpha = 1
    }
    
}



extension Int
{
    var degreesToRadians: Double
    {
        return Double(self) * .pi / 180
    }
}

extension FloatingPoint
{
    var degreesToRadians: Self
    {
        return self * .pi / 180
    }
    var radiansToDegrees: Self
    {
        return self * 180 / .pi
    }
}

extension UITableView
{
    func reloadWithAnimation()
    {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells
        {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells
        {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations:
            {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    func reloadAnimation()
    {
        self.reloadData()
        var i = 0
        for cell in self.visibleCells
        {
            cell.transform = CGAffineTransform(translationX: 0, y: self.rowHeight/2)
            cell.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0.09 * Double(i) , options: [.curveEaseInOut], animations:
            {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            }, completion: nil)
            i = i + 1
        }
    }
}

//extension CLLocation
//{
//    public func bearingLocation(to destination: CLLocation) -> Double {
//        // http://stackoverflow.com/questions/3925942/cllocation-category-for-calculating-bearing-w-haversine-function
//        let lat1 = Double.pi * coordinate.latitude / 180.0
//        let long1 = Double.pi * coordinate.longitude / 180.0
//        let lat2 = Double.pi * destination.coordinate.latitude / 180.0
//        let long2 = Double.pi * destination.coordinate.longitude / 180.0
//
//        // Formula: θ = atan2( sin Δλ ⋅ cos φ2 , cos φ1 ⋅ sin φ2 − sin φ1 ⋅ cos φ2 ⋅ cos Δλ )
//        // Source: http://www.movable-type.co.uk/scripts/latlong.html
//        let rads = atan2(
//            sin(long2 - long1) * cos(lat2),
//            cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(long2 - long1))
//        let degrees = rads * 180 / Double.pi
//
//        return (degrees+360).truncatingRemainder(dividingBy: 360)
//    }
//}

extension UIImage
{
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data?
    {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
    
    func resizeImage() -> UIImage?
    {
        var actualHeight: Float = Float(self.size.height)// Float(image.size.height)
        var actualWidth: Float = Float(self.size.width)
        let maxHeight: Float = 300.0
        let maxWidth: Float = 400.0
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight
        let compressionQuality: Float = 0.5
        //50 percent compression
        
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        
        let rect = CGRect(x: 0, y: 0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = jpegData(compressionQuality: CGFloat(compressionQuality))
            
//            UIImageJPEGRepresentation(img!,CGFloat(compressionQuality))
        UIGraphicsEndImageContext()
        return UIImage(data: imageData!)!
    }
    
    func convertImageToBase64() -> String
    {
        let imageData = self.jpeg(.lowest)
        let base64String = imageData?.base64EncodedString()
        guard let data = base64String else
        {
            return ""
        }
        return data
    }
}

extension UIImageView
{
    func rotateClockwise()
    {
        UIView.animate(withDuration: 0.5)
        {
            () -> Void in
            self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    
    func rotateAnticlockwise()
    {
        
        UIView.animate(withDuration: 0.5)
        {
            () -> Void in
            self.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
        }
    }
}

extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
}

extension UITableView
{
    func isCellVisible(section:Int, row: Int) -> Bool
    {
        guard let indexes = self.indexPathsForVisibleRows else
        {
            return false
        }
        return indexes.contains {$0.section == section && $0.row == row }
    }
}


/*
extension UITextField
{
    @IBInspectable var placeHolderColor: UIColor?
    {
        get
        {
            return self.placeHolderColor
        }
        set
        {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}*/

extension String
{
    func replaceString(oldString: String, newString: String) -> String
    {
        return self.replacingOccurrences(of: oldString, with: newString)        
    }
}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the amount of nanoseconds from another date
    func nanoseconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.nanosecond], from: date, to: self).nanosecond ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        var result: String = ""
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if seconds(from: date) > 0 { return "\(seconds(from: date))" }
        if days(from: date)    > 0 { result = result + " " + "\(days(from: date)) D" }
        if hours(from: date)   > 0 { result = result + " " + "\(hours(from: date)) H" }
        if minutes(from: date) > 0 { result = result + " " + "\(minutes(from: date)) M" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))" }
        return ""
    }
}

extension UITableView {
    
    func isLast(for indexPath: IndexPath) -> Bool {
        
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
        
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
}

extension Date
{
    func dateComparison(toDate: Date) -> Bool
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fromDate = formatter.date(from: formatter.string(from: self))
        if fromDate == toDate
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func getCurrentDate() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    func getCurrentTime() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}


private var xoAssociationKey: Int = 0

//extension GMSMarker
//{
//    var currentIndex: Int!
//    {
//        get
//        {
//            return objc_getAssociatedObject(self, &xoAssociationKey) as? Int
//        }
//        set(newValue)
//        {
//            objc_setAssociatedObject(self, &xoAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//        }
//    }
//
//}

extension Float
{
    func formatWithDecimalPlaces(decimalPlaces: Int) -> Double
    {
        let formattedString = String(format: "%.\(decimalPlaces)f", self)
        return Double(formattedString) ?? 0.0
    }
}

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}

extension Array {
    func isValidIndex(_ index : Int) -> Bool {
        return index < self.count
    }
}

extension Date
{
    func dateString(_ format: String = "MMM-dd-YYYY, hh:mm a") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    func dateByAddingYears(_ dYears: Int) -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = dYears
        
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
}

extension Int {
    func dateFromMilliseconds() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self)/1000)
    }
}


/*
typealias UnixTime = Int

extension UnixTime {
    private func formatType(form: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = form
        return dateFormatter
    }
    var dateFull: Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    var toHour: String {
        return formatType(form: "HH:mm").string(from: dateFull)
    }
    var toDay: String {
        return formatType(form: "MM/dd/yyyy").string(from: dateFull)
    }
}
*/

extension Date {
    func timeAgo() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: .current)
    }
}

extension Double {
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
enum Font_Lato : String {
    
    case Bold = "Lato-Bold"
    case Thin = "Lato-Thin"
    case Extrabold = "Lato-ExtraBold"
    case Regular = "Lato-Regular"
    case Semibold = "Lato-SemiBold"
        
    func of(size: CGFloat) -> UIFont
    {
        return UIFont(name: self.rawValue, size: size) ?? UIFont.init(name: "Lato" , size: 12)!
    }
}

