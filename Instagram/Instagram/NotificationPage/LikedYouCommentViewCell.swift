//
//  LikedYouCommentViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

///
final class LikedYouCommentViewCell: UITableViewCell {

    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak private var userTextLabel: UILabel!
    @IBOutlet weak private var yourPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)    }
    
    func setup(_ content: NotificationModel) {
        userAvatarImageView.image = UIImage(named: content.userAvatarImageName)
        userTextLabel.text = content.userText
        guard let userLikedPhotoName = content.userLikedPhotoName else { return }
        yourPhotoImageView.image = UIImage(named: userLikedPhotoName)
    }

}
