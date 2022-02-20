//
//  FMLabel.swift
//  
//
//  Created by Fumiya Tanaka on 2021/12/16.
//

import Foundation
#if os(iOS)
import UIKit

public class FMLabel: UILabel {
}

public extension FMLabel {
    static var body: FMLabel {
        let label = FMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }

    static var title: FMLabel {
        let label = FMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }
}

#elseif os(macOS)
import AppKit

public class FMLabel: NSTextField {
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        isEditable = false
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        isEditable = false
    }
}

public extension FMLabel {
    static var body: FMLabel {
        let label = FMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }

    static var title: FMLabel {
        let label = FMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }
}

#endif
