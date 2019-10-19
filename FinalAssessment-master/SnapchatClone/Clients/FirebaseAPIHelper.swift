//
//  FirebaseAPIHelper.swift
//  
//
//  Created by Will Oakley on 10/24/18.
//

import Foundation
import FirebaseStorage
import Firebase

class FirebaseAPIClient {
    
    static func getSnaps(completion: @escaping ([SnapImage]) -> ()) {
        /* PART 2A START */
        let ref = Database.database().reference()
        let imgsRef = ref.child("snapImages")
        imgsRef.observeSingleEvent(of: .value) { (snapshot) in
            let dict = snapshot.value as? [String : AnyObject] ?? [:]
            var images = [SnapImage]()
            for (_, img) in dict{
                guard let imageURL = img["imageURL"] else{
                    continue
                }
                let sref = Storage.storage().reference()
                let imageRef = sref.child(imageURL as! String)
                imageRef.getData(maxSize: 1 * 1024 * 1024){ (data, error) in
                    if data == nil {
                        return
                    }
                    guard let image = UIImage(data: data!) else {
                        return
                    }
                    images.append(SnapImage(imageDict: img as! [String : String], image: image))
                    
                }
            }
            completion(images)
                
        }
        
        /* PART 2A FINISH */
    }
}
