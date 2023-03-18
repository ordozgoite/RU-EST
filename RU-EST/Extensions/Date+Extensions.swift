//
//  Date+Extensions.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 17/03/23.
//

import Foundation

extension Date {
    static func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
