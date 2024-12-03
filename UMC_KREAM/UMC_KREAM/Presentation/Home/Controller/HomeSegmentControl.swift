//
//  HomeSegmentControl.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/12/24.
//

import UIKit

/// 홈 뷰컨트롤러 내부 세그먼트 컨트롤러
class HomeSegmentControl: UISegmentedControl {
    
    /// 세그먼트 컨트롤러가 가지는 하단 막대 커스텀을 위한 UIView 생성
    let selectedIndicator = UIView()
    
    // MARK: - Init
    
    init(items: [String]) {
        super.init(items: items)
        configureSegmentControl()
        selectedSegmentIndicator()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - selfSetup Function
    
    /// 세그먼트 컨트롤 커스텀
    private func configureSegmentControl() {
        self.backgroundColor = UIColor.clear
        self.selectedSegmentTintColor = UIColor.clear
        
        
        /* 경계선 및 뒷 배경 제거*/
        let clearImage = UIImage()
        setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        setDividerImage(clearImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        /* 세그먼트 선택되었을 때 폰트 값 */
        let selectedAttributes = makeAttributes(color: UIColor.black, weight: .bold)
        
        /* 세그먼트 선택되지 않은 상태 폰트 값*/
        let normalAttributes = makeAttributes(color: UIColor.darkGray, weight: .regular)
        
        /* 세그먼트 선택되었을 때 폰트 설정 */
        setTitleTextAttributes(selectedAttributes, for: .selected)
        
        /* 세그먼트 기본 상태 폰트 설정 */
        setTitleTextAttributes(normalAttributes, for: .normal)
        
        /* 세그먼트 버튼 클릭 시 변화 */
        addTarget(self, action: #selector(segmentChange), for: .valueChanged)
    }
    
    // MARK: - MakeFunction
    
    /// 세그먼트 글자 커스텀 지정
    /// - Parameter weight: 굵기 조정
    /// - Returns: 지정된 폰트 스타일 반환
    private func makeAttributes(color: UIColor, weight: UIFont.Weight) -> [NSAttributedString.Key: Any] {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = color
        value[.font] = UIFont.systemFont(ofSize: 16, weight: weight)
        return value
    }
}

//MARK: - SegmentExtension

extension HomeSegmentControl {
    // MARK: - IndicatorFunction
    
    /// 세그먼트 막대 추가
    private func selectedSegmentIndicator() {
        selectedIndicator.backgroundColor = UIColor.black
        selectedSegmentIndex = 0
        addSubview(selectedIndicator)
        
        /*
         처음 등장하는 시점에서는 애니메이션이 필요가 없습니다.
         뷰 컨트롤러가 바로 띄워지는 시점이기 때문에 세그먼트가 선택된 상태로 바로 등장해야 합니다.
         그래서 animation값은 false로 지정합니다.
         */
        updateIndicatorPosition(animated: false)
    }
    
    /// 세그먼트 막대 포지션 이동 설정
    /// - Parameter animated: 애니메이션 유/무 설정
    private func updateIndicatorPosition(animated: Bool) {
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        
        /* 세그먼트 인디케이터와 세그먼트 텍스트 중간 정렬을 위한 여백 값 */
        let leftOffset: CGFloat = 1
        
        /* 선택된 세그먼트의 텍스트 길이에 맞춰 막대의 가로 길이 설정 */
        let indicatorWidth = calculateLabelWidth(for: selectedSegmentIndex)
        
        let indicatorPositionX = segmentWidth * CGFloat(selectedSegmentIndex) + (segmentWidth - indicatorWidth) / 2 - leftOffset
        let indicatorFrame = CGRect(x: indicatorPositionX, y: bounds.height - 3, width: indicatorWidth, height: 2)
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.selectedIndicator.frame = indicatorFrame
            })
        } else {
            self.selectedIndicator.frame = indicatorFrame
        }
    }
    
    /// 각 세그먼트 버튼 위치의 텍스트 사이즈 계산
    /// - Parameter index: 현재 선택된 세그먼트 버튼
    /// - Returns: 선택된 세그먼트 텍스트 사이즈 값 반환
    private func calculateLabelWidth(for index: Int) -> CGFloat {
           guard let title = titleForSegment(at: index) else { return 0 }
           let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
           let textSize = (title as NSString).size(withAttributes: attributes)
           return textSize.width
       }
    
    @objc private func segmentChange() {
        updateIndicatorPosition(animated: true)
    }
}
