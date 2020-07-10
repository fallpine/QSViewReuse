//
//  QSClassNameProtocol.swift
//  QSViewReuse
//
//  Created by Song on 2020/7/9.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

// MARK: - 类名，把类名转换为字符串
public protocol QSClassNameProtocol {
    static var className: String { get }
}

public extension QSClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
}

extension UIView: QSClassNameProtocol {}
