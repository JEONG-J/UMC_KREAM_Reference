//
//  ImageDown.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/13/24.
//

import UIKit
import ImageIO

extension UIImage {
    func downSample(scale: CGFloat) -> UIImage {
        _ = [kCGImageSourceShouldCache: false] as CFDictionary
            let data = self.pngData()! as CFData
            let imageSource = CGImageSourceCreateWithData(data, nil)!
            let maxPixel = max(self.size.width, self.size.height) * scale
            let downSampleOptions = [
                kCGImageSourceCreateThumbnailFromImageAlways: true,
                kCGImageSourceShouldCacheImmediately: true,
                kCGImageSourceCreateThumbnailWithTransform: true,
                kCGImageSourceThumbnailMaxPixelSize: maxPixel
            ] as CFDictionary

            let downSampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downSampleOptions)!

            let newImage = UIImage(cgImage: downSampledImage)
            return newImage
        }
}
