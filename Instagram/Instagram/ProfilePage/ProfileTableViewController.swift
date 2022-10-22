//
//  ProfileTableViewController.swift
//  Instagram
//
//  Created by Владислав Лымарь on 21.10.2022.
//

import UIKit

/// Профиль пользователя
final class ProfileTableViewController: UITableViewController {
    
    private enum TablleCell {
    case header
        case bio
        case topicalStory
        case content
    }
    
    // MARK: - Private Property
   private let countCell: [TablleCell] = [.header, .bio, .topicalStory, .content]
    private let stories: [Stories] = [
        Stories(storiesImageName: "monkeyOne", storiesText: "monkeyOne"),
        Stories(storiesImageName: "monkeyTwo", storiesText: "monkeyTwo"),
        Stories(storiesImageName: "monkeyThree", storiesText: "monkeyThree"),
        Stories(storiesImageName: "monkeyFour", storiesText: "monkeyFour"),
        Stories(storiesImageName: "monkeyFive", storiesText: "monkeyFive"),
        Stories(storiesImageName: "monkeySix", storiesText: "monkeySix"),
        Stories(storiesImageName: "monkeySeven", storiesText: "monkeySeven"),
        Stories(storiesImageName: "monkeyNine", storiesText: "monkeyNine"),
        Stories(storiesImageName: "monkeyTen", storiesText: "monkeyTen"),
    ]
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countCell.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = countCell[indexPath.section]
        switch type {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell",
                                                        for: indexPath) 
                return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BioCell",
                                                        for: indexPath)
                return cell
            
        case .topicalStory:
           if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicalStoriesCell",
                                                       for: indexPath) as? TopicalStoriesTableViewCell {
                return cell
           }
        case .content:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell",
                                                        for: indexPath)
                return cell
            
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ProfileTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let content = stories[indexPath.row]
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell",
                                                             for: indexPath) as? StoryCollectionViewCell {
                cell.setup(content)
                return cell
            }
        case 2:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell",
                                                             for: indexPath) as? ContentCollectionViewCell {
                cell.imageView.image = UIImage(named: "monkeyTen")
                
                return cell
            }
        default: break
        }
      
            return UICollectionViewCell()
    }

}
