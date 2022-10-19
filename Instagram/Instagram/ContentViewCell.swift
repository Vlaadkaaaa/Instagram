//
//  ContentCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 17.10.2022.
//

import UIKit

/// Ячейка контента
final class ContentViewCell: UITableViewCell {

    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var userNameTwoLabel: UILabel!
    @IBOutlet weak private var userAvatarImageView: UIImageView!
    @IBOutlet weak private var contentImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    
    func setContent(content: Content) {
        userNameLabel.text = content.userName
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.height / 2
        userAvatarImageView.image = UIImage(named: content.userImageName)
        contentImageView.image = UIImage(named: content.contentImageName)
        contentImageView.sizeToFit()
        userNameTwoLabel.text = content.userName
        titleLabel.text = content.title
    }
}
