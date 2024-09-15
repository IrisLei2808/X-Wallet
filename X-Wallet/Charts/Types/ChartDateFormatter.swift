//
//  ChartDateFormatter.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Primitives

struct ChartDateFormatter {
    
    private static let time: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
    
    private static let dateWithTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .long
        return formatter
    }()

    private static let dateNoTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        return formatter
    }()
    
    private let period: ChartPeriod
    private let date: Date
    
    public init(
        period: ChartPeriod,
        date: Date
    ) {
        self.period = period
        self.date = date
    }
    
    var formatter: DateFormatter {
        switch period {
        case .hour,
            .day,
            .week,
            .month:
            return ChartDateFormatter.dateWithTime
        case .quarter,
            .year,
            .all:
            return ChartDateFormatter.dateNoTime
        }
    }
    
    var dateText: String {
        if Calendar.current.isDateInToday(date) {
            return String(format: "%@, %@", Localized.Date.today, Self.time.string(from: date))
        } else if Calendar.current.isDateInYesterday(date) {
            return String(format: "%@, %@", Localized.Date.yesterday, Self.time.string(from: date))
        }
        return formatter.string(from: date)
    }
}
