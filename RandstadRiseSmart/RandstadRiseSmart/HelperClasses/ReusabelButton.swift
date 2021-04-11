//
//  ReusabelButton.swift
//  RandstadRiseSmart
//
//  Created by Mangesh Shinde on 11/04/21.
//

import UIKit

struct IconTextButtonViewModel {
    let text : String
    let icon : UIImage?
    let backgroundColor : UIColor?
    let textColor : UIColor?
}

class ReusabelButton: UIButton {
    
    override public var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? Colors.buttonPressedBackgroundColor : Colors.buttonEnableBackgroundColor
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            DispatchQueue.main.async { [self] in
                backgroundColor = isEnabled ? Colors.buttonEnableBackgroundColor : Colors.buttonDisableBackgroundColor
                label.textColor = isEnabled ? .white : Colors.buttonDisableTextColor
            }
        }
    }
    
    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Lock")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = (frame.size.height / 2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: IconTextButtonViewModel) {
        label.text = viewModel.text
        imageView?.image = viewModel.icon
        backgroundColor = viewModel.backgroundColor
        label.tintColor = viewModel.textColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        let iconSize : CGFloat = 20
        let iconX : CGFloat = (frame.size.width - label.frame.size.width - iconSize - 30) / 2
        iconImageView.frame = CGRect(x: iconX, y: (frame.size.height - iconSize) / 2, width: 20, height: 20)
        label.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
}
