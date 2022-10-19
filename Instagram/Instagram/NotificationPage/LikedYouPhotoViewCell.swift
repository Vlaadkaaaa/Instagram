//
//  LikedYouPhotoViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

///
final class LikedYouPhotoViewCell: UITableViewCell {

    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak private var userTextLabel: UILabel!
    @IBOutlet weak private var yourPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
