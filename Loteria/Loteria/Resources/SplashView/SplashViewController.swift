import Foundation
import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator?.startAnimating()
        
        splashToMain()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        indicator?.stopAnimating()
    }
    
    private func splashToMain() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            let mainboard = UIStoryboard(name: "Main", bundle: nil)
            if let destination = mainboard.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination], animated: true)
            }
        }
    }

    
}
