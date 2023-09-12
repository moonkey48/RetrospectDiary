//
//  Date+Extension.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/11.
//

import Foundation

extension Date {
    static func setDateFormat(date: Date) -> String{
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "ko_KR")
        dateFormmater.dateFormat = "yy년 M월 dd일"
        
        return dateFormmater.string(from: date)
    }
}
