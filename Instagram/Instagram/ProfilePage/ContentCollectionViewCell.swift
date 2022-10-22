//
//  ContentCollectionViewCell.swift
//  Instagram
//
//  Created by Владислав Лымарь on 22.10.2022.
//

import UIKit

///
final class ContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var contentImageView: UIImageView!
    
    // MARK: - Methods
    func setupView(_ content: ContentProfile) {
        contentImageView.image = UIImage(named: content.contentImageName)
    }
}
