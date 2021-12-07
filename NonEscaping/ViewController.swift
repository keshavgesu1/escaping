//
//  ViewController.swift
//  NonEscaping
//
//  Created by Keshav Raj Kashyap on 06/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTwoNumber()
    }
    
    func sumOfNumbers(_ num1: Int, andSecondNumber num2:Int,completionHandler:@escaping (_ result:Int) -> Void) {
        print("step 2")
        let result = num1 + num2
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3){
            print("step 3")
            completionHandler(result)
        }
    }
    
   
    func addTwoNumber(){
        print("step 1")
        sumOfNumbers(10, andSecondNumber: 20){ [weak self](result) in
            guard let _ = self else {return}
            print("result is \(result)")
        }
        print("last step")
    }
    
    

}

