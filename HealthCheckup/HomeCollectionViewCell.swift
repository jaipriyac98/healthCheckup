//
//  HomeCollectionViewCell.swift
//  HealthCheckup
//
//  Created by MAC on 16/03/23.
//

import UIKit
import SkeletonView

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dailyPractice_Image: UIImageView!
    
    @IBOutlet weak var dailyPractice_Label: UILabel!
    
    @IBOutlet weak var daily_view: UIView!
    
    var timer: Timer?
    override func awakeFromNib() {
        super.awakeFromNib()
        daily_view.isSkeletonable = true
        daily_view.showAnimatedSkeleton()
        daily_view.layer.borderWidth = 1
        daily_view.layer.borderColor = UIColor.lightGray.cgColor
        daily_view.layer.cornerRadius = 5
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { [weak self] _ in
                    self?.daily_view.hideSkeleton()
                })

    }
    deinit {
           // Invalidate the timer to release the reference and prevent memory leaks
           timer?.invalidate()
       }
}
