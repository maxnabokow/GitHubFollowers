//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/1/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment

        setupUI()
    }

    // MARK: - UI Setup

    fileprivate func setupUI() {
        textColor = .secondaryLabel
        font = .preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
