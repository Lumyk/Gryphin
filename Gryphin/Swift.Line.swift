//
//  Swift.Line.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-27.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

extension Swift {
    final class Line: Containable, ExpressibleByStringLiteral {
        
        typealias StringLiteralType                  = String
        typealias ExtendedGraphemeClusterLiteralType = String
        typealias UnicodeScalarLiteralType           = String
        
        var parent: Containing?
        
        private let content: String
        
        // ----------------------------------
        //  MARK: - Init -
        //
        init(content: String) {
            self.content = content
        }
        
        convenience init?(content: String?) {
            guard let content = content else {
                return nil
            }
            
            self.init(content: content)
        }
        
        static func linesWith(requiredContent content: String) -> [Line] {
            guard !content.isEmpty else {
                return []
            }
            
            return content.components(separatedBy: "\n").map {
                Line(content: $0)
            }
        }
        
        static func linesWith(optionalContent content: String?) -> [Line]? {
            guard let content = content else {
                return nil
            }
            return self.linesWith(requiredContent: content)
        }
        
        // ----------------------------------
        //  MARK: - ExpressibleByStringLiteral -
        //
        init(stringLiteral value: StringLiteralType) {
            self.content = value
        }
        
        init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
            self.content = value
        }
        
        init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
            self.content = value
        }
        
        // ----------------------------------
        //  MARK: - String Representable -
        //
        var stringRepresentation: String {
            return "\(self.indent)\(self.content)"
        }
    }
}

extension Array where Element: Containable {
    
    func commentStringIndentedBy(_ indent: String) -> String {
        guard !self.isEmpty else {
            return ""
        }
        
        return self.map {
            "\(indent)/// \($0.stringRepresentation)\n"
        }.joined(separator: "")
    }
}
