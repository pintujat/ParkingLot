

import UIKit
import WebKit

class instructionsViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFromFile()
    }
    
    func loadFromFile()
    {
        let localfilePath = Bundle.main.url(forResource: "help", withExtension: "html");
        let myRequest = URLRequest(url: localfilePath!);
        self.myWebView.load(myRequest);
    }

}
