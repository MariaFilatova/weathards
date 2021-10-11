//
//  DateFormatterManager.swift
//  WeatherApp
//
//  Created by Waind Storm on 29.09.21.
//

import Foundation

public class DateFormatterManager {
    public static let shared: DateFormatterManager = DateFormatterManager()
    
    public func dateFormatter(for type: DateFormatterType) -> DateFormatter {
        switch type {
        case .hourMinute:
            return hourMinuteDateFormatter
        case .shortWeekdayAndFullDate:
            return shortWeekdayAndFullDateFormatter
        case .yearMonthDayShortTime:
            return yearMonthDayShortTimeDateFormatter
        case .fullDate:
            return fullDateFormatter
        case .fullNameDayOfWeek:
            return fullNameDayOfWeekFormatter
        }
    }
    
    func tryParseDate(from dateString: String, with formats: [DateFormatterType]) -> Date? {
        for format in formats {
            guard let date = dateFormatter(for: format).date(from: dateString) else { continue }
            return date
        }
        return nil
    }
    
    /// Date Formatter for "HH:mm"
    private lazy var hourMinuteDateFormatter: DateFormatter = createFormatter(dateFormat: .hourMinute)
    /// Date Formatter for "E, MMM d, yyyy"
    private lazy var shortWeekdayAndFullDateFormatter: DateFormatter = createFormatter(dateFormat: .shortWeekdayAndFullDate)
    /// Date Formatter for "yyyy-MM-dd'T'HH:mm:ss"
    private lazy var yearMonthDayShortTimeDateFormatter: DateFormatter = createFormatter(dateFormat: .yearMonthDayShortTime)
    /// Date Formatter for "MMM d, yyyy"
    private lazy var fullDateFormatter: DateFormatter = createFormatter(dateFormat: .fullDate)
    private lazy var fullNameDayOfWeekFormatter: DateFormatter = createFormatter(dateFormat: .fullNameDayOfWeek)
    
    private func createFormatter(dateFormat: DateFormatterType, timeZone: TimeZone? = nil) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        if let timeZone = timeZone { formatter.timeZone = timeZone }
        return formatter
    }
}

public enum DateFormatterType: String {
    /// HH:mm
    case hourMinute = "HH:mm"
    /// "E, MMM d, yyyy", like "Fri, Jan 15, 2020"
    case shortWeekdayAndFullDate = "E, MMM d, yyyy"
    /// yyyy-MM-dd'T'HH:mm:ss
    case yearMonthDayShortTime = "yyyy-MM-dd'T'HH:mm:ss"
    /// MMM d, yyyy, like May 16, 2020
    case fullDate = "MMM d, yyyy"
    /// EEEE
    case fullNameDayOfWeek = "EEEE"
}
