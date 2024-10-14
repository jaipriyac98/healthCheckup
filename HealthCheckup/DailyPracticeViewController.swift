//
//  DailyPracticeViewController.swift
//  HealthCheckup
//
//  Created by MAC on 16/03/23.
//

import UIKit
import SkeletonView

class DailyPracticeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var daily_Time = ["20mins", "30mins","Feel free","7 hours","20mins"]
    var daily_Image = ["emoji","inlove","smiling","star"]
    var daily_Image1 = ["Lightblue","Lightblue","Lightblue","Lightblue","Lightblue"]
    
    @IBOutlet weak var title_Label: UILabel!
    
    @IBOutlet weak var description_Label: UILabel!
    
    @IBOutlet weak var bell_image: UIImageView!
    
    @IBOutlet weak var profile_Image: UIImageView!
    
    @IBOutlet weak var daily_Label: UILabel!
    
    @IBOutlet weak var issue_Label: UILabel!
    
    @IBOutlet weak var emoji_Label: UILabel!
    
    @IBOutlet weak var dailyPractice_CollectionView: UICollectionView!
    
    @IBOutlet weak var isssue_CollectionView: UICollectionView!
    
    @IBOutlet weak var emoji_View: UIView!
    
    @IBOutlet weak var daily_ScrollView: UIScrollView!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        daily_ScrollView.showsVerticalScrollIndicator = false
        self.navigationItem.setHidesBackButton(true, animated: false)
         emoji_View.isSkeletonable = true
         emoji_View.showAnimatedSkeleton()
        
        title_Label.isSkeletonable = true
        title_Label.showAnimatedSkeleton()
        
        bell_image.isSkeletonable = true
        bell_image.showAnimatedSkeleton()
        
        profile_Image.isSkeletonable = true
        profile_Image.showAnimatedSkeleton()
        
        issue_Label.isSkeletonable = true
        issue_Label.showAnimatedSkeleton()
        
        emoji_Label.isSkeletonable = true
        emoji_Label.showAnimatedSkeleton()
        
        description_Label.isSkeletonable = true
        description_Label.showAnimatedSkeleton()
        
        daily_Label.isSkeletonable = true
        daily_Label.showAnimatedSkeleton()
        
        dailyPractice_CollectionView.isSkeletonable = true
        dailyPractice_CollectionView.showAnimatedGradientSkeleton()
        
    
        emoji_View.layer.cornerRadius = 10
        emoji_View.layer.borderWidth = 1
        emoji_View.layer.borderColor = UIColor.lightGray.cgColor
        
        dailyPractice_CollectionView.showsVerticalScrollIndicator = false
        dailyPractice_CollectionView.showsHorizontalScrollIndicator = false
        isssue_CollectionView.showsVerticalScrollIndicator = false
        isssue_CollectionView.showsHorizontalScrollIndicator = false
        
        self.dailyPractice_CollectionView.register(UINib(nibName:"HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        dailyPractice_CollectionView.delegate = self
        dailyPractice_CollectionView.dataSource = self
        
        isssue_CollectionView.delegate = self
        isssue_CollectionView.dataSource = self
        
        self.isssue_CollectionView.register(UINib(nibName:"IssueCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IssueCollectionViewCell")
        
        let layout = dailyPractice_CollectionView.collectionViewLayout as!
        UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        let layout1 = isssue_CollectionView.collectionViewLayout as!
        UICollectionViewFlowLayout
        layout1.scrollDirection = .horizontal
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { [weak self] _ in
                   self?.emoji_View.hideSkeleton()
            self?.daily_Label.hideSkeleton()
            self?.description_Label.hideSkeleton()
            self?.dailyPractice_CollectionView.hideSkeleton()
            self?.issue_Label.hideSkeleton()
            self?.bell_image.hideSkeleton()
            self?.profile_Image.hideSkeleton()
            self?.emoji_Label.hideSkeleton()
            self?.title_Label.hideSkeleton()
               })
      
    }
    deinit {
            // Invalidate the timer to release the reference and prevent memory leaks
            timer?.invalidate()
        }

    @IBAction func dailyVc_Backbtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dailyPractice_CollectionView {
            return daily_Image.count
        } else {
            return daily_Image1.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dailyPractice_CollectionView {
        let cell = dailyPractice_CollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.dailyPractice_Image.image = UIImage(named: daily_Image[indexPath.row])
            
            cell.dailyPractice_Label.text = daily_Time[indexPath.row]
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 10
           return cell
            
            
                
        } else {
            let cell1 = isssue_CollectionView.dequeueReusableCell(withReuseIdentifier: "IssueCollectionViewCell", for: indexPath) as! IssueCollectionViewCell
            cell1.Issue_image.image = UIImage(named: daily_Time[indexPath.row])
            cell1.issue_Label.text = daily_Time[indexPath.row]
            cell1.layer.borderWidth = 1
            cell1.layer.borderColor = UIColor.lightGray.cgColor
            cell1.layer.cornerRadius = 10
            return cell1
                
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == dailyPractice_CollectionView {
            return CGSize(width: UIScreen.main.bounds.width-310, height: 70)
        } else if collectionView == isssue_CollectionView {
            return CGSize(width: UIScreen.main.bounds.width-40, height: 180)
        }
        else {
            return CGSize(width: UIScreen.main.bounds.width-50, height: 140)
        }
    }
    }
    
