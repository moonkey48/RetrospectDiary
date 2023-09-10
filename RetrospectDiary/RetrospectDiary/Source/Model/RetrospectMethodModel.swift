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

protocol RetrospectMethodType {
    var methodType: RetrospectMethod { get set }
}

struct CSSMethod: RetrospectMethodType {
    var methodType: RetrospectMethod = .css
    var continuePoint: String
    var stopPoint: String
    var startPoint: String
}

struct KPTMethod {
    var methodType: RetrospectMethod = .kpt
    var keepPoint: String
    var tryPoint: String
    var problemPoint: String
}

struct FiveFMethod {
    var methodType: RetrospectMethod = .fiveF
    var factPotint: String
    var feelingPoint: String
    var findingPoint: String
    var futurePoint: String
    var feedbackPoint: String
}

struct FourLMethod {
    var methodType: RetrospectMethod = .fourL
    var likedPoint: String
    var lackedPoint: String
    var learnedPoint: String
    var longedForPoint: String
}

struct PMIMethod {
    var methodType: RetrospectMethod = .pmi
    var pluePoint: String
    var minuePoint: String
    var interestingPoint: String
}
