//
//  CustomTableViewCell.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/10.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var dateLabel = UILabel()
    var bgView = UIView()
    var methodLabel = UILabel()
    var titleLabel = UILabel()
    
    static let cellId = "CustomTableViewCell"
    var restospectModel = RetrospectModel(title: "MC2를 보내며", method: CSSMethod(continuePoint: "", stopPoint: "", startPoint: ""))

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.masksToBounds = false
        clipsToBounds = false
        setBackground(self)
        setTableCellDateLabel(self, restospectModel)
        setTableCellTitleLabel(self, restospectModel)
        setTableCellDescription(self, restospectModel)
        setTableCellInnerDivider(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
//        profileImageView.image = nil
    }
    
    deinit {
        print("deinit")
    }
    
    private func setBackground(_ cell: UITableViewCell) {
        cell.addSubview(bgView)
        
        bgView.layer.cornerRadius = 10
        bgView.backgroundColor = .white
        bgView.layer.masksToBounds = false
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.systemGray6.cgColor
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0),
            bgView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 0),
            bgView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0),
        ])
    }
    
    private func setTableCellDateLabel(_ cell: UITableViewCell, _ cellData: RetrospectModel) {
        dateLabel.text = Date.setDateFormat(date: cellData.endDate)
        cell.addSubview(dateLabel)
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        dateLabel.textColor = UIColor(named: "custom_gray1")
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 16).isActive = true
    }
    
    private func setTableCellTitleLabel(_ cell:UITableViewCell, _ cellData: RetrospectModel) {
        cell.addSubview(titleLabel)
        titleLabel.text = cellData.title
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = UIColor(named: "custom_gray3")

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 36).isActive = true
    }
    private func setTableCellInnerDivider(_ cell: UITableViewCell) {
        let divider = UIView()
        cell.addSubview(divider)
        divider.backgroundColor = UIColor(named: "custom_gray0")
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.topAnchor.constraint(equalTo: cell.topAnchor, constant: 70).isActive = true
        divider.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        divider.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 16).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    private func setTableCellDescription(_ cell:UITableViewCell, _ cellData: RetrospectModel) {
        if let method = cellData.method as? CSSMethod {
            methodLabel.text = method.continuePoint
        }
        cell.addSubview(methodLabel)

        methodLabel.translatesAutoresizingMaskIntoConstraints = false
        methodLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16).isActive = true
        methodLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 86).isActive = true
    }
}
