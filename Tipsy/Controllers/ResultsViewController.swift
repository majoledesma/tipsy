

import UIKit

class ResultsViewController: UIViewController {
    var totalUser = "0.0"
    var labelPerc = 2
    var tip = 10
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalUser
        settingLabel.text = "Split between \(labelPerc) people, with \(tip)% tip."
      
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
