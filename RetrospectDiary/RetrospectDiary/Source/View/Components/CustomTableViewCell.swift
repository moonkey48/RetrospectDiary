//
//  CustomTableViewCell.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/10.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let cellId = "CustomTableViewCell"
    var restospectModel = RetrospectModel(title: "MC2를 보내며", method: CSSMethod(continuePoint: "", stopPoint: "", startPoint: ""))

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
