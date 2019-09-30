

import UIKit
import WebKit

class locationViewController: UIViewController {
    
    @IBOutlet weak var MyWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MyWebView.load(URLRequest(url: URL(string: "https://www.google.ca/maps/place/Lambton+College/@43.7732946,-79.3380697,17z/data=!3m1!4b1!4m5!3m4!1s0x882b2d6fc6ca7f5d:0x2a12502c1cd1e815!8m2!3d43.7732907!4d-79.335881")!))
    }
    

    
}
