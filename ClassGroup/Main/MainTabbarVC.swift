//
//  MainTabbarVC.swift
//  ClassGroup
//
//  Created by Corpse Le on 2018/8/11.
//  Copyright © 2018年 Corpse Le. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

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

        
        Alamofire.request("http://10.18.15.133:8060/uk-travel/v1/footprints/", method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {[weak self] (response) in
           print(response.result)
            print(response.result.value)

            if let dic = response.result.value as? [String: Any] {
                if let str = dic["msg"] as? String {
                    print(str.utf8)
                }
            }
        }
    }
    
    ///配置VC
    func configVC(){
        self.navigationItem.title = "同学CC"
        
        let navi1 = UINavigationController.init(rootViewController: mainVC)
        let item1 = UITabBarItem.init(title: "首页", image: #imageLiteral(resourceName: "home"), tag: 0)
        navi1.tabBarItem = item1
        arrayVC.append(navi1)
        
        let navi2 = UINavigationController.init(rootViewController: classmateVC)
        let item2 = UITabBarItem.init(title: "同学", image: #imageLiteral(resourceName: "classmate"), tag: 1)
        navi2.tabBarItem = item2
        arrayVC.append(navi2)
        
        let navi3 = UINavigationController.init(rootViewController: courseVC)
        let item3 = UITabBarItem.init(title: "课程", image:#imageLiteral(resourceName: "course"), tag: 2)
        navi3.tabBarItem = item3
        arrayVC.append(navi3)
        
        let navi4 = UINavigationController.init(rootViewController: mineVC)
        let item4 = UITabBarItem.init(title: "我的", image: #imageLiteral(resourceName: "mine"), tag: 3)
        navi4.tabBarItem = item4
        arrayVC.append(navi4)



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///首页
    lazy var mainVC: MainViewController = {
       var vc = MainViewController.init(nibName: "MainViewController", bundle: Bundle.main)
        return vc
    }()
    
    ///我的
    lazy var mineVC: MineViewController = {
       var vc = MineViewController.init(nibName: "MineViewController", bundle: Bundle.main)
        return vc
    }()
    
    ///课程
    lazy var courseVC: CourseViewController = {
       var vc = CourseViewController.init(nibName: "CourseViewController", bundle: Bundle.main)
        return vc
    }()
    
    ///同学
    lazy var classmateVC: ClassMateViewController = {
       var vc = ClassMateViewController.init(nibName: "ClassMateViewController", bundle: Bundle.main)
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


    lazy var scrollView: UIScrollView = {

        var view = UIScrollView()
        return view
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
