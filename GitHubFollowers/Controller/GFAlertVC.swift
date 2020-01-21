//
//  GFAlertVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/1/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {

    // MARK: - UI Elements

    fileprivate let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.layer.cornerRadius = 16
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.white.cgColor
        return v
    }()

    fileprivate lazy var titleLabel: UILabel = {
        let l = GFTitleLabel(textAlignment: .center, fontSize: 28)
        l.text = alertTitle ?? "Something went wrong."
        return l
    }()

    fileprivate lazy var messageLabel: UILabel = {
        let l = GFBodyLabel(textAlignment: .center)
        l.text = message ?? "Unable to complete request"
        l.numberOfLines = 4
        return l
    }()

    fileprivate lazy var actionButton: UIButton = {
        let b = GFButton(backgroundColor: .systemPink, title: "OK")
        b.setTitle(buttonTitle ?? "OK", for: .normal)
        b.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return b
    }()

    // MARK: - Properties

    var alertTitle: String?
    var message: String?
    var buttonTitle: String?

    let padding: CGFloat = 20

    // MARK: - Init

    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)

        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
    }

    // MARK: - Selectors

    @objc fileprivate func dismissVC() {
        dismiss(animated: true)
    }

    // MARK: - Helper Functions

    // MARK: - UI Setup

    fileprivate func setupUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }

    fileprivate func setupLayout() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])

        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])

        containerView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        containerView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
