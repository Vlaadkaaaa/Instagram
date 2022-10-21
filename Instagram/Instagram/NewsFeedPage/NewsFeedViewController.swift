//
//  ViewController.swift
//  Instagram
//
//  Created by Владислав Лымарь on 17.10.2022.
//

import UIKit

/// Лента новых пуликация
final class NewsFeedViewController: UIViewController {
    
   private enum TableCellTypes {
        case stories
        case startPost
        case post
        case recomended
    }
    
    // MARK: - Private Constant
    private enum Constant {
        static let storyCellIdentifier = "StoryCell"
        static let userPostCellIdentifier = "UserPostCell"
        static let recomendedMyCellIdentifier = "RecomendedMyCell"
        static let userOnePostName = "snoop"
        static let onePostTitle = "Hello, World!"
        static let onePostImageName = "snoop2"
        static let userTwoPostName = "buzova"
        static let userTwoAvatarImageName = "peopl2"
        static let twoPostTitle = "Get high. Life is one"
        static let twoPostImageName = "buzova"
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Private Property
    private let contents = [Content(userName: Constant.userOnePostName,
                                    userImageName: Constant.userOnePostName, title: Constant.onePostTitle,
                                    contentImageName: Constant.onePostImageName),
                            Content(userName: Constant.userTwoPostName,
                                    userImageName: Constant.userTwoAvatarImageName,
                                    title: Constant.twoPostTitle,
                                    contentImageName: Constant.twoPostImageName)]
    private var tableCellsTypesArray: [TableCellTypes] = [.stories, .startPost, .recomended, .post]
    
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
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableCellsTypesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellsTypesArray[section]
        switch type {
        case .startPost:
            return 1
        case .recomended:
            return 1
        case .stories:
            return 1
        case .post:
            return contents.count - 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var content: Content
        let defaultCell = UITableViewCell()
        let type = tableCellsTypesArray[indexPath.section]
        
        switch type {
        case .startPost:
            content = contents[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.userPostCellIdentifier,
                for: indexPath) as? ContentViewCell else { return defaultCell }
            cell.setContent(content: content)
            cell.selectionStyle = .none
            return cell
        case .recomended:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.recomendedMyCellIdentifier,
                                                           for: indexPath) as? RecomendedViewCell else {
                return defaultCell }
            cell.selectionStyle = .none
            return cell
        case .post:
            content = contents[indexPath.row + 1]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.userPostCellIdentifier,
                for: indexPath) as? ContentViewCell else { return defaultCell }
            cell.setContent(content: content)
            cell.selectionStyle = .none
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.storyCellIdentifier,
                for: indexPath) as? StoriesViewCell else { return defaultCell }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
