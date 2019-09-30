

import UIKit

class myProfileViewController: UIViewController {
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtVehicleNumber: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtNewPwd: UITextField!
    @IBOutlet weak var txtNewPwd1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Recieving data from another view controllersss.....!!!!!!
        let ud = UserDefaults.standard
       
            let userName = ud.string(forKey: "userName")
            let Email = ud.string(forKey: "Email")
            let Password = ud.string(forKey: "Password")
            txtUserName.text = userName
            lblEmail.text = Email
    }
    @IBAction func update(_ sender: Any) {
//        self
//        userDetails.updateUser(, password: <#T##String#>)
    }
}
