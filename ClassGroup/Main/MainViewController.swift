//
//  MainViewController.swift
//  ClassGroup
//
//  Created by Corpse Le on 2018/8/11.
//  Copyright © 2018年 Corpse Le. All rights reserved.
//

import UIKit
import Alamofire
/*
 主界面
 */
class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    lazy var scrollView: UIScrollView = {

        var view = UIScrollView()
        return view
    }()
    
    lazy var mPageControl: UIPageControl = {
        
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
