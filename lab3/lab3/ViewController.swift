
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }
    
    var informationValidate : Bool = false
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
  
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var userInformationTextView: UITextView!
    
    @IBOutlet weak var messageLable: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
        if informationValidate
        {
            userInformationTextView.text = " First Name : \(firstNameTextField.text ?? "") \n Last Name : \(lastNameTextField.text ?? "") \n Age : \(ageTextField.text ?? "")"
        }
   
        
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        if firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || countryTextField.text!.isEmpty || ageTextField.text!.isEmpty
        {
            messageLable.text = "Complete the missing Info!"
            informationValidate = false
        }
        else{
            messageLable.text = "Successfully submitted!"
            informationValidate = true
        }
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        firstNameTextField.text = nil
        lastNameTextField.text = nil
        countryTextField.text = nil
        ageTextField.text = nil
        userInformationTextView.text = nil
        messageLable.text = nil
        informationValidate = false
    }
    
}


