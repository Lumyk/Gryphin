//
//  Containing.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-23.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

protocol Containing: Containable {
    var children: [Containable] { get set }
}

extension Containing {
    
    // ----------------------------------
    //  MARK: - Children -
    //
    func add(child: Containable) {
        child.parent = self
        self.children.append(child)
    }
    
    func add(children: [Containable]) {
        children.forEach {
            $0.parent = self
        }
        self.children.append(contentsOf: children)
    }
}

extension Array where Element: Containing {
    
    var stringRepresentation: String {
        return self
            .map {
                $0.stringRepresentation
            }
            .joined(separator: "\n\n")
    }
}
