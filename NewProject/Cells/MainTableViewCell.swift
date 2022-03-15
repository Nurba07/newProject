//
//  MainTableViewCell.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 15.03.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let identifier = "MainTableViewCell"
    static let nib = UINib(nibName: MainTableViewCell.identifier, bundle: nil)
    
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var partnerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
