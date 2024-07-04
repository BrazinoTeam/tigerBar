import Foundation
import UIKit
import SnapKit

class AboutUsView: UIView {

    private(set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private(set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        btn.setBackgroundImage(.btnBackTapped, for: .highlighted)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private(set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "About Us", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
   
    private(set) var imgCenter: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTigerCenter
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private(set) var imgContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContainer
        return imageView
    }()
    
    private(set) var imgTitle: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTitle
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var bodyFieldInfo: UILabel = {
        let label = UILabel()
        let textStyle = NSMutableParagraphStyle()
        textStyle.lineBreakMode = .byWordWrapping
        textStyle.lineHeightMultiple = 0.88
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.customFont(font: .archivo, style: .thin, size: 14),
            .foregroundColor: UIColor.white,
            .paragraphStyle: textStyle
        ]
        
        let attributedText = NSMutableAttributedString(string: """
    Come and experience the unique charm of Tiger Bar and Cafe! Established in 1932, our venue is a beloved local favorite known for its lively atmosphere, delicious food, and exciting events. Whether you're a local or a tourist, you'll enjoy our diverse menu featuring mouth-watering dishes like our juicy cheeseburgers, crispy fish and chips, and refreshing margaritas. Join us for live music nights and special events that bring the community together. We pride ourselves on quality service and creating memorable experiences for all our guests.

    History:

    \u{2022} Tiger Bar and Cafe was established in 1932, serving the June Lake community for decades. The venue has become a local favorite for its unique blend of history, great food, and vibrant atmosphere.

    Mission and Values:

    \u{2022} Missions: To provide a welcoming and enjoyable dining and nightlife experience for locals and tourists alike.
    \u{2022} Value: Commitment to quality, community, and creating memorable experiences.

    Achievements:

    \u{2022} Recognized as a top dining and entertainment spot in June Lake.
    \u{2022} Hosted numerous successful events and live music nights that have become a staple in the local community.

    Community Involvement:

    \u{2022} Active participation in local events and initiatives.
    \u{2022} Support for local artists and musicians through regular live performances
    """,
                                                       attributes: attributes)
        
        let titleFont = UIFont.customFont(font: .aclonica, style: .regular, size: 14)
           let titleColor = UIColor.cYellow
           let boldFont = UIFont.customFont(font: .archivo, style: .bold, size: 14)
           let titleRanges = [
               "History:",
               "Mission and Values:",
               "Achievements:",
               "Community Involvement:"
           ].compactMap { title -> NSRange? in
               let range = (attributedText.string as NSString).range(of: title)
               return range.location != NSNotFound ? range : nil
           }
           
           for range in titleRanges {
               attributedText.addAttributes([.font: titleFont, .foregroundColor: titleColor], range: range)
           }
           
           let subTitleRanges = [
               "Missions:",
               "Value:"
           ].compactMap { title -> NSRange? in
               let range = (attributedText.string as NSString).range(of: title)
               return range.location != NSNotFound ? range : nil
           }
           
           for range in subTitleRanges {
               attributedText.addAttribute(.font, value: boldFont, range: range)
           }
           
           label.attributedText = attributedText
           label.backgroundColor = .clear
           label.numberOfLines = 0
           label.textAlignment = .left
           return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [bgImage, btnBack, titleLabel, imgCenter, scrollView].forEach(addSubview(_:))
        scrollView.addSubview(imgContainer)
        scrollView.addSubview(imgTitle)
        scrollView.addSubview(bodyFieldInfo)
    }
    
    private func setupConstraints() {
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(btnBack).offset(4)
        }
        
        imgCenter.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(266)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imgCenter.snp.bottom).offset(-8)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        imgContainer.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.height.equalTo(628)
        }
        
        imgTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.height.equalTo(22)
        }
        
        bodyFieldInfo.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(imgTitle.snp.bottom).offset(16)
            make.width.equalTo(scrollView.frameLayoutGuide).offset(-32) // Устанавливаем ширину равной ширине scrollView с учетом отступов
        }
    }
}

