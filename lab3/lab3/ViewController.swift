import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set the delegate for text fields
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        countryTextField.delegate = self
        ageTextField.delegate = self
        addDoneButtonToNumberPad()
      
    }
    // Implement UITextFieldDelegate method to dismiss the keyboard on pressing Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
            userInformationTextView.text = " First Name : \(firstNameTextField.text ?? "") \(lastNameTextField.text ?? "")\n Country : \(countryTextField.text ?? "") \n Age : \(ageTextField.text ?? "")"
                        
            // Vertically center the text in userInformationTextView
            let topOffset = (userInformationTextView.bounds.size.height - userInformationTextView.contentSize.height * userInformationTextView.zoomScale) / 2
            let positiveTopOffset = max(1, topOffset)
            userInformationTextView.contentOffset = CGPoint(x: 0, y: -positiveTopOffset)
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
    
    // Function to add a "Done" button to the number pad keyboard
    func addDoneButtonToNumberPad() {
        
           let toolbar = UIToolbar()
           toolbar.sizeToFit()

           let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
           toolbar.items = [doneButton]

           // Assign the toolbar to the inputAccessoryView of the ageTextField
           ageTextField.inputAccessoryView = toolbar
       }

    // method to handle the "Done" button tap
    @objc func doneButtonTapped() {
        ageTextField.resignFirstResponder()
    }
    
}


