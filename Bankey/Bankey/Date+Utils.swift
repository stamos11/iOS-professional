//
//  Date+Utils.swift
//  Bankey
//
//  Created by stamoulis nikolaos on 27/1/24.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT+2")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "d MMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
