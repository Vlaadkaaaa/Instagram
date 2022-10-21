//
//  IsOnInstViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

/// Настройка ячейки "Есть в инстаграм"
final class OnInstViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak private var userTextLabel: UILabel!
    @IBOutlet weak private var subscribeButton: UIButton!
    
    // MARK: - Public method
    public func setup(_ content: Notification) {
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.height / 2
        userAvatarImageView.image = UIImage(named: content.userAvatarImageName)
        userTextLabel.text = content.userText
    }
}
