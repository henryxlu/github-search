//
//  ShowUserViewController.swift
//  GithubSearch
//
//  Created by Henry on 2019/7/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit

class ShowUserViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var username: String?
    
    @IBOutlet weak var tableview:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        //UItableView的事件處理以及資料處理委派給自己(ViewController)。
        //showuserviewcontroller 將tableview的delegate委任給自己
        self.tableview.dataSource = self
        
        tableview.register(UINib(nibName: "UserDataTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        getUser(user: username ?? "a")
        
    }
    
    let session = URLSession.shared
    
    //繼承並且實例化
    var informationArray :[Information] = []{
        didSet{
            tableview.reloadData()
            //UITableView.reloadData() must be used from main thread only(多線程
            //DispatchQueue.main.sync 解決方法
        }
    }
    
    
    func getUser (user:String){
        
        if let url = URL(string: "https://api.github.com/users/\(user)/starred") {
            let decoder = JSONDecoder()
            session.dataTask(with: url){ (data, respons, error) in
                if let error = error {
                    print(error.localizedDescription)
                }else {
                    if let data = data {
                        do {
                            try DispatchQueue.main.sync {
                                self.informationArray = try decoder.decode([Information].self, from: data)
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return information.count
        return  informationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserDataTableViewCell
        
        let i = informationArray[indexPath.row]
        
        cell.projectNameLabel.text = i.name
        cell.starLabel.text = "\(i.stargazers_count ?? 0)"
        cell.descriptionLabel.text = i.description
        cell.forkLabel.text = "\(i.forks_count ?? 0)"
        cell.nameLabel.text = i.owner?.login
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    
}
