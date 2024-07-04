import UIKit
import Lottie

class LoadingView: UIView {
    private let animationView: LottieAnimationView
    
    override init(frame: CGRect) {
        animationView = LottieAnimationView(name: "loading")
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(animationView)
        
        // 애니메이션 뷰의 크기와 위치를 조정합니다.
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            animationView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            animationView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
        ])
        
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
