

import UIKit

class supportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //showAlert()
        // Do any additional setup after loading the view.
        
}
    
    override func viewDidAppear(_ animated: Bool) {
        showAlert()
    }
   
    func showAlert(){
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
}
