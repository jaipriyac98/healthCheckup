//
//  IssueCollectionViewCell.swift
//  HealthCheckup
//
//  Created by MAC on 16/03/23.
//

import UIKit
import SkeletonView

class IssueCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Issue_image: UIImageView!
    
    @IBOutlet weak var issue_Label: UILabel!
    
    @IBOutlet weak var viewLayer1: UIView!
    
    @IBOutlet weak var viewLayer2: UIView!
    
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // contentView.isSkeletonable = true
        viewLayer1.isSkeletonable = true
        viewLayer1.showAnimatedSkeleton()
        
//        viewLayer2.isSkeletonable = true
//        viewLayer2.showAnimatedSkeleton()
        
        viewLayer1.layer.borderWidth = 1
        viewLayer1.layer.borderColor = UIColor.lightGray.cgColor
        
        viewLayer2.layer.borderWidth = 1
        viewLayer2.layer.borderColor = UIColor.lightGray.cgColor
        viewLayer2.layer.cornerRadius = 10
        
        Issue_image.layer.borderWidth = 1
        Issue_image.layer.borderColor = UIColor.lightGray.cgColor
        Issue_image.layer.cornerRadius = 10
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { [weak self] _ in
                    self?.viewLayer1.hideSkeleton()
            self?.viewLayer2.hideSkeleton()
                })
        
    }
    deinit {
           // Invalidate the timer to release the reference and prevent memory leaks
           timer?.invalidate()
       }

}
