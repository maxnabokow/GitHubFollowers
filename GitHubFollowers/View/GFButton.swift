//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 12/28/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GFButton: UIButton {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
        setupUI()
        
        addTarget(self, action: #selector(animatePressDown), for: .touchDown)
        addTarget(self, action: #selector(animatePressUp), for: .touchDragExit)
        addTarget(self, action: #selector(animatePressDown), for: .touchDragEnter)
        addTarget(self, action: #selector(animatePressUp), for: .touchUpInside)
    }
    
    // MARK: - Helper Functions
    
    @objc fileprivate func animatePressDown() {
        UIButton.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        })
    }
    
    @objc fileprivate func animatePressUp() {
        UIButton.animate(withDuration: 0.1, animations: {
            self.transform = .identity
        })
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        layer.cornerRadius = 12
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
