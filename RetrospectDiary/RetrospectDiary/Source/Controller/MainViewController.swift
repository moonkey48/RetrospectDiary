//
//  ViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/09.
//

import UIKit


class MainViewController: UIViewController {
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
    let restospectDummyData = [
        RetrospectModel(title: "MC3를 보내며", method: CSSMethod(continuePoint: "1", stopPoint: "2", startPoint: "3")),
        RetrospectModel(title: "MC2를 보내며", method: CSSMethod(continuePoint: "1", stopPoint: "2", startPoint: "3")),
        RetrospectModel(title: "MC1를 보내며", method: CSSMethod(continuePoint: "1", stopPoint: "2", startPoint: "3")),
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
    }
    
    private func setConstraints(){
        [tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restospectDummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        cell.textLabel?.text = restospectDummyData[indexPath.row].title
        return cell
    }
}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)\(indexPath.row)")
        tableView.cellForRow(at: indexPath)?.backgroundColor = .blue
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

