//
//  RetrospectMethodModel.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/10.
//

import Foundation

enum RetrospectMethod {
    case css
    case kpt
    case fiveF
    case fourL
    case pmi
}

struct CSSMethod: RetrospectMethodTypeProtocol {
    var methodType: RetrospectMethod = .css
    var continuePoint: String
    var stopPoint: String
    var startPoint: String
}

struct KPTMethod: RetrospectMethodTypeProtocol {
    var methodType: RetrospectMethod = .kpt
    var keepPoint: String
    var tryPoint: String
    var problemPoint: String
}

struct FiveFMethod: RetrospectMethodTypeProtocol {
    var methodType: RetrospectMethod = .fiveF
    var factPotint: String
    var feelingPoint: String
    var findingPoint: String
    var futurePoint: String
    var feedbackPoint: String
}

struct FourLMethod: RetrospectMethodTypeProtocol {
    var methodType: RetrospectMethod = .fourL
    var likedPoint: String
    var lackedPoint: String
    var learnedPoint: String
    var longedForPoint: String
}

struct PMIMethod: RetrospectMethodTypeProtocol {
    var methodType: RetrospectMethod = .pmi
    var pluePoint: String
    var minuePoint: String
    var interestingPoint: String
}
