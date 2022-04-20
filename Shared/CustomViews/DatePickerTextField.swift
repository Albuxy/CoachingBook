//
//  DatePickerTextField.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 20/4/22.
//

import Foundation
import SwiftUI

struct DatePickerTextField: UIViewRepresentable {
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
    }()

    public var placeholder: String
    @Binding public var date: Date?

    func makeUIView(context: Context) -> UITextField {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self.helper,
                                  action: #selector(self.helper.dateValueChanged),
                                  for: .valueChanged)
        self.textField.placeholder = self.placeholder
        self.textField.inputView = self.datePicker

        //Accesory view
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self.helper,
                                         action: #selector(self.helper.doneButtonAction))

        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        self.textField.inputAccessoryView = toolbar

        self.helper.dateChanged = {
            self.date = self.datePicker.date
        }

        self.helper.doneButtonTapped = {
            if self.date == nil {
                self.date = self.datePicker.date
            }
            self.textField.resignFirstResponder()
        }

        return self.textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        if let selectedDate = self.date {
            uiView.text = self.dateFormatter.string(from: selectedDate)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            self.dateChanged?()
        }

        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }

    class Coordinator {}
}
