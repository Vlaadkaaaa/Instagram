//
//  IsOnInstViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

/// Настройка ячейки "Есть в инстаграм"
final class IsOnInstViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak var userTextLabel: UILabel!
    @IBOutlet weak private var subscribeButton: UIButton!
    
    // MARK: - Public method
    public func setup(_ content: NotificationModel) {
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.height / 2
        userAvatarImageView.image = UIImage(named: content.userAvatarImageName)
        userTextLabel.text = content.userText
    }
}
