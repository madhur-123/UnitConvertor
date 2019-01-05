//
//  ConversionViewController.swift
//  UnitConvertor
//
//  Created by Madhur Diwan on 04/01/19.
//  Copyright © 2019 madhurIos. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var formula_lbl: UILabel!
    @IBOutlet weak var title_Lbl: UILabel!
    
    var selectedComponent = " "
    var unit1 = " "
    var unit2 = " "
    
    let length = ["Kilometer","Meter", "Centimeter", "Millimeter", "Micrometer", "Nanometer", "Mile" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title_Lbl.text = "\(selectedComponent) Conversion! "
    }
    
    @IBAction func txtFieldChanges(_ sender: UITextField) {
        
        if textField1.text == "" {
            self.textfield2.text = ""
        }else {
            Convert(unit1: lbl1.text!, to: lbl2.text!)
        }
    }
    
    
    
    // PickerView Delegate and DataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return length.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.picker1 {
            lbl1.text = length[row]
            lbl1.textAlignment = NSTextAlignment.center

        } else if pickerView == self.picker2 {
            lbl2.text = length[row]
            lbl2.textAlignment = NSTextAlignment.center
        }
      
        
        if textField1.text == "" {
            self.textfield2.text = ""
        }else {
            Convert(unit1: lbl1.text!, to: lbl2.text!)
        }
        
        return length[row]
    }
    
    func Convert(unit1 : String, to unit2 : String){
        if unit1 == "Kilometer" {
            switch unit2 {
            case "Kilometer" :
                textfield2.text = "\(Int(textField1.text!)! * 1)"
                formula_lbl.text = "multiply the length value by 1"
                
            case "Meter" :
                textfield2.text = "\(Int(textField1.text!)! * 1000)"
                formula_lbl.text = "multiply the length value by 1000"

            case "Centimeter" :
                textfield2.text = "\(Int(textField1.text!)! * 100000)"
                formula_lbl.text = "multiply the length value by 100000"

            case "Millimeter" :
                textfield2.text = "\(Int(textField1.text!)! * 1000000)"
                formula_lbl.text = "multiply the length value by 1000000"

            case "Micrometer" :
                formula_lbl.text = "multiply the length value by 1e+9"

            case "Nanometer" :
                formula_lbl.text = "multiply the length value by 1e+12"

            case "Mile" :
                formula_lbl.text = "for an approximate result, divide the length value by 1.609"

            default: print("Invalid result!")
            }
        }
    }
}



