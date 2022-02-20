//
//  FMDateTextField.swift
//  
//
//  Created by Fumiya Tanaka on 2021/12/16.
//

import Foundation
import SwiftUI
import Combine

#if os(iOS)
import UIKit

/// do not use from code but xib or storyboard.
class DateTextField: UITextField {

    private var selectingDateRelay: CurrentValueSubject<Date?, Never> = .init(nil)
    private var endPickingDateRelay: PassthroughSubject<Date, Never> = .init()
    var endPickingdDate: AnyPublisher<Date, Never> {
        endPickingDateRelay.eraseToAnyPublisher()
    }
    private var cancellables: Set<AnyCancellable> = []
    @IBInspectable private var timeContains: Bool = false
    @IBInspectable private var dateContains: Bool = true
    var initialDate: Date? {
        didSet {
            selectingDateRelay.send(initialDate)
        }
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }

    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let current: Date = .init()
        let datePicker: UIDatePicker = .init()
        if dateContains, timeContains {
            datePicker.datePickerMode = .dateAndTime
        } else if dateContains {
            datePicker.datePickerMode = .date
        } else if timeContains {
            datePicker.datePickerMode = .time
        }
        datePicker.minimumDate = current
        datePicker.date = current
        inputView = datePicker
        let toolBar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didEndPickingDate))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelPickingDate))
        toolBar.items = [cancelButton, UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton]
        toolBar.sizeToFit()
        inputAccessoryView = toolBar

        datePicker
            .publisher(for: \.date)
            .map({ $0 as Date? })
            .assign(to: \.value, on: selectingDateRelay)
            .store(in: &cancellables)

        endPickingdDate.map {

            let dateFormatter: DateFormatter = DateFormatter()

            if self.timeContains, self.dateContains {
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .short
            } else if self.timeContains {
                dateFormatter.dateFormat = DateFormatter.dateFormat(
                    fromTemplate: "H:mm:",
                    options: 0,
                    locale: Locale.current
                )
            } else {
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .short
            }
            return dateFormatter.string(from: $0)
        }
        .map({ $0 as String? })
        .assign(to: \.text, on: self)
        .store(in: &cancellables)
    }

    @objc private func didCancelPickingDate() {
        resignFirstResponder()
    }

    @objc private func didEndPickingDate() {
        guard let date = selectingDateRelay.value else {
            return
        }
        endPickingDateRelay.send(date)
        resignFirstResponder()
        selectingDateRelay.send(nil)
    }
}

#elseif os(macOS)
#endif
