

import UIKit

class BaseTabbarViewController: UITabBarController, UITabBarControllerDelegate {
    var homeViewController: HomeViewController!
    var settingViewController: SettingViewController!
    var searchViewController: SearchViewController!
    var libraryViewController: LibraryViewController!
    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(hexFromString: "#29262A")
        
        homeViewController = HomeViewController()
        settingViewController = SettingViewController()
        searchViewController = SearchViewController()
        libraryViewController = LibraryViewController()
        
        homeViewController.tabBarItem.image = UIImage(named: "home_icon")
        homeViewController.tabBarItem.title = "home".localized
        
        settingViewController.tabBarItem.image = UIImage(named: "setting_icon")
        settingViewController.tabBarItem.title = "setting".localized
        
        searchViewController.tabBarItem.image = UIImage(named: "search_icon")
        searchViewController.tabBarItem.title = "search".localized
        
        libraryViewController.tabBarItem.image = UIImage(named: "library_icon")
        libraryViewController.tabBarItem.title = "library".localized
        
        viewControllers = [homeViewController, searchViewController, libraryViewController, settingViewController]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: BaseTabbarViewController.self) {
            let vc = HomeViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}
