//
//  FirstViewCell.swift
//  RXProject
//
//  Created by Harish on 28/09/22.
//

import UIKit

class FirstViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var model: FirstCellViewModel! {
        didSet {
            self.configureCell()
        }
    }
    
    func configureCell() {
        self.titleLabel.text = model.fact
        self.subTitleLabel.text = model.length
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
