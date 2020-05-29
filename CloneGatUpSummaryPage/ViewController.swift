//
//  ViewController.swift
//  CloneGatUpSummaryPage
//
//  Created by macOS on 5/28/20.
//  Copyright © 2020 macOS. All rights reserved.
//

import UIKit
import Alamofire
import MagicMapper
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet weak var tbv:UITableView!
    
    
    var arrPost:[Post] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbv.dataSource = self
        tbv.delegate = self
        
        tbv.register(UINib(nibName: "TableViewCellGatUpInfo", bundle: nil), forCellReuseIdentifier: "TableViewCellGatUpInfo")
        
//        self.loadDataAlamofire(getData: {value in
//            self.arrPost = value
//            self.tbv.reloadData()
//        })
        parseDataWithSwiftyJSON()
    }
    
    func loadDataAlamofire(getData: @escaping (([Post]) -> Void )) {
        AF.request("https://fordevv2.gatbook.org/api/v1/gat_up/news?pageNum=1&pageSize=10").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                if let json = value as? [String:Any]{
                    if let arr = json["data"] as? [String:Any] {
                        if let arr1 = arr["pageData"] as? [[String:Any]]{
                            if let arr3 = arr1 as? [Any]{
                                print(arr3.count)
                                var datas:[Post] = []
                                for i in arr3 {
                                    if let abc = i as? KeyValue{
                                        print(abc)
                                        print("-------------")
                                        let iObj = Post(abc)
                                        datas.append(iObj)
                                    }
                                }
                                getData(datas)
                            }
                        }
                    }
                }
                
                
            case.failure(let err):
                print(err)
            }
        }
    }
    
    
    func parseDataWithSwiftyJSON(){
        AF.request("https://fordevv2.gatbook.org/api/v1/gat_up/news?pageNum=1&pageSize=10").responseJSON { response in
            switch response.result {
            case .success(let value):
                let data = JSON(value)
                if let dataJSON = data["data"]["pageData"].dictionaryObject{
//                    for i in dataJSON {
//                        print(i["title"].stringValue)
//                    }
                }
                
                
            case .failure(let err):
                print(err)
            }
        }
    }


}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrPost.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellGatUpInfo") as! TableViewCellGatUpInfo
        cell.lblTitle.text = arrPost[indexPath.row].title
        cell.txtViewContent.text = String(arrPost[indexPath.row].gatUpNewsId)
        return cell
    }


}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

