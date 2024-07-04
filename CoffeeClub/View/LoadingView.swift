import UIKit
import SnapKit
import Lottie

class LoadingView: UIView {
    private let animationView: LottieAnimationView
    
    override init(frame: CGRect) {
        animationView = LottieAnimationView(name: "loading2")
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(animationView)
        
        // 애니메이션 뷰를 화면 전체로 설정
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
        // 애니메이션 재생
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func startAnimating() {
        animationView.play()
    }
    
    func stopAnimating() {
        animationView.stop()
    }
}
