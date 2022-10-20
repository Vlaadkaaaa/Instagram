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
    private var tableCellsTypesArray: [TableSectionType] = [.now, .today, .yesterday, .lastWeek]
    private let contents = [
        NotificationModel(userAvatarImageName: Constants.monkeyOneImageName,
                          userText: Constants.userOneTextTitle,
                          userLikedPhotoName: Constants.monkeyTenImageName),
        NotificationModel(userAvatarImageName: Constants.monkeyTwoImageName,
                          userText: Constants.userTwoTextTitle,
                          userLikedPhotoName: Constants.monkeyEightImageName),
        NotificationModel(userAvatarImageName: Constants.monkeyThreeImageName,
                          userText: Constants.userThreeTextTitle,
                          userLikedPhotoName: Constants.monkeyTwoImageName),
        NotificationModel(userAvatarImageName: Constants.monkeyFourImageName,
                          userText: Constants.userFourTextTitle,
                          userLikedPhotoName: Constants.monkeyEightImageName),
        NotificationModel(userAvatarImageName: Constants.monkeyFiveImageName,
                          userText: Constants.userFiveTextTitle),
        NotificationModel(userAvatarImageName: Constants.monkeySixImageName,
                          userText: Constants.userSixTextTitle,
                          userLikedPhotoName: Constants.monkeyTenImageName),
        NotificationModel(userAvatarImageName: Constants.monkeySixImageName, userText: Constants.userSevenTextTitle),
        NotificationModel(userAvatarImageName: Constants.monkeySevenImageName,
                          userText: Constants.userEightTextTitle,
                          userLikedPhotoName: Constants.monkeyNineImageName),
        NotificationModel(userAvatarImageName: Constants.monkeySevenImageName,
                          userText: Constants.userNineTextTitle,
                          userLikedPhotoName: Constants.monkeyTenImageName),
    ]
    
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
        let numberRow = indexPath.row
        if numberRow == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.likedYouCellIdentifier,
                for: indexPath) as? LikedYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section])
            return cell
        } else if numberRow == 1 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mentionedYouCellIdentifier,
                for: indexPath) as? MentionedYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        } else if numberRow == 2 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.subscrubeForYouCellIdentifier,
                for: indexPath) as? SubscribeYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        } else if numberRow == 3 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.isOnInstCellIdentifier,
                for: indexPath) as? IsOnInstViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        } else if numberRow == 4 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mentionedYouCellIdentifier,
                for: indexPath) as? LikedYouViewCell else { return UITableViewCell() }
            cell.setup(contents[indexPath.row + indexPath.section + 1])
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        tableCellsTypesArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellsTypesArray[section]
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
        
        return "\(tableCellsTypesArray[section])"
    }
}
