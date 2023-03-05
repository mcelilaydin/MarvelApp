//
//  AnimationVC.swift
//  MarvelApp
//
//  Created by Celil Aydın on 1.03.2023.
//

import UIKit
import Lottie

class AnimationVC: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.stopAnimation()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.tabbarIdenrifier) as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true)
        }
    }
    
    func lottieAnimation(){
        animationView = .init(name: "109259-hero")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 700)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .playOnce
    }
    func stopAnimation(){
        animationView.stop()
    }

}
