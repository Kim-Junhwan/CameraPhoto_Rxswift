//
//  ViewController.swift
//  CameraPhoto_Rxswift
//
//  Created by JunHwan Kim on 2022/06/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView : UIImageView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nav = segue.destination as? UINavigationController,
              let photosCVC = nav.viewControllers.first as? PhotosCollectionViewController
        else{
            fatalError("Segue destination is not found")
        }
        photosCVC.selectedPhoto.subscribe(onNext : {[weak self] photo in
            self?.photoImageView.image = photo
        }).disposed(by: disposeBag)
    }

}

