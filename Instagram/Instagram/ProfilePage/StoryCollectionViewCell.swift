//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 21.10.2022.
//

import UIKit

///
final class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storiesImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setup(_ contnet: Stories) {
        storiesImageView.layer.cornerRadius = storiesImageView.frame.height / 2
        storiesImageView.image =  UIImage(named: contnet.storiesImageName)
        nameLabel.text = contnet.storiesText
        
    }
}
