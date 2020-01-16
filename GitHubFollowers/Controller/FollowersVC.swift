//
//  FollowersVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/1/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class FollowersVC: UIViewController {
    
    // MARK: - UI Elements
    
    fileprivate lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        cv.backgroundColor = .systemBackground
        cv.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
        cv.delegate = self
        return cv
    }()
    
    // MARK: - Properties
    
    var username: String?
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers = [Follower]()
    var originalFollowers = [Follower]()
    var page = 1
    var hasMoreFollowers = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        fetchFollowers(username: username, page: page)
        configureDataSource()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setupLayout() {
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Functions
    
    fileprivate func fetchFollowers(username: String?, page: Int) {
        showLoadingView()
        
        guard let username = username else { return }
        
        NetworkManager.shared.getFollowers(for: username, pageNr: page) { [weak self] (result) in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
                
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                self.originalFollowers.append(contentsOf: followers)
                
                if self.followers.isEmpty {
                    let message = "This user doesn't have any followers. Go follow them!"
                    DispatchQueue.main.async {
                        self.showEmptyStateView(in: self.view, with: message)
                        return
                    }
                }
                
                self.updateData(with: self.followers)
                
            case.failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    fileprivate func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseId, for: indexPath) as? FollowerCell else { return nil}
            cell.configure(follower: follower)
            return cell
        })
    }
    
    fileprivate func updateData(with followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    fileprivate func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
}

extension FollowersVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            fetchFollowers(username: username, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let follower = followers[indexPath.item]
        
        let userInfoVC = UserInfoVC()
        userInfoVC.username = follower.login
        
        let navC = UINavigationController(rootViewController: userInfoVC)
        
        present(navC, animated: true)
    }
}

extension FollowersVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        
        followers = originalFollowers.filter { $0.login.lowercased().contains(filter.lowercased()) }
        updateData(with: followers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        followers = originalFollowers
        updateData(with: followers)
    }
    
}
