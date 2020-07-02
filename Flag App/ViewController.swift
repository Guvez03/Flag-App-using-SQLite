//
//  ViewController.swift
//  Flag App
//
//  Created by ahmet on 2.07.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        copyDatabaseIfNeeded()
        
    }
   func copyDatabaseIfNeeded() {
        // Move database file from bundle to documents folder

        let fileManager = FileManager.default

        let documentsUrl = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

        let finalDatabaseURL = URL(fileURLWithPath: documentsUrl).appendingPathComponent("bayrakquiz.sqlite")
    
        let dbFilePath = Bundle.main.path(forResource: "bayrakquiz", ofType: "sqlite")
        
        if fileManager.fileExists(atPath: finalDatabaseURL.path) {
        
        print("Döküman dosyalarında db var kopyalamaya gerek yok")

        } else{
            
            do {
               
                try fileManager.copyItem(atPath: dbFilePath!, toPath: finalDatabaseURL.path)
                        
                   } catch {
                       print("Unable to copy foo.db: \(error)")
                   }
            
        }
        
    
   
    }
}

