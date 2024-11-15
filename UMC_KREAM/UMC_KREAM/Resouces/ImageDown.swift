//
//  ImageDown.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/13/24.
//

import UIKit
import ImageIO

extension UIImage {
    /// 이미지 사이즈 조절, 데이터 타입으로 변환 후 리사징하기 떄문애 메모리 절약 효율적!!
    /// 자세한 건 공지한 노션에 올려두었으니 꼭 읽어보시길 바랍니다
    /// - Parameter scale: 이미지 자체 이미지를 1이라 정하고, 얼마큼 줄일것인지 스케일을 입력!!
    /// - Returns: 스케일을 통해 리사이징된 이미지 반환
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
