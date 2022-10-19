//
//  ViewController.swift
//  Instagram
//
//  Created by Владислав Лымарь on 17.10.2022.
//

import UIKit

/// Лента новых пуликация
final class NewsFeedViewController: UIViewController {
    
    // MARK: - Private Constant
    private enum Constant {
        static let storyCellIdentifier = "StoryCell"
        static let userPostCellIdentifier = "UserPostCell"
        static let recomendedMyCellIdentifier = "RecomendedMyCell"
        static let userOnePostName = "snoop"
        static let onePostTitle = "Hello, World!"
        static let onePostImage = "snoop2"
        static let userTwoPostName = "buzova"
        static let userTwoAvatarImage = "peopl2"
        static let twoPostTitle = "Get high. Life is one"
        static let twoPostImage = "buzova"
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Private Property
    private let contents = [Content(userName: Constant.userOnePostName,
                                    userImage: UIImage(named: Constant.userOnePostName) ?? UIImage(),
                                    title: Constant.onePostTitle,
                                    image: UIImage(named: Constant.onePostImage) ?? UIImage()),
                            Content(userName: Constant.userTwoPostName,
                                    userImage: UIImage(named: Constant.userTwoAvatarImage) ?? UIImage(),
                                    title: Constant.twoPostTitle,
                                    image: UIImage(named: Constant.twoPostImage ) ?? UIImage())]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPage()

    }
    
    // MARK: - Private func
    private func refreshPage() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshPageAction), for: .valueChanged)
        tableView.refreshControl = refresh
    }
    
    @objc func refreshPageAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var content: Content
        let defaultCell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.storyCellIdentifier,
                for: indexPath) as? StoriesCell else { return defaultCell }
            return cell
        case 1:
            content = contents[indexPath.row - 1]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.userPostCellIdentifier,
                                                           for: indexPath) as? ContentCell else { return defaultCell }
            cell.setContent(content: content)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.recomendedMyCellIdentifier,
                                                           for: indexPath) as? RecomendedCell else {
                return defaultCell }
            return cell
        case 3:
            content = contents[indexPath.row - 2]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.userPostCellIdentifier,
                                                           for: indexPath) as? ContentCell else { return defaultCell }
            cell.setContent(content: content)
            return cell
        default: break
        }
        
        return UITableViewCell()
    }
}
