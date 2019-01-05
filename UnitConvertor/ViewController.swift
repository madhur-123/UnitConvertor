//
//  ViewController.swift
//  UnitConvertor
//
//  Created by Madhur Diwan on 04/01/19.
//  Copyright © 2019 madhurIos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var length_lbl: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "length_segue"{
            let nextVC = segue.destination as! ConversionViewController
            nextVC.selectedComponent = (self.length_lbl.titleLabel?.text!)!
            
        }
    }
}

