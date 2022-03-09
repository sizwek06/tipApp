//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Sizwe Khathi on 2022/03/01.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totPerPerson: String?
    var pect: String?
    var numOfPeople: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totPerPerson
        settingsLabel.text = "Split between \(numOfPeople!) people, with \(pect!) tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
