//
//  ViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/09.
//

import UIKit


class MainViewController: UIViewController {
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
    lazy var topImage = UIImage(named: "mainVC_character")
    
    let restospectDummyData = [
        RetrospectModel(title: "MC3를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
        RetrospectModel(title: "MC2를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
        RetrospectModel(title: "MC1를 보내며", method: CSSMethod(continuePoint: "최선을 다했다.", stopPoint: "최선을 다하지 못했다.", startPoint: "최선을 다하자")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    
    private func configureUI(){
        setAttributes()
    }
    
    private func setAttributes(){
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.backgroundColor = .white
    }
    
    private func setConstraints(){
        let topImageView = UIImageView(image: topImage)
        [tableView, topImageView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topImageView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        setTableCellAttributes(cell, indexPath)
        return cell
    }
    private func setTableCellAttributes(_ cell: UITableViewCell, _ indexPath: IndexPath) {
        let cellData = restospectDummyData[indexPath.row]
        setTableCellDateLabel(cell, cellData)
        setTableCellTitleLabel(cell, cellData)
        setTableCellDescription(cell, cellData)
    }
    private func setTableCellDateLabel(_ cell: UITableViewCell, _ cellData: RetrospectModel) {
        let dateLabel = UILabel()
        
        dateLabel.text = cellData.endDate.description
        cell.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 16).isActive = true
    }
    
    private func setTableCellTitleLabel(_ cell:UITableViewCell, _ cellData: RetrospectModel) {
        let titleLabel = UILabel()
        titleLabel.text = cellData.title
        cell.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 36).isActive = true
    }
    private func setTableCellDescription(_ cell:UITableViewCell, _ cellData: RetrospectModel) {
        let methodLabel = UILabel()
        if let method = cellData.method as? CSSMethod {
            methodLabel.text = method.continuePoint
        }
        cell.addSubview(methodLabel)

        methodLabel.translatesAutoresizingMaskIntoConstraints = false
        methodLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        methodLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 86).isActive = true
    }
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)\(indexPath.row)")
        tableView.cellForRow(at: indexPath)?.backgroundColor = .blue
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
}

