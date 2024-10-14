//
//  HeaderTableViewCell.swift
//  QuestionPoc
//
//  Created by MAC on 21/03/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        questionView.layer.cornerRadius = 10
        questionView.clipsToBounds = true
     //  questionView.layer.shadowRadius = 10
      //  questionView.layer.shadowOpacity = 1.0
        
        questionLabel.layer.cornerRadius = 10
        questionLabel.clipsToBounds = true
     //   questionLabel.layer.shadowRadius = 10
      //  questionLabel.layer.shadowOpacity = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
