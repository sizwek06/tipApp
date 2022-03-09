//
//  ViewController.swift
//  Tipsy
//
//  Created by Sizwe Khathi on 2022/03/01.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var calcButton: UIButton!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    
    var tipBrain = TipBrain()
    
    var selectedPct: String?
    var tip: Double = 0.0
    var numOfPeople: Int?
    var billAmt: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTips(sender: tenPctButton)
        calcButton.alpha = 0.5
        calcButton.isEnabled = false
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        resetTips(sender: sender)
        billTextField.endEditing(true)
        updateButton()
    }//when the user selects a tip,
    //the keyboard hides & button is updated depending on value
    
    @IBAction func billTextFieldInteraction(_ sender: UITextField) {
        billTextField.endEditing(false)
        updateButton()
    }//updating the button each time the textfield is touched
    
    @IBAction func amtValueUpdated(_ sender: Any) {
        billAmt = Double(billTextField.text!) ?? 0.0
    }//updating billAmt when letting go off textField
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numOfPeople = Int(peopleStepper.value)
        splitNumberLabel.text = String(format: "%.0f", peopleStepper.value)
    }//updating the values when stepper is touched
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        numOfPeople = Int(splitNumberLabel.text!)
        billAmt = Double(billTextField.text!) ?? 0.0
        
        billAmt = tipBrain.getTotalAmt(billAmt: billAmt, selectedPct: selectedPct!, numOfPeople: numOfPeople)
        
        self.performSegue(withIdentifier: "showResult", sender: self)
    }//calculating the amount payable by each patron
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
            let tipVC = segue.destination as! ResultsViewController
            
            tipVC.numOfPeople = numOfPeople!
            tipVC.pect = selectedPct!
            tipVC.totPerPerson = String(format: "%.2f", billAmt ?? 0.0)
        }//prepping & triggering the segue to new view
    }
    
    func resetTips(sender: UIButton){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        selectedPct = sender.currentTitle
    }//resetting the page content
    
    func updateButton(){
        
        if (billAmt == nil) || (billAmt == 0) {
            calcButton.alpha = 0.5
            calcButton.isEnabled = false
        }else {
            calcButton.alpha = 1
            calcButton.isEnabled = true
        }
    }//enabling/disabling the calculate button when there's no entry
}
