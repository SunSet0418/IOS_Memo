import UIKit
import Foundation

class Main: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var TableView: UITableView!
    
    var Memos = [String]()
    var tmp : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Memos = UserDefaults.standard.object(forKey: "data") as? [String] ?? [String]()
        print(Memos)
    }
    
    @IBAction func MemoReset(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "data")
        UserDefaults.standard.set(false, forKey:"IsTable")
        Memos = []
        self.TableView.reloadData()
    }
    
    //셀 갯수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memos.count
    }
    
    //셀 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MainCell
        if(Memos.count != 0){
            Cell.title.text = Memos[indexPath.row]
        }
        return Cell
    }
    
    //Cell클릭시 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(String(describing: indexPath.row))
        tmp = indexPath.row
        UserDefaults.standard.set(tmp, forKey:"number")
        UserDefaults.standard.set(true, forKey: "IsTable")
        self.performSegue(withIdentifier: "ToRecord", sender: self)
    }    


}
