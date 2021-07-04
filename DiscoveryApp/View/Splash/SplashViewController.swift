//
//  SplashViewController.swift
//  DiscoveryApp
//
//  Created by Lauv Edward on 04/07/2021.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var selectcountryButton: UIButton!
    
    var tranParentView = UIView()
    var tableView = UITableView()
    var frameSelect = CGRect()
    var isSelect : Bool! {
        didSet {
            nextButton.isHidden = !isSelect
        }
    }
    var languageApp : AppLanguage!
    var datasource: [AppLanguage] = [.english, .vietnamese]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    @IBAction func clickSelectLanguage(_ sender: Any) {
        frameSelect = selectcountryButton.frame
        addTranparentview(frame: selectcountryButton.frame)
    }
    
    func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        isSelect = false
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.backgroundColor = UIColor(hexFromString: "#CC1F73").cgColor
        
        selectcountryButton.setTitle("Select Language", for: .normal)
        selectcountryButton.setTitleColor(UIColor.white, for: .normal)
        selectcountryButton.layer.borderWidth = 1
        selectcountryButton.layer.borderColor = UIColor.white.cgColor
        
        contentView.backgroundColor = UIColor(hexFromString: "#17191A")
    }
    func addTranparentview(frame: CGRect) {
        let window = UIApplication.shared.keyWindow
        tranParentView.frame = window?.frame ?? self.view.frame
        tableView.frame = CGRect(x: frame.origin.x + self.stackView.frame.origin.x, y: frame.origin.y + frame.height + self.stackView.frame.origin.y, width: frame.width, height: 0)
        tableView.backgroundColor = UIColor.init(hexFromString: "F6F6F6")
        tableView.layer.shadowColor = UIColor.gray.cgColor
        tableView.layer.shadowOffset = .zero
        self.view.addSubview(tranParentView)
        self.view.addSubview(tableView)
        self.tableView.reloadData()
        self.tranParentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dropdown))
        tranParentView.addGestureRecognizer(tap)
        tranParentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {
            self.tranParentView.alpha = 0.05
            self.tableView.frame = CGRect(x: frame.origin.x + self.stackView.frame.origin.x, y: frame.origin.y + frame.height + self.stackView.frame.origin.y, width: frame.width, height: 100)
        } completion: { (_) in
            
        }
    }
    @IBAction func nextButton(_ sender: Any) {
        let lang = languageApp
        guard let lang = lang else {
            return
        }
        UserPreferences.shared.appLanguage = lang
        UserPreferences.shared.saveAppLanguage()
        LocalizeManager.shared.setSelectedLanguage(lang: lang.rawValue)
        self.present(BaseTabbarViewController(), animated: true, completion: nil)
    }
    
    @objc func dropdown() {
        let frame = frameSelect
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {
            self.tableView.frame = CGRect(x: frame.origin.x + self.stackView.frame.origin.x, y: frame.origin.y + frame.height + self.stackView.frame.origin.y, width: frame.width, height: 0)
            self.tranParentView.alpha = 0
        } completion: { (_) in
            
        }
    }
}

extension SplashViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = datasource[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectcountryButton.setTitle(datasource[indexPath.row].text, for: .normal)
        languageApp = datasource[indexPath.row]
        isSelect = true
        dropdown()
    }
}
