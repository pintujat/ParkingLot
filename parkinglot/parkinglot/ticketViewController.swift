import UIKit

class ticketViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let ufd =  UserDefaults.standard
    
    
    @IBOutlet weak var pickCarColor: UIPickerView!
    @IBOutlet weak var pickLane: UIPickerView!
    @IBOutlet weak var pickPlatform: UIPickerView!
    
    
    @IBOutlet weak var lblOutput: UILabel!
    var colorList : [String] = ["White", "Black", "Red", "Brown", "Blue", "Maroon", "Grey", "Silver", "Gold", "Purple", "Orange"]
    
    var laneList : [String] = ["Lane A", "Lane B", "Lane C", "Lane D", "Lane E"]
    
    var parkList : [String] = ["P1", "P2", "P3", "P4", "P5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickCarColor.delegate = self
        pickCarColor.dataSource = self
        
        pickLane.delegate = self
        pickLane.dataSource = self
        
        pickPlatform.delegate = self
        pickPlatform.dataSource = self
        print("pintu")
     
    }
    
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        if (pickerView.tag == 1){
            return colorList.count
        }
        else if (pickerView.tag == 2){
            return laneList.count
        }else{
            return parkList.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1){
            var carcolor:String! = colorList[row] as String
            print(carcolor)
            ufd.set(carcolor, forKey: "carcolor")
            
        }
        else  if (pickerView.tag == 2){
            var lanelistvalue:String! = laneList[row] as String
            print(lanelistvalue)
            ufd.set(lanelistvalue, forKey: "lanelist")
            
        }
        else {
            var parkliststr:String! = parkList[row] as String
            print(parkliststr)
            ufd.set(parkliststr, forKey: "parklist")
            
        }
        
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerView.tag == 1){
            return "\(colorList[row])"
            
            
        }else if(pickerView.tag == 2){
            return "\(laneList[row])"
        }else{
            return "\(parkList[row])"
        }
    }
    
    
    ///
    @IBAction func segCard(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func segTimeChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            lblOutput.text = "5$";
        }
        else if sender.selectedSegmentIndex == 1
        {
            lblOutput.text = "9$";
        }
        else if sender.selectedSegmentIndex == 2
        {
            lblOutput.text = "12$";
        }
        else if sender.selectedSegmentIndex == 3
        {
            lblOutput.text = "15$";
        }
        else if sender.selectedSegmentIndex == 4
        {
            lblOutput.text = "20$";
        }
    }

    @IBAction func addTicket(_ sender: UIButton) {
        print("pintu")
        let alert = UIAlertController(title: "Thank You", message: "Payment Successful!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        tickets.addTicket()
    }
}
