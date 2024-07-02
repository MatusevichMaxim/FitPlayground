//
//  Date+Extensions.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/1/24.
//

import Foundation

extension Date {
    var erasedTime: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var dayOfWeek: String {
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "EEE"
        return dateFormatted.string(from: self)
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: self)
    }
}
