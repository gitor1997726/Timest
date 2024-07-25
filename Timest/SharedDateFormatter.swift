// SharedDateFormatter.swift
import Foundation

struct SharedDateFormatter {
    static let japaneseStyle: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M月d日（E）"
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }()
}
