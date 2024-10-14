//
//  ViewController.swift
//  QuestionPoc
//
//  Created by MAC on 20/03/23.
//

import UIKit

class QuestionnaireViewController: UIViewController {

    @IBOutlet weak var questionTableview: UITableView!
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var hitconstant: NSLayoutConstraint!

    var QuestiondataModelObject: QuestionDetailsModel.GetQuestions.Response?
    var interactor: QuestionInteractorInput?
    var sample =  0
    var allquat = [QuestionDetailsModel.GetQuestions.Question]()
    var currentQuestion: QuestionDetailsModel.GetQuestions.Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0

    static let shared = QuestionnaireViewController()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    var dataModelObject: QuestionDetailsModel.GetQuestions.Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTableview.separatorStyle = .none
        // Do any additional setup after loading the view.
        questionTableview.isScrollEnabled = false
        questionTableview.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        questionTableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        getRequest()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        if let obj = object as? UITableView
        {
            if obj == self.questionTableview && keyPath == "contentSize"
            {
              //  hitconstant.constant = questionTableview.contentSize.height
            }
        }
    }
    @objc func handleIssueSelection(sender: UIButton) {
        let row = sender.tag
        if sample == 0 {
            sample = 1
        } else {
            sample += 1
            
        }
        questionTableview.reloadData()
    }
    func getRequest() {

        let params = QuestionDetailsModel.GetQuestions.Request()
            interactor?.QuestionChoose(request: params)
        }
    
    func displaySuccess<T>(data: T, success: Bool?, apiName: String) where T: Encodable {
        if let dataEncode: QuestionDetailsModel.GetQuestions.Response = data as? QuestionDetailsModel.GetQuestions.Response {
            QuestiondataModelObject = dataEncode
            
            DispatchQueue.main.async { [unowned self] in
             //   EZLoadingActivity.hide()
                           print(dataEncode)
                allquat = dataEncode.questions
                self.currentQuestion = self.allquat[0]
                questionTableview.reloadData()
                print("Success")
            }
        }
    }
    func displayError(errorMessage: String?, apiName: String) {
        DispatchQueue.main.async {[unowned self] in
            
            print("Error")
    }
    }
    private func setup() {
        let viewController = self
        let interactor = QuestionDetailsInteractor()
        let presenter = QuestionPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
      //  presenter.outputVC = viewController
    }
    }

extension QuestionnaireViewController: UITableViewDataSource, UITableViewDelegate {
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FooterTableViewCell
        cell.footerBtn.backgroundColor = .gray
      //  footerLabel.allowsMultipleSelection = false
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
        headerCell.questionLabel.text = allquat[sample].question
        return headerCell
        let headerView = UIView()

                NSLayoutConstraint.activate([
         
                    questionLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 50),
                    questionLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                    questionLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                    questionLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant:-1),
                   // label.numberOfLines = 0
                ])
                
                return headerView
    }
  
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allquat[sample].choices.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let footerCell = Bundle.main.loadNibNamed("FooterTableViewCell", owner: self, options: nil)?.first as! FooterTableViewCell

        questionLabel.text = allquat[sample].question
        footerCell.footerBtn.tag = indexPath.row
        footerCell.footerBtn.addTarget(self, action: #selector(handleIssueSelection(sender:)), for: .touchUpInside)
        

        footerCell.footerBtn.setTitle(allquat[sample].choices[indexPath.row], for: .normal)
      //  return cell
        return footerCell
    }
}



