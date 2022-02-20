//
//  PreviewWrapper.swift
//  
//
//  Created by Fumiya Tanaka on 2022/02/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif
import SwiftUI

#if os(iOS)
public struct UIViewControllerPreviewWrapper: UIViewControllerRepresentable {

    let viewController: UIViewController

    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

public struct UIViewPreviewWrapper: UIViewRepresentable {

    let view: UIView

    public func makeUIView(context: Context) -> some UIView {
        view
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

#elseif os(macOS)
public struct NSViewControllerPreviewWrapper: NSViewControllerRepresentable {

    let viewController: NSViewController

    public func makeNSViewController(context: Context) -> NSViewController {
        viewController
    }

    public func updateNSViewController(_ nsViewController: NSViewController, context: Context) {
    }
}

public struct NSViewPreviewWrapper: NSViewRepresentable {

    let view: NSView

    public func makeNSView(context: Context) -> NSView {
        view
    }

    public func updateNSView(_ nsView: NSView, context: Context) {
    }
}

#endif
