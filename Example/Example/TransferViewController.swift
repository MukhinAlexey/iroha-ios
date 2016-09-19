//
//  TransferViewController.swift
//  Example
//
//  Created by Kaji Satoshi on 2016/09/20.
//  Copyright © 2016年 Kaji Satoshi. All rights reserved.
//

import Foundation
import UIKit

class TransferViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var valueField: UITextField!
    
    let cellid: [String] = [
        "7","8","9",
        "4","5","6",
        "1","2","3",
        "delete","0","trans"
        ]
    
    let label: [String] = [
        "7","8","9",
        "4","5","6",
        "1","2","3",
        "delete","0","送る"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section==0){
            return 12
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        var label: UILabel
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid[indexPath.row], for: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.blue
        label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        label.text = self.label[indexPath.row]
        label.textAlignment = NSTextAlignment.center
        if(indexPath.row == 11){
            label.textColor = UIColor.iroha()
            label.backgroundColor = UIColor.white
        }else{
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.iroha()
        }
        cell.addSubview(label)
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (UIScreen.main.bounds.width/3)-1, height: (collectionView.bounds.height/4)-1)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0,1,2,3,4,5,6,7,8,10:
                if(valueField.text == ""){
                    valueField.text = cellid[indexPath.row]
                }else{
                    valueField.text! += cellid[indexPath.row]
                }
                break
            case 9:
                if(valueField.text != ""){
                    valueField.text = valueField.text?.substring(to: (valueField.text?.index((valueField.text?.endIndex)!, offsetBy: -1))!)
                }
            break
            default:
                break
        }
        
    }

}
