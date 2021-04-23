
import UIKit

class CalculatorViewController: UIViewController {
    var tip = 0.0
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultTotal = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
     
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonToString = String(buttonTitle.dropLast())
        let buttonToNumber = Double(buttonToString)!
        
        tip = buttonToNumber / 100
        
        }
    
    
    
    @IBAction func stepValueChangedd(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let userBill = billTextField.text!
        billTotal = Double(userBill)!
        let result = billTotal * (1 + tip)
        let result2 = result / Double(numberOfPeople)
        resultTotal = String(format: "%.2f", result2)

        
        self.performSegue(withIdentifier: "connectionSegue", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connectionSegue" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalUser = resultTotal
            destinationVC.labelPerc = numberOfPeople
            destinationVC.tip = Int(tip * 100)

        }
    }

}
