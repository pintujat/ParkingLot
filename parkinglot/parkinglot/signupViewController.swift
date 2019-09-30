
import UIKit

class signupViewController: UIViewController {

    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPasswd: UITextField!
    @IBOutlet weak var segmentedGender: UISegmentedControl!
    
      var gender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldName.text = ""
        fieldEmail.text = ""
        fieldPasswd.text = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        fieldName.text = ""
        fieldEmail.text = ""
        fieldPasswd.text = ""
    }
    @IBAction func btnSubmit(_ sender: UIButton) {
        //creating a format for the values  to display...!!!
        
        
//        let ud = UserDefaults.standard
//        let userName = ud.string(forKey: "userName")
//        let Email = ud.string(forKey: "Email")
//        let Password = ud.string(forKey: "Password")
//        txtEmail.text = Email
//        txtPassword.text = Password
//        txtName.text = userName
        
        var data : String = fieldName.text!
        data += "\n" + fieldPasswd.text!
        data += "\n" + fieldEmail.text!
        switch segmentedGender.selectedSegmentIndex {
        case 0:
            data += "\n Male"
            gender = "Male"
        case 1:
            data += "\n Female"
            gender = "Female"
        case 2:
            data += "\n No Disclosure"
            gender = "No Disclosure"
        default:
            data += "\n No Disclosure"
            gender = "No Disclosure"
        }
        // sending data for another view controllersss.....!!!!!!
        let ud =  UserDefaults.standard
            ud.set(fieldEmail.text, forKey: "Email")
            ud.set(fieldPasswd.text, forKey: "Password")
            ud.set(fieldName.text, forKey: "userName")
//        confirmation alert for the new user....!!!
        let infoAlert = UIAlertController(title: "Confirm details", message: data, preferredStyle: .alert)
        
            infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayHomeVC()}))
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(infoAlert, animated: true, completion: nil)
       /////
}
    func displayHomeVC(){
        let newUser = userDetails(fieldName.text!, fieldEmail.text!, fieldPasswd.text!, self.gender)
        
        if userDetails.addUser(newUser: newUser){
//            let tabbar = (storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController)
//            self.present(tabbar!, animated: true, completion: nil)
            let mainSb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let signUpVC = mainSb.instantiateViewController(withIdentifier: "LoginScene")
            navigationController?.pushViewController(signUpVC, animated: true)
        }
        else{
            let infoAlert = UIAlertController(title: "Unsuccessful", message: "Account Creation Unsuccessful", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        //
        let mainSb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = mainSb.instantiateViewController(withIdentifier: "LoginScene")
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
