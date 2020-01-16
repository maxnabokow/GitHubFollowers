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
        let layout = UICollectionViewFlowLayout()
        
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = .init(width: itemWidth, height: itemWidth + 40)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
        return cv
    }()
    
    // MARK: - Properties
    
    enum Section {
        case main
    }
    
    var username: String?
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers = [Follower]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        fetchFollowers()
        configureDataSource()
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
    
    fileprivate func fetchFollowers() {
        guard let username = username else { return }
        
        NetworkManager.shared.getFollowers(for: username, pageNr: 1) { (result) in
            switch result {
                
            case .success(let followers):
                self.followers = followers
                self.updateData()
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
    
    fileprivate func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
}
