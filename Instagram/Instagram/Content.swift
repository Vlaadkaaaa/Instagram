//
//  Content.swift
//  Instagram
//
//  Created by Владислав Лымарь on 17.10.2022.
//

import UIKit

/// Настройка контента
final class Content {
    var userName: String
    var userImage: UIImage
    var title: String
    var image: UIImage
    
    init(userName: String, userImage: UIImage, title: String, image: UIImage) {
        self.userName = userName
        self.userImage = userImage
        self.title = title
        self.image = image
    }
}
