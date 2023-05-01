import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionsTableView: UITableView!
    
    var viewModel = QuestionViewModel()
    var questionsData: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        
        viewModel.getAllQuestions { [weak self] in
            self?.questionsData = self?.viewModel.questionModel
            
            DispatchQueue.main.async {
                self?.questionsTableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsData?.data?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = questionsData?.data?.questions?[indexPath.row].question
        return cell!
    }
}
