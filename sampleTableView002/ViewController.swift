//
//  ViewController.swift
//  sampleTableView002
//
//  Created by Eriko Ichinohe on 2017/01/27.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var myTableView: UITableView!
    
    var teaList = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teaList.count
    }
    
    //リストに文字を表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = teaList[indexPath.row]
        
        return cell
    }
    
    //行が選択された時に発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)行目を選択")
        //選択された行番号を他のメソッドで使用するためにメンバ変数に保存
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "showSecondView", sender: nil)
    }
    
    //Segueで画面遷移する時発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //次の画面のオブジェクトを作成
        let secondVC = segue.destination as! SecondViewController
        
        //選択された行番号を次の画面のプロパティに保存
        secondVC.scSelectedIndex = selectedIndex
        print(secondVC.scSelectedIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

