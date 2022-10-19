//
//  ContentCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 17.10.2022.
//

import UIKit

/// Ячейка контента
final class ContentCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userName2: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func setContent(content: Content) {
        userName.text = content.userName
        userPhoto.layer.cornerRadius = userPhoto.frame.height / 2
        userPhoto.image = content.userImage
        contentImage.image = content.image
        contentImage.sizeToFit()
        userName2.text = content.userName
        title.text = content.title
    }
}
