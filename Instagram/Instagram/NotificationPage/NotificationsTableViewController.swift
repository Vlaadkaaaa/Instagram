//
//  NotificationsTableViewController.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

/// Страница уведомлений
final class NotificationsTableViewController: UITableViewController {
    
    // MARK: - TableSectionType
    private enum TableSectionType {
        case now
        case today
        case yesterday
        case lastWeek
    }
    
    // MARK: - Constant
    private enum Constants {
        static let likedYouCellIdentifier = "LikedYouCell"
        static let mentionedYouCellIdentifier = "MentionedYouCell"
        static let subscrubeForYouCellIdentifier = "SubscrubeForYouCell"
        static let isOnInstCellIdentifier = "IsOnInstCell"
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
        static let userOneTextTitle = "monkeyOne понравился ваш комментарий ну и морда 1 ч."
        static let userTwoTextTitle = "monkeyEight нравится ваше фото 12 ч."
        static let userThreeTextTitle = "mmonkeyThree упомянул вас в комментарии: Вай какая @vlaadkaaaa 1 д."
        static let userFourTextTitle = "monkeyFour упомянул вас в комментарии Очки топ 14 ч."
        static let userFiveTextTitle = "monkeyFive подписалась на ваши обновления 19 ч."
        static let userSixTextTitle = "monkeySix упомянул вас в комментарии: Балдежное фото 2 д."
        static let userSevenTextTitle = "monkeySix подписалась на ваши обновления 2 д."
        static let userEightTextTitle = "monkeySeven есть в Instagram. Вы можете знать эту обезьяну 5 д."
        static let userNineTextTitle = "monkeySeven нравится ваше фото 7 д."
    }
    
    // MARK: - Private properties
    private let contents = [
        Notification(userAvatarImageName: Constants.monkeyOneImageName,
                     userText: Constants.userOneTextTitle,
                     userLikedPhotoName: Constants.monkeyTenImageName),
        Notification(userAvatarImageName: Constants.monkeyTwoImageName,
                     userText: Constants.userTwoTextTitle,
                     userLikedPhotoName: Constants.monkeyEightImageName),
        Notification(userAvatarImageName: Constants.monkeyThreeImageName,
                     userText: Constants.userThreeTextTitle,
                     userLikedPhotoName: Constants.monkeyTwoImageName),
        Notification(userAvatarImageName: Constants.monkeyFourImageName,
                     userText: Constants.userFourTextTitle,
                     userLikedPhotoName: Constants.monkeyEightImageName),
        Notification(userAvatarImageName: Constants.monkeyFiveImageName,
                     userText: Constants.userFiveTextTitle),
        Notification(userAvatarImageName: Constants.monkeySixImageName,
                     userText: Constants.userSixTextTitle,
                     userLikedPhotoName: Constants.monkeyTenImageName),
        Notification(userAvatarImageName: Constants.monkeySixImageName, userText: Constants.userSevenTextTitle),
        Notification(userAvatarImageName: Constants.monkeySevenImageName,
                     userText: Constants.userEightTextTitle,
                     userLikedPhotoName: Constants.monkeyNineImageName),
        Notification(userAvatarImageName: Constants.monkeySevenImageName,
                     userText: Constants.userNineTextTitle,
                     userLikedPhotoName: Constants.monkeyTenImageName),
    ]
    
    private var tableCellsTypes: [TableSectionType] = [.now, .today, .yesterday, .lastWeek]
    
    // MARK: - Life Cycle
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
    
    private func setupTableCell(_ indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellsTypes[indexPath.section]
        switch type {
        case .now:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.likedYouCellIdentifier,
                for: indexPath) as? LikedYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section])
            return cell
        case .today:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mentionedYouCellIdentifier,
                for: indexPath) as? MentionedYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        case .yesterday:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.subscrubeForYouCellIdentifier,
                for: indexPath) as? SubscribeYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        case .lastWeek:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.isOnInstCellIdentifier,
                for: indexPath) as? OnInstViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        tableCellsTypes.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellsTypes[section]
        switch type {
        case .now:
            return 2
        case .today:
            return 3
        case .yesterday:
            return 1
        case .lastWeek:
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        setupTableCell(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(tableCellsTypes[section])"
    }
}
