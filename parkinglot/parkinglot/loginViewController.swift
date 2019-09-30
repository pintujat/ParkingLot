import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPasswd: UITextField!
    @IBOutlet weak var checkSwitch: UISwitch!
    
    func validateUser() -> Bool {
        if fieldEmail.text == "" || fieldPasswd.text == "" {
          //  return true
       // }  //else{
            let infoAlert = UIAlertController(title: "Error", message: "All Fields are required.!!", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
            return false
        }
        let u  = userDetails.searchUser(userEmail: fieldEmail.text!)
        if u.password == fieldPasswd.text{
            return true
        } else{ 
        return false
        }
    }
    
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        if validateUser(){
            
            if checkSwitch.isOn{
                //save Data
                UserDefaults.standard.set(fieldEmail.text, forKey: "email")
                UserDefaults.standard.set(fieldPasswd.text, forKey: "password")
                UserDefaults.standard.set(checkSwitch.isOn, forKey: "rememberme")
                
            }else{
                //remove Data
                if UserDefaults.standard.string(forKey: "email") != nil{
                    UserDefaults.standard.removeObject(forKey: "email")
                }
                
                if UserDefaults.standard.value(forKey: "password") != nil {
                    UserDefaults.standard.removeObject(forKey: "password")
                }
                
                UserDefaults.standard.set(checkSwitch.isOn, forKey: "rememberme")
            }
//                        
            if let tabbar = (storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController) {
                self.present(tabbar, animated: true, completion: nil)
        }else{
            let infoAlert = UIAlertController(title: "Invalid User", message: "Incorrect Username and/or Password", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
        }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = UserDefaults.standard.string(forKey: "email"){
            fieldEmail.text = email
        }
        if let password = UserDefaults.standard.value(forKey: "password") {
            fieldPasswd.text = password as? String
            fieldPasswd.isSecureTextEntry = true
        }
        let switchR = UserDefaults.standard.bool(forKey: "rememberme")
        self.checkSwitch.setOn(switchR, animated: true)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        let mainSb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = mainSb.instantiateViewController(withIdentifier: "SignUpScene")
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

