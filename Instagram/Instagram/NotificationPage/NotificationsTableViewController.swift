//
//  NotificationsTableViewController.swift
//  Instagram
//
//  Created by Владислав Лымарь on 19.10.2022.
//

import UIKit

///
final class NotificationsTableViewController: UITableViewController {
    
    private enum TableSectionType {
        case now
        case today
        case yesterday
        case lastWeek
    }
    
    private enum TableCellTypes {
        case likedYouPhoto
        case likedYouComment
        case mentionedYou
        case subscribeYou
        case isOnInst
    }
    
    // MARK: - Private properties
    private var tableCellsTypesArray: [TableSectionType] = [.now, .today, .yesterday, .lastWeek]
    private let content = [NotificationModel(userAvatarImageName: "", userText: ""),
                           NotificationModel(userAvatarImageName: "", userText: "", userLikedPhotoName: ""),
                           NotificationModel(userAvatarImageName: "", userText: ""),
                           NotificationModel(userAvatarImageName: "", userText: "", userLikedPhotoName: ""),
                           NotificationModel(userAvatarImageName: "", userText: ""),
                           NotificationModel(userAvatarImageName: "", userText: "", userLikedPhotoName: ""),
                           NotificationModel(userAvatarImageName: "", userText: ""),
                           NotificationModel(userAvatarImageName: "", userText: "", userLikedPhotoName: ""),
                           NotificationModel(userAvatarImageName: "", userText: ""),
                           NotificationModel(userAvatarImageName: "", userText: "", userLikedPhotoName: ""),
                           NotificationModel(userAvatarImageName: "", userText: "")
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let type = tableCellsTypesArray[indexPath.section]
//        switch type {
//        case .now:
//            
//        case .today:
//            
//        case .yesterday:
//            
//        case .lastWeek:
//            
//        }
        
        if indexPath.row == 1 {
        let content = NotificationModel(userAvatarImageName: "snoop",
                                        userText: "Buzova the best", userLikedPhotoName: "snoop")
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "LikedYouCommentCell",
            for: indexPath) as? LikedYouCommentViewCell else { return UITableViewCell() }
            cell.setup(content)
            return cell
        } else {
            let content = NotificationModel(userAvatarImageName: "buzova",
                                            userText: "Buzova the best")
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "SubscrubeForYouCell",
                for: indexPath) as? SubscribeYouViewCell else { return UITableViewCell() }
                cell.setup(content)
                return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(tableCellsTypesArray[section])"
    }
}
