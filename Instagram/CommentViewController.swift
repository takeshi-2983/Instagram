//
//  CommentViewController.swift
//  Instagram
//
//  Created by user on 2021/02/12.
//

import UIKit
import Firebase
import SVProgressHUD


class CommentViewController: UIViewController {
    
    var postdataA : PostData!

    @IBOutlet weak var commentT: UITextField!
    
    // commentの投稿
    @IBAction func commentButton(_ sender: Any) {
        
        // 更新データを作成する
        var updateValue: FieldValue
        // textfieldに入力したテキストを代入
        updateValue = FieldValue.arrayUnion([commentT.text!])
        // farestoreのcommentに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postdataA.id)
            postRef.updateData(["comment": updateValue])
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
        
        // 投稿処理が完了したので先頭画面に戻る
       UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
