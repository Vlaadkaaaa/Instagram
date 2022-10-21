//
//  MentionedYouViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

/// Настройка ячейки уппомянул вас
final class MentionedYouViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak private var userTextLabel: UILabel!
    @IBOutlet weak private var yourPhotoImageView: UIImageView!
    
    // MARK: - Public method
    public func setup(_ content: Notification) {
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.height / 2
        userAvatarImageView.image = UIImage(named: content.userAvatarImageName)
        userTextLabel.text = content.userText
        guard let userLikedPhotoName = content.userLikedPhotoName else { return }
        yourPhotoImageView.image = UIImage(named: userLikedPhotoName)
    }
}
