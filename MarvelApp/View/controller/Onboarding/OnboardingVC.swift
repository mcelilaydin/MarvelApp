//
//  OnboardingVC.swift
//  MarvelApp
//
//  Created by Celil Aydın on 25.02.2023.
//

import UIKit
import Loaf

class OnboardingVC: UIViewController {
    
    var slides: [OnboardingSlide] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.layer.opacity = 1
                nextBtn.setTitle("Get Started", for: .normal)
            }else {
                nextBtn.layer.opacity = 0.5
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setView()
        slides = [
            OnboardingSlide(title: "MARVEL", description: "marvel's characters, events and series.", image:UIImage(named: "marvelLogo")!),
            OnboardingSlide(title: "Series", description: "There are Series.", image:UIImage(named: "poster1")!),
            OnboardingSlide(title: "Events", description: "There are Events.", image:UIImage(named: "poster2")!)
        ]
    }
    
    private func setView() {
        nextBtn.layer.opacity = 0.5
    }
    
    @IBAction func nextbtnClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            UserDefaults.standard.set(true, forKey: "openApp")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "animationVC") as! AnimationVC
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        }else {
            Loaf("Swipe Right", state: .error, sender: self).show()
        }
    }
    
}

extension OnboardingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

