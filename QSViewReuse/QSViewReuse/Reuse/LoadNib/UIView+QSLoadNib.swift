//
//  UIView+QSLoadNib.swift
//  QSViewReuse
//
//  Created by Song on 2020/7/9.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

public extension QSNamespace where Base: UIView {
    static func loadNib() -> Base {
        let nibName = String(describing: Base.self)
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? Base else {
            fatalError("找不到nib文件，nibName = \(nibName)")
        }
        return view
    }
}
