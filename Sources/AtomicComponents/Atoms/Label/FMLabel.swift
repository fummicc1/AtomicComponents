//
//  FMLabel.swift
//  
//
//  Created by Fumiya Tanaka on 2021/12/16.
//

import Foundation
import SwiftUI

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

struct FMLabel_Title_Preview: PreviewProvider {

    static var previews: some View {
        let view = FMLabel.title
        view.text = "Hello, Previews!"
        view.sizeToFit()
        return UIViewPreviewWrapper(view: view)
            .previewLayout(.sizeThatFits)
    }
}

struct FMLabel_Body_Preview: PreviewProvider {

    static var previews: some View {
        let view = FMLabel.body
        view.text = "Hello, Previews!"
        view.sizeToFit()
        return UIViewPreviewWrapper(view: view)
            .previewLayout(.sizeThatFits)
            
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

struct FMLabel_Title_Preview: PreviewProvider {
    static var previews: some View {
        let view = FMLabel.title
        view.stringValue = "Hello, Previews!"
        view.sizeToFit()
        return NSViewPreviewWrapper(view: view)
            .previewLayout(.sizeThatFits)
    }
}

struct FMLabel_Body_Preview: PreviewProvider {
    static var previews: some View {
        let view = FMLabel.body
        view.stringValue = "Hello, Previews!"
        view.sizeToFit()
        return NSViewPreviewWrapper(view: view)
            .previewLayout(.sizeThatFits)
    }
}


#endif
