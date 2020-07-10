//
//  QSNamespage.swift
//  QSViewReuse
//
//  Created by Song on 2020/7/9.
//  Copyright © 2020 Song. All rights reserved.
//
//  命名空间

import UIKit

public protocol QSNamespageCompatible {
    associatedtype WrapperType
    var qs: WrapperType { get set }
    static var qs: WrapperType.Type { get }
}

public extension QSNamespageCompatible {
    var qs: QSNamespace<Self> {
        get {
            return QSNamespace(value: self)
        }
        set {}
    }

    static var qs: QSNamespace<Self>.Type {
        return QSNamespace.self
    }
}

public struct QSNamespace<Base> {
    var base: Base
    init(value: Base) {
        self.base = value
    }
}

extension UIView: QSNamespageCompatible {}
