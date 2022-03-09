//
//  TibBrain.swift
//  Tipsy
//
//  Created by Sizwe Khathi on 2022/03/01.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain{
    
    func getTipAmt(billAmt: Double, selectedPct: String) -> Double{
        
        if(selectedPct == "10%"){
            return billAmt * 0.1
        } else if (selectedPct == "20%"){
            return billAmt * 0.2
        }else if (selectedPct == "0%"){
            return 0
        }
        
    }
}
