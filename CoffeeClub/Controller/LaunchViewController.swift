import UIKit

class LaunchViewController: UIViewController {
    private let loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoadingView()
        navigateToMainScreenAfterDelay()
    }
    
    private func setupLoadingView() {
        loadingView.frame = view.bounds
        view.addSubview(loadingView)
        loadingView.startAnimating()
    }
    
    private func navigateToMainScreenAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.loadingView.stopAnimating()
            self.navigateToMainScreen()
        }
    }
    
    private func navigateToMainScreen() {
        let mainVC = ViewController()
        mainVC.modalTransitionStyle = .crossDissolve
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
}
