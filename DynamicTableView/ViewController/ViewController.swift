//
//  ViewController.swift
//  DynamicTableView
//
//  Created by Asif Rabbi on 5/12/21.
//

import UIKit

class ViewController: UIViewController{
    
    var myTableView: UITableView  =   UITableView()
    var myArray = [["image1", "hello world!","image2","image3", "hello world!","image4","Naruto", "Sasuke", "Kakashi", "Sensei", "image3"],
                   ["Naruto", "Sasuke", "Kakashi", "Sensei", "image3"],
                   ["Naruto Sasuke Kakashi Sensei Naruto Sasuke Kakashi Sensei",
                   "image4"],
                   ["image1", "hello world!", "hello world!","image4","Naruto", "Kakashi", "Sensei", "image3"],
                   ["image1", "hello world!", "hello world!","image4","Naruto", "Kakashi", "Sensei", "image3"],
                   ["image1", "hello world!", "Kakashi", "Sensei", "image3"],
                    ["ygjkhkjl;j;ljkpkp]k[k[]k[k[" , "hhhhkokoko"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
 
        myTableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        self.view.addSubview(myTableView)
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.setData(items: myArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

