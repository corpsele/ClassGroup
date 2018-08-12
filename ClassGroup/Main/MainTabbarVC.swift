//
//  MainTabbarVC.swift
//  ClassGroup
//
//  Created by Corpse Le on 2018/8/11.
//  Copyright © 2018年 Corpse Le. All rights reserved.
//

import UIKit
import SnapKit

class MainTabbarVC: UIViewController {
    
    var arrayVC: [UIViewController] = [] {
        didSet{
//            setVCs()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addChildViewController(tabbarVC)
        self.view.addSubview(tabbarVC.view)
        
        tabbarVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        configVC()
        
        
        setVCs()
        
    }
    
    ///配置VC
    func configVC(){
        let navi1 = UINavigationController.init(rootViewController: mainVC)
        navi1.tabBarItem.title = "首页"
        arrayVC.append(navi1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var mainVC: MainViewController = {
       var vc = MainViewController.init(nibName: "MainViewController", bundle: Bundle.main)
//        vc.tabBarItem.title = "首页"
        return vc
    }()
    
    ///配置tabbar
    func setVCs(){
        tabbarVC.viewControllers = arrayVC
        
        
    }
    
    lazy var tabbarVC: UITabBarController = {
       var tabbar = UITabBarController()
        return tabbar
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
