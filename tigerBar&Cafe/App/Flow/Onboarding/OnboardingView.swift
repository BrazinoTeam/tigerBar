import Foundation
import UIKit
import SnapKit

class OnboardingView: UIView {
    
    private(set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgStart
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) var loadView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.cYellow.cgColor
        return view
    }()

    private(set) lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 0.0
        progressView.progressTintColor = .cOrange
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        return progressView
    }()

    private var gradientLayer: CAGradientLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [bgImage, loadView].forEach(addSubview(_:))
        loadView.addSubview(progressView)
    }
    
    private func setupConstraints() {
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loadView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(296)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-130)
        }
        
        progressView.snp.makeConstraints { make in
            make.left.equalTo(loadView.snp.left).offset(8)
            make.right.equalTo(loadView.snp.right).offset(-8)
            make.centerY.equalTo(loadView.snp.centerY)
            make.height.equalTo(16)
        }
    }
}


