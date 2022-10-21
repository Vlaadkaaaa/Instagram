//
//  LikedYouCommentViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

/// Настройка ячейки лайков
final class LikedYouViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak private var userTextLabel: UILabel!
    @IBOutlet weak private var yourPhotoImageView: UIImageView!
    
    // MARK: - Public method
    public func setup(_ content: NotificationModel) {
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.height / 2
        userAvatarImageView.image = UIImage(named: content.userAvatarImageName)
        userTextLabel.text = content.userText
        guard let userLikedPhotoName = content.userLikedPhotoName else { return }
        yourPhotoImageView.image = UIImage(named: userLikedPhotoName)
    }
}
