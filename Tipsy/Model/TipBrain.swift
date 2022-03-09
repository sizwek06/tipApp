//
//  TipBrain.swift
//  Tipsy
//
//  Created by Sizwe Khathi on 2022/03/03.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain{
    var billAmt: Double?
    var selectedPct: String?
    
    func getTotalAmt(billAmt: Double?, selectedPct: String, numOfPeople: Int?) -> Double{
        var tip = 0.0
        
        if billAmt != nil {
            if(selectedPct == "10%"){
                tip = billAmt! * 0.1
            } else if (selectedPct == "20%"){
                tip = billAmt! * 0.2
            }else if (selectedPct == "0%"){
                tip = 0
            }
        }
        return (billAmt! + tip) / Double(numOfPeople!)
    }
}
