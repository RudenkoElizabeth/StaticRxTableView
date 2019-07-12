//
//  Constants.swift
//  StaticRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RxDataSources

class Constants {
    enum CellType: Int {
        case profile
        case distanceCalories
        case timeSpeed
        case stepsFloors
        case startDate
        case endDate
        case location
    }
    static let userImage = "User"
    static let title: [CellType: String] = [
        .profile: "Martina Henderson",
        .startDate: "Start Date",
        .endDate: "End Date",
        .location: "Location"
    ]
    static let subtitle: [CellType: String] = [
        .profile: "New York",
        .startDate: "2.05.19 13.00",
        .endDate: "2.05.19 15.00",
        .location: "Los Angeles"
    ]
    static let firstValue: [CellType: String] = [
        .distanceCalories: "1000",
        .timeSpeed: "15",
        .stepsFloors: "40",
    ]
    static let secondValue: [CellType: String] = [
        .distanceCalories: "10",
        .timeSpeed: "120",
        .stepsFloors: "2000"
    ]
    static let firstMeasure: [CellType: String] = [
        .distanceCalories: "km",
        .timeSpeed: "min",
        .stepsFloors: "steps",
    ]
    static let secondMeasure: [CellType: String] = [
        .distanceCalories: "kсal",
        .timeSpeed: "km/h",
        .stepsFloors: "floors",
    ]
    static func getCellIdentifier(_ cellTYpe: CellType) -> String {
        switch cellTYpe {
        case .profile:
            return "ProfileCell"
        case .distanceCalories:
            return "WorkoutExtendedCell"
        case .timeSpeed, .stepsFloors:
            return "WorkoutCell"
        case .startDate, .endDate, .location:
            return "MainCell"
        }
    }
}

extension Constants.CellType: IdentifiableType {
    var identity: Int { return rawValue }
}
