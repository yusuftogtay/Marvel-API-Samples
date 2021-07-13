//
//  ImagePath.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import Foundation
import UIKit

extension UIImageView   {
    func imagePath(thumbnail: Thumbnail, size: ImageSizeConstant) -> String {
        return "\(thumbnail.path ?? "")\(size.rawValue).\(thumbnail.thumbnailExtension ?? "")"
    }
}

extension UIImage   {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
