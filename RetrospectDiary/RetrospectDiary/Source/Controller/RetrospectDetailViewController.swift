//
//  RetrospectDetailViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/12.
//

import UIKit

class RetrospectDetailViewController: UIViewController {
    var retrospectData: RetrospectModel
    required init(restrospectData: RetrospectModel) {
        self.retrospectData = restrospectData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.text = retrospectData.title
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
