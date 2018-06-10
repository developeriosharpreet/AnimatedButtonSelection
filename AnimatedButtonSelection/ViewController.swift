//
//  ViewController.swift
//  AnimatedButtonSelection
//
//  Created by Harpreet on 10/06/18.
//  Copyright © 2018 Animators. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AnimatedButtonsProtocol {
    
 
    

    @IBOutlet weak var buttonView: AnimatedView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      buttonView.animatedDelegate = self
   

    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonSelectedAtIndex(index:Int){
        
        print("button selected at index \(index)")
        
    }
}
