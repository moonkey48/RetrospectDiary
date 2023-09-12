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
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellId)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellId, for: indexPath)
        setTableCellAttributes(cell as! CustomTableViewCell, indexPath)
        
        return cell
    }
    private func setTableCellAttributes(_ cell: CustomTableViewCell, _ indexPath: IndexPath) {
        let cellData = restospectDummyData[indexPath.section]
        cell.dateLabel.text = Date.setDateFormat(date: cellData.startDate)
        cell.titleLabel.text = cellData.title
        if let cssMethod = cellData.method as? CSSMethod {
            cell.methodLabel.text = cssMethod.continuePoint
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)\(indexPath.row)")
        tableView.cellForRow(at: indexPath)?.backgroundColor = .blue
        let retrospectDetailViewController = RetrospectDetailViewController(restrospectData: restospectDummyData[indexPath.section])
        present(retrospectDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
}
