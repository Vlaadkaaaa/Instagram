//
//  IsOnInstViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

///
final class IsOnInstViewCell: UITableViewCell {

    @IBOutlet weak private var userAvatarImageView: UIImageView!

    @IBOutlet weak private var subscribeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func subscribeButtonAction(_ sender: Any) {
        
    }
}
