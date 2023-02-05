//
//  CodingStyle.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 05.02.2023.
//

import Foundation

@propertyWrapper
struct CodingStyle {
    var value: String
    var style: Style

    init(wrappedValue: String, _ style: Style) {
        self.style = style
        self.value = wrappedValue
    }

    var wrappedValue: String {
        get {
            return value
        }
        set {
            value = style.styling(newValue)
            print("set to " + value)
        }
    }

    enum Style {
        /// camelCaseExample
        case camelCase
        /// snake_case_example
        case snakeCase
        /// kebab-case-example
        case kebabCase

        func styling (_ caseValue: String) -> String {
            switch self {
            case .camelCase:
                return caseValue.camelCased
            case .kebabCase:
                return caseValue.kebabCased
            case .snakeCase:
                return caseValue.snakeCased
            }
        }
    }
}
