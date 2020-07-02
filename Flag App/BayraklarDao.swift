//
//  BayraklarDao.swift
//  Flag App
//
//  Created by ahmet on 2.07.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

class BayraklarDao{
    
    let db:FMDatabase?
    
    init() {
        // KOPYALANMIŞ VERİ TABANINI KOPYALANDIĞI YERDEN ALARAK KULLANIMA HAZIR HALE GETİRDİK
        let dbFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) .first!
        
        let finalDatabaseURL = URL(fileURLWithPath: dbFilePath).appendingPathComponent("bayrakquiz.sqlite")
        
        db = FMDatabase(path: finalDatabaseURL.path) //VERİTABANINA BAĞLAMAK İÇİN NESNE
    }
    func Uncorrect3PersonsGet(bayrak_id:Int) -> [Bayraklar] {
        var array = [Bayraklar]()
        
        db?.open()
        
        
        do {

            let rs = try db!.executeQuery("SELECT * FROM bayraklar WHERE bayrak_id != ? ORDER BY RANDOM() LIMIT 3 ", values:[bayrak_id])
            
            while(rs.next()){
                
                let bayrak = Bayraklar(bayrak_id: Int(rs.string(forColumn: "bayrak_id")!)!, bayrak_ad: rs.string(forColumn: "bayrak_ad")!, bayrak_resim: rs.string(forColumn: "bayrak_resim")!)
                
                array.append(bayrak)
                
            }
            
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return array
    }
    
     func AllPersonsGet() -> [Bayraklar] {
            var array = [Bayraklar]()
            
            db?.open()
            
            
            do {
                
                
                let rs = try db!.executeQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5 ", values:nil)
                
                while(rs.next()){
                    
                    let bayrak = Bayraklar(bayrak_id: Int(rs.string(forColumn: "bayrak_id")!)!, bayrak_ad: rs.string(forColumn: "bayrak_ad")!, bayrak_resim: rs.string(forColumn: "bayrak_resim")!)
                    
                    array.append(bayrak)
                    
                }
      
            } catch  {
                print(error.localizedDescription)
            }
            
            
            db?.close()
            
            return array
        }
}
