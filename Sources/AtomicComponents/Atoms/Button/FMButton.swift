//
//  File.swift
//  
//
//  Created by Fumiya Tanaka on 2021/12/16.
//

import Foundation

#if os(iOS)
import UIKit

public class FMButton: UIButton {
}

public extension FMButton {
    static var radius: FMButton {
        let button = FMButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerCurve = .continuous
        return button
    }
}

#elseif os(macOS)
#endif
