//
//  AppManger.swift
//  VTrustValuate
//
//  Created by iOSDev on 13/7/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit
import Photos
//import DKImagePickerController

class AppManager: NSObject {
    public static let  appColor = UIColor.init(netHex: 0x3f72e0)
    public static let  lighBlue = UIColor.init(netHex: 0x5081a1)
    public static let  successColor = UIColor.init(netHex: 0x3ade85)
    
    static func showAlert(message:String, vc:UIViewController){
        let alert = UIAlertController.init(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        alert.view.tintColor = UIColor.blue
        
    }
    
    static func convertFileImageToBase64(url: URL, isImage: Bool = false) -> String {
        
        let data = try! Data(contentsOf: url)
        var str64 = ""
        if isImage {
            let dataImage = UIImage(data: data)
            let imgData = UIImageJPEGRepresentation(dataImage!, 0.2)
            str64 = (imgData?.base64EncodedString(options: .init(rawValue: 0)))!
        } else {
            str64 = data.base64EncodedString(options: .init(rawValue: 0))
        }
        
        return str64
    }
    
    static func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
//    static func isArrayFileSizeSmaller(arrUrlFile: [URL], urlSelected: URL) -> Bool {
//        var newArrayURL = arrUrlFile
//        newArrayURL.append(urlSelected)
//        var totalSize: UInt64 = 0
//        for url in newArrayURL {
//            totalSize += url.fileSize
//        }
//        let kb = totalSize / 1024
//        let mb = kb/1000
//        let isSmallFile = mb < Constant.Cofig.MAX_SIZE_FILE ? true : false
//        return isSmallFile
//    }
//    
//    static func isTotalImageSmaller(images: [DKAsset], isTotalSmaller: @escaping (_ isSmaller: Bool)->()){
//        var sizeOnDisk: Double = 0
//        let dipachGroup = DispatchGroup()
//        for img in images {
//            dipachGroup.enter()
//            img.originalAsset?.getURL(ofPhotoWith: img.originalAsset!, completionHandler: { (url) in
//                let data = try! Data(contentsOf: url!)
//                let dataImage = UIImage(data: data)
//                let imgData = UIImageJPEGRepresentation(dataImage!, 0.2)
//                let fileSize = imgData?.count
//                let kb = Double(fileSize!)/1024.0
//                let mb = kb/1000.0
//                sizeOnDisk += mb
//                dipachGroup.leave()
//            })
//        }
//        dipachGroup.notify(queue: .main) {
//            isTotalSmaller(sizeOnDisk < Constant.Cofig.MAX_SIZE_IMG)
//        }
//    }
}
