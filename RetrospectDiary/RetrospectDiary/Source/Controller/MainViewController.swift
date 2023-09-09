//
//  ViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/09.
//

import UIKit

class MainViewController: UIViewController {
    lazy var dateLabel: UILabel = {
        var dateTextLabel = UILabel()
        dateTextLabel.text = "6월 3일"
        dateTextLabel.textColor = .white
        return dateTextLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    private func configureUI(){
        setAttributes()
    }
    private func setAttributes(){
        
    }
    private func setConstraints(){
        [dateLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            dateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
        ])
        
    }


}

