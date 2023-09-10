//
//  RetrospectListItemView.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/09.
//

import UIKit

class RetrospectListItemView: UIView {
    lazy var dateLabel: UILabel = {
        var dateTextLabel = UILabel()
        dateTextLabel.text = "6월 3일"
        dateTextLabel.textColor = .white
        return dateTextLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
