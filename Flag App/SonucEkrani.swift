//
//  SonucEkrani.swift
//  Flag App
//
//  Created by ahmet on 2.07.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class SonucEkrani: UIViewController {

    @IBOutlet weak var answerControl: UILabel!
    
    @IBOutlet weak var successRate: UILabel!
    
    var correctCountNumber : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerControl.text = "\(correctCountNumber!) tane doğru \(5-correctCountNumber!) tane yanlış"
        
        successRate.text = "Başarı Oranınız = \((100 * correctCountNumber!)/5)"
        
        navigationItem.hidesBackButton = true

    }

    @IBAction func tryPlay(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
