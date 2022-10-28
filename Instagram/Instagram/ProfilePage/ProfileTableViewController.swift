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
    
    // MARK: - Private Constants
    private enum Contants {
        static let headerCellIdentifier = "HeaderCell"
        static let bioCellIdentifier = "BioCell"
        static let topicalStoriesCellIdentifier = "TopicalStoriesCell"
        static let contentCellIdentifier = "ContentCell"
        static let storyCollectionCellIdentifier = "StoryCollectionCell"
        static let contentCollectionCellIdentifier = "ContentCollectionCell"
        static let monkeyOneImageName = "monkeyOne"
        static let monkeyTwoImageName = "monkeyTwo"
        static let monkeyThreeImageName = "monkeyThree"
        static let monkeyFourImageName = "monkeyFour"
        static let monkeyFiveImageName = "monkeyFive"
        static let monkeySixImageName = "monkeySix"
        static let monkeySevenImageName = "monkeySeven"
        static let monkeyEightImageName = "monkeyEight"
        static let monkeyNineImageName = "monkeyNine"
        static let monkeyTenImageName = "monkeyTen"
    }
    
    // MARK: - Private Property
    private let countCell: [TablleCell] = [.header, .bio, .topicalStory, .content]
    private let stories: [Stories] = [
        Stories(storiesImageName: Contants.monkeyOneImageName,
                storiesTitle: Contants.monkeyOneImageName),
        Stories(storiesImageName: Contants.monkeyTwoImageName,
                storiesTitle: Contants.monkeyTwoImageName),
        Stories(storiesImageName: Contants.monkeyThreeImageName,
                storiesTitle: Contants.monkeyThreeImageName),
        Stories(storiesImageName: Contants.monkeyFourImageName,
                storiesTitle: Contants.monkeyFourImageName),
        Stories(storiesImageName: Contants.monkeyFiveImageName,
                storiesTitle: Contants.monkeyFiveImageName),
        Stories(storiesImageName: Contants.monkeySixImageName,
                storiesTitle: Contants.monkeySixImageName),
        Stories(storiesImageName: Contants.monkeySevenImageName,
                storiesTitle: Contants.monkeySevenImageName),
        Stories(storiesImageName: Contants.monkeyNineImageName,
                storiesTitle: Contants.monkeyNineImageName),
        Stories(storiesImageName: Contants.monkeyTenImageName,
                storiesTitle: Contants.monkeyTenImageName)
    ]
    private let contents: [ContentProfile] = [
        ContentProfile(contentImageName: Contants.monkeyOneImageName),
        ContentProfile(contentImageName: Contants.monkeyTwoImageName),
        ContentProfile(contentImageName: Contants.monkeyThreeImageName),
        ContentProfile(contentImageName: Contants.monkeyFourImageName),
        ContentProfile(contentImageName: Contants.monkeyFiveImageName),
        ContentProfile(contentImageName: Contants.monkeySixImageName),
        ContentProfile(contentImageName: Contants.monkeySevenImageName),
        ContentProfile(contentImageName: Contants.monkeyEightImageName),
        ContentProfile(contentImageName: Contants.monkeyNineImageName),
        ContentProfile(contentImageName: Contants.monkeyTenImageName),
        ContentProfile(contentImageName: Contants.monkeyFiveImageName)
    ]
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
    }
    
    // MARK: Private Methods
    private func setupRefreshControl() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshPageAction), for: .valueChanged)
        tableView.refreshControl = refresh
    }
    
    @objc private func refreshPageAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: - TableView DataSource, Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        countCell.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = countCell[indexPath.section]
        switch type {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: Contants.headerCellIdentifier,
                                                     for: indexPath)
            return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(withIdentifier: Contants.bioCellIdentifier,
                                                     for: indexPath)
            return cell
            
        case .topicalStory:
            let cell = tableView.dequeueReusableCell(withIdentifier: Contants.topicalStoriesCellIdentifier,
                                                     for: indexPath)
            return cell
        case .content:
            let cell = tableView.dequeueReusableCell(withIdentifier: Contants.contentCellIdentifier,
                                                     for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return stories.count
        case 1:
            return contents.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let content = stories[indexPath.row]
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Contants.storyCollectionCellIdentifier,
                for: indexPath) as? StoryCollectionViewCell {
                cell.setupStories(content)
                return cell
            }
        case 1:
            let content = contents[indexPath.row]
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Contants.contentCollectionCellIdentifier,
                for: indexPath) as? ContentCollectionViewCell {
                cell.setupContent(content)
                return cell
            }
        default: break
        }
        return UICollectionViewCell()
    }
    
}
