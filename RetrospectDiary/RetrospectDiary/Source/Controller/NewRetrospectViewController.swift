//
//  NewRetrospectViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/14.
//

import UIKit

class NewRetrospectViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.text = "new retrospect"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}
