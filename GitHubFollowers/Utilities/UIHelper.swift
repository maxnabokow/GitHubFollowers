//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/15/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

struct UIHelper {
        
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = .init(width: itemWidth, height: itemWidth + 40)
        
        return layout
    }
}
