//
//  ContainerType.swift
//  Gryphin
//
//  Created by Dima Bart on 2016-12-08.
//  Copyright © 2016 Dima Bart. All rights reserved.
//

import Foundation

protocol ContainerType: class, ReferenceType {
    var _children:   [ReferenceType]  { get set }
    var _parameters: [Parameter]      { get }
}

extension ContainerType {
    
    // ----------------------------------
    //  MARK: - Children -
    //
    func _add(child: ReferenceType) {
        child._parent = self
        self._children.append(child)
    }
    
    func _add(children: [ReferenceType]) {
        children.forEach {
            $0._parent = self
        }
        self._children.append(contentsOf: children)
    }
}

func ==(lhs: ContainerType, rhs: ContainerType) -> Bool {
    return lhs === rhs
}
