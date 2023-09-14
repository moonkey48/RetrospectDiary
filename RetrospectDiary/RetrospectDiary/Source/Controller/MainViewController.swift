//
//  ViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/09.
//

import UIKit

let restospectDummyData = [
    RetrospectModel(title: "NC2를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
    RetrospectModel(title: "MC3를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
    RetrospectModel(title: "NC1을 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
    RetrospectModel(title: "MC2를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
    RetrospectModel(title: "MC1를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
]

class MainViewController: UIViewController {
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
    lazy var topImage = UIImage(named: "mainVC_character")
    lazy var bottomButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        setConstraints()
    }
    
    private func setAttributes(){
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellId)
        tableView.backgroundColor = .white
        tableView.sectionFooterHeight = 7
        tableView.sectionHeaderHeight = 7
        
        setButtonAttributes()
    }
    private func setButtonAttributes(){
        bottomButton.setTitle("새로운 회고", for: .normal)
        bottomButton.setImage(UIImage(systemName: "plus"), for: .normal)
        bottomButton.backgroundColor = .white
    }
    
    private func setConstraints(){
        let topImageView = UIImageView(image: topImage)
        [tableView, topImageView, bottomButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topImageView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomButton.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        restospectDummyData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellId, for: indexPath)
        setTableCellAttributes(cell, indexPath)
        
        return cell
    }
    
    private func setTableCellAttributes(_ cell: UITableViewCell, _ indexPath: IndexPath) {
        guard let customCell = cell as? CustomTableViewCell else {
            return
        }
        let cellData = restospectDummyData[indexPath.section]
        customCell.dateLabel.text = Date.setDateFormat(date: cellData.startDate)
        customCell.titleLabel.text = cellData.title
        if let cssMethod = cellData.method as? CSSMethod {
            customCell.methodLabel.text = cssMethod.continuePoint
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let retrospectDetailViewController = RetrospectDetailViewController(restrospectData: restospectDummyData[indexPath.section])
        present(retrospectDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
}
