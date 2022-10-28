//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 21.10.2022.
//

import UIKit

///  Настройка показа сторис
final class StoryCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak private var storiesImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    
    // MARK: - Methods
    func setupStories(_ contnet: Stories) {
        storiesImageView.layer.cornerRadius = storiesImageView.frame.height / 2
        storiesImageView.image =  UIImage(named: contnet.storiesImageName)
        nameLabel.text = contnet.storiesTitle
    }
}
