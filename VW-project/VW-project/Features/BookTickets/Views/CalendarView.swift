//
//  CalendarView.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class CalendarView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "CalendarView"
    }

    let datePicker = UIDatePicker()
    @IBOutlet var textFieldDate: UITextField!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        _configDatePicker()
    }
    
    func viewOnly() {
        textFieldDate.isEnabled = false
        arrowImage.isHidden = true
    }
    
    private func _configDatePicker() {
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        textFieldDate.inputAccessoryView = toolbar
        textFieldDate.inputView = datePicker
    }
    
    @objc func doneDatePicker() {
         let formatter = DateFormatter()
         formatter.dateFormat = "d MMMM yyyy, E"
         textFieldDate.text = formatter.string(from: datePicker.date)
         endEditing(true)
     }
     
     @objc func cancelDatePicker() {
         endEditing(true)
     }
}
