//
//  String+CodingCase.swift
//  CodingStyleCased
//
//  Created by Aleksandr Derevenskih on 05.02.2023.
//

import Foundation

extension String {
    var lowercasingFirst: String { prefix(1).lowercased() + dropFirst() }
    var uppercasingFirst: String { prefix(1).uppercased() + dropFirst() }

    var camelCased: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let first = parts.first!.lowercasingFirst
        let rest = parts.dropFirst().map { $0.uppercasingFirst }

        return ([first] + rest).joined()
    }

    var snakeCased: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let rest = parts.map { $0.lowercased() }

        return (rest).joined(separator: "_")
    }

    var kebabCased: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let rest = parts.map { $0.lowercased() }

        return (rest).joined(separator: "-")
    }
}
