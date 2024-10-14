//
//  FooterTableViewCell.swift
//  QuestionPoc
//
//  Created by MAC on 21/03/23.
//

import UIKit

class FooterTableViewCell: UITableViewCell {

    @IBOutlet weak var footerBtn: UIButton!
    
    @IBOutlet weak var footerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        footerView.layer.cornerRadius = 15
        footerView.clipsToBounds = true
        footerBtn.layer.cornerRadius = 15
        footerBtn.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
   
}
