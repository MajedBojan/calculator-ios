//
//  ViewController.swift
//  calculator
//
//  Created by Majed on 9/5/19.
//  Copyright © 2019 MaJeD BoJaN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultArea: UILabel!
    
    let numbers = [0,1,2,3,4,5,6,7,8,9]
    let operations = [10, 11, 12, 13, 14,15,16,17]
    var firstInput = ""
    var secondInput = ""
    var opperationNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        if sender.tag == 17{
            reset()
        }else{
            
            if sender.tag == 10 { resultArea.text = processor(firstInput , secondInput, opperationNo)}
            
        if numbers.contains(sender.tag){
            if opperationNo == 0{
                firstInput = firstInput + String(sender.tag)
                resultArea.text = String(firstInput)
            }else{
               secondInput = secondInput + String(sender.tag)
                resultArea.text = String(secondInput)
            }
        }else if operations.contains(sender.tag){
            
            if opperationNo == 0{
                opperationNo = sender.tag
            }
            else{
                let res = processor(firstInput , secondInput, opperationNo)
                firstInput = res
                secondInput = ""
                opperationNo = sender.tag
                resultArea.text = res
            }
        }
      }
    }
    
    func processor(_ firstNo: String, _ secondNo: String, _ pressedOpperation: Int) -> String {
       
        let first = Int(firstNo) ?? 0
       
        let second = Int(secondNo) ?? 0

        var result = 0

        switch pressedOpperation {
            case 11:
              result = first + second
            case 12:
                result = first - second
            case 13:
                result = first * second
            case 14:
                result = first / second
            case 15:
                result = first % second
            default:
                result = 0
        }

        
        return String(result)
    }
    
    func reset(){
        firstInput = ""
        secondInput = ""
        opperationNo = 0
        resultArea.text = "0"
    }
}

