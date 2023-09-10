//
//  ViewController.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/09.
//

import UIKit


class MainViewController: UIViewController {
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
    let data = [["Test 1-1","Test 1-2","Test 1-3","Test 1-4"],["Test 2-1","Test 2-2","Test 2-3"],["Test 3-1","Test 3-2"]]
    let header = ["Section 1","Section 2","Section 3"]
    
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
    }
    
    private func setConstraints(){
        [tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
//            retrospectListItem.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
}

