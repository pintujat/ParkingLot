
import UIKit

class homepageViewController: UIViewController
{
    @IBOutlet weak var lblUserName: UILabel!    
    @IBOutlet weak var btnSupport: UIButton!
    @IBOutlet weak var totalTickets: UILabel!
    var total = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSupport.layer.cornerRadius = 30;
        btnSupport.layer.masksToBounds = true
 
        let ud = UserDefaults.standard
        if let userName = ud.string(forKey: "userName")
        {
            lblUserName.text = "Welcome To Parking Lot App \n" + userName
        }else{
            lblUserName.text = "no data from user default"
        }
        total = tickets.getTotalTickets()
        totalTickets.text = "\(total)"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        total = tickets.getTotalTickets()
        totalTickets.text = "\(total)"
    }

    @IBAction func btnSupport(_ sender: UIButton) {
        let attributedString = NSAttributedString(string: "+1 1234567890                                              9:00 AM - 8:00 PM ET M-F                                             Email: abc@gmail.com", attributes: [NSAttributedStringKey.font : UIFont(name: "Avenir-Light", size: 20)!])
        let alert = UIAlertController(title: "Need Help ?", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.setValue(attributedString, forKey: "attributedMessage")
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.default)
        {
            (UIAlertAction) -> Void in
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        {
            () -> Void in
        }
    }
    
    @IBAction func btnSignOut(_ sender: UIBarButtonItem) {

        let alertController = UIAlertController(title: "Logout", message: "Are you sure you want to Logout?", preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            
            
            self.dismiss(animated: true, completion: nil)

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)


    }
}
