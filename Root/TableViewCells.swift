//
//  YourAccountTableView.swift
//  YC
//
//  Created by VeveCorp on 7/13/16.
//  Copyright © 2016 VeveCorp. All rights reserved.
//

import UIKit
import IBAnimatable
import DropDown

class PostHaverest : UITableViewCell {
    @IBOutlet weak var question: AnimatableLabel!
    @IBOutlet weak var food_drop_down_menu: AnimatableButton!
    @IBOutlet weak var post_window: UIView!
    
    
    let dropDown = DropDown()
    
    // The view to which the drop down will appear on
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dropDown.anchorView = post_window
        dropDown.dataSource = ["Tomatoes", "Apple",
                               "Apricot",
                               "Avocado",
                               "Banana",
                               "Bilberry",
                               "Blackberry",
                               "Blackcurrant",
                               "Blueberry",
                               "Boysenberry",
                               "Buddha's hand",
                               "Crab apples",
                               "Currant",
                               "Cherry",
                               "Cherimoya",
                               "Chico fruit",
                               "Cloudberry",
                               "Coconut",
                               "Cranberry",
                               "Cucumber",
                               "Custard apple",
                               "Damson",
                               "Date",
                               "Dragonfruit",
                               "Durian",
                               "Elderberry",
                               "Feijoa",
                               "Fig",
                               "Goji berry",
                               "Gooseberry",
                               "Grape"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.dropDown.hide()

        }
        self.dropDown.show()
        self.dropDown.width = 20

    }
    // The list of items to display. Can be changed dynamically

    

    
    // Will set a custom width instead of the anchor view width
    
    override func prepareForReuse() {
        
    }
    
    
    
}

/*
import UIKit
import IBAnimatable

class UsersPosts : UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postTimeStampandUser: UILabel!
    @IBOutlet weak var postLink: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var snapShotPostValue: UILabel!
    
    override func prepareForReuse() {
        postImage.image = nil
    }
    
    var post: Posts? {
        didSet {
            
            postImage.image = nil
            
            if let userUploaderPost = post!.userUploader {
                let ref = FIRDatabase.database().reference().child("users").child(userUploaderPost)
                ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                    
                

                    
                    if let dictionary = snapshot.value as? [String: AnyObject] {
                        let userName = dictionary["name"] as? String
                        
                        let youtubeTitle = self.post?.youtubeVideoDescriptionComment
                        let youTubeLink = self.post?.youtubeLink
                        let postVoteAmount = self.post?.voteCount
                        let youTubePostImage = self.post?.youtubeVideoImage
                        let youTubeCommentAmount = self.post?.commentAmount
                        let snapShotValueOfKey = self.post?.referenceToItself
                        
                        self.snapShotPostValue?.text = snapShotValueOfKey
                        let stringVote = postVoteAmount?.stringValue
                        
                        self.voteCount?.text = "\(stringVote!) Votes"
                        
                        self.postLink?.text = youTubeLink
                        
                        self.postImage?.loadImageUsingCacheWithUrlString(youTubePostImage!)
                        self.postTitle?.text = youtubeTitle
                        
                        if let seconds = self.post?.date?.doubleValue {
                            
                            let date = NSDate(timeIntervalSince1970: NSTimeInterval(seconds))
                            
                            
                            let betterDate = self.timeAgoSinceDate(date, numericDates: true)
                            
                            self.postTimeStampandUser?.text = "\(userName!) • \(youTubeCommentAmount!) • \(betterDate)"
                            
                        }
                        
                    }
                    
                    }, withCancelBlock: nil)
            }
            
            
        }
        
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year)
        } else if (components.year >= 1){
            if (numericDates){
                return NSLocalizedString("1 year ago", comment: "")
            } else {
                return NSLocalizedString("Last year", comment: "")
            }
        } else if (components.month >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month)
        } else if (components.month >= 1){
            if (numericDates){
                return NSLocalizedString("1 month ago", comment: "")
            } else {
                return NSLocalizedString("Last month", comment: "")
            }
        } else if (components.weekOfYear >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear)
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return NSLocalizedString("1 week ago", comment: "")
            } else {
                return NSLocalizedString("Last week", comment: "")
            }
        } else if (components.day >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day)
        } else if (components.day >= 1){
            if (numericDates){
                return NSLocalizedString("1 day ago", comment: "")
            } else {
                return NSLocalizedString("Yesterday", comment: "")
            }
        } else if (components.hour >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour)
        } else if (components.hour >= 1){
            if (numericDates){
                return NSLocalizedString("1 hours ago", comment: "")
            } else {
                return NSLocalizedString("An hour ago", comment: "")
            }
        } else if (components.minute >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute)
        } else if (components.minute >= 1){
            if (numericDates){
                return NSLocalizedString("1 minute ago", comment: "")
            } else {
                return NSLocalizedString("A minute ago", comment: "")
            }
        } else if (components.second >= 3) {
            return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second)
        } else {
            return NSLocalizedString("Just now", comment: "")
        }
    }
    

}

class UsersLikes : UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var postTimeStampandUser: UILabel!
    @IBOutlet weak var postLink: UILabel!
    @IBOutlet weak var postIdentifier: UILabel!
    @IBOutlet weak var unlikePostButton: UIButton!
    
    override func prepareForReuse() {
        postImage.image = nil
    }
    
    var post: Posts? {
        didSet {
            
            postImage.image = nil
            
            if let userUploaderPost = post!.userUploader {
                let ref = FIRDatabase.database().reference().child("users").child(userUploaderPost)
                ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                    
                    if let dictionary = snapshot.value as? [String: AnyObject] {
                        let userName = dictionary["name"] as? String
                        
                        let youtubeTitle = self.post?.youtubeVideoDescriptionComment
                        let youTubeLink = self.post?.youtubeLink
                        let postVoteAmount = self.post?.voteCount
                        let youTubePostImage = self.post?.youtubeVideoImage
                        let youTubeCommentAmount = self.post?.commentAmount
                        let snapShotValueOfKey = self.post?.referenceToItself
                        
                        self.postIdentifier?.text = snapShotValueOfKey!

                        
                        let stringVote = postVoteAmount?.stringValue
                        
                        self.voteCount?.text = "\(stringVote!) Votes"
                        
                        self.postLink?.text = youTubeLink
                        
                        self.postImage?.loadImageUsingCacheWithUrlString(youTubePostImage!)
                        self.postTitle?.text = youtubeTitle
                        
                        if let seconds = self.post?.date?.doubleValue {
                            
                            let date = NSDate(timeIntervalSince1970: NSTimeInterval(seconds))
                            
                            
                            let betterDate = self.timeAgoSinceDate(date, numericDates: true)
                            
                            
                            self.postTimeStampandUser?.text = "\(userName!) • \(youTubeCommentAmount!) • \(betterDate)"
                            
                        }
                        
                    }
                    
                    }, withCancelBlock: nil)
            }
            
            
        }
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year)
        } else if (components.year >= 1){
            if (numericDates){
                return NSLocalizedString("1 year ago", comment: "")
            } else {
                return NSLocalizedString("Last year", comment: "")
            }
        } else if (components.month >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month)
        } else if (components.month >= 1){
            if (numericDates){
                return NSLocalizedString("1 month ago", comment: "")
            } else {
                return NSLocalizedString("Last month", comment: "")
            }
        } else if (components.weekOfYear >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear)
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return NSLocalizedString("1 week ago", comment: "")
            } else {
                return NSLocalizedString("Last week", comment: "")
            }
        } else if (components.day >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day)
        } else if (components.day >= 1){
            if (numericDates){
                return NSLocalizedString("1 day ago", comment: "")
            } else {
                return NSLocalizedString("Yesterday", comment: "")
            }
        } else if (components.hour >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour)
        } else if (components.hour >= 1){
            if (numericDates){
                return NSLocalizedString("1 hours ago", comment: "")
            } else {
                return NSLocalizedString("An hour ago", comment: "")
            }
        } else if (components.minute >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute)
        } else if (components.minute >= 1){
            if (numericDates){
                return NSLocalizedString("1 minute ago", comment: "")
            } else {
                return NSLocalizedString("A minute ago", comment: "")
            }
        } else if (components.second >= 3) {
            return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second)
        } else {
            return NSLocalizedString("Just now", comment: "")
        }
    }

}

class HomeFeedCell: UITableViewCell {
    
    @IBOutlet weak var userPosterProfileImage: AnimatableImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postLink: UILabel!
    @IBOutlet weak var postTimeStampandUser: UILabel!
    @IBOutlet weak var amountOfKarma: UILabel!
    @IBOutlet weak var postIdentifier: UILabel!
    @IBOutlet weak var circleMenuOpener: UIButton!

    
    var post: Posts? {
        didSet {
            
            func prepareForReuse() {
                postImage.image = nil
                userPosterProfileImage.image = nil
            }
            
            postImage.image = nil
            userPosterProfileImage.image = nil
            
            if let userUploaderPost = post!.userUploader {
                let ref = FIRDatabase.database().reference().child("users").child(userUploaderPost).queryLimitedToFirst(100)
                ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                    
                    if let dictionary = snapshot.value as? [String: AnyObject] {
                        let userName = dictionary["name"] as? String
                        
                        let youtubeTitle = self.post?.youtubeVideoDescriptionComment
                        let youTubeLink = self.post?.youtubeLink
                        let youTubeCommentAmount = self.post?.commentAmount
                        let youTubePostImage = self.post?.youtubeVideoImage
                        let snapShotValueOfKey = self.post?.referenceToItself
                        let postVoteAmount = self.post?.voteCount
                        
                        self.postIdentifier?.text = snapShotValueOfKey
                        self.amountOfKarma?.text = youTubeCommentAmount
                        
                        let stringVote = postVoteAmount?.stringValue
                        
                        self.postLink?.text = youTubeLink
                        
                        self.postImage?.loadImageUsingCacheWithUrlString(youTubePostImage!)
                        self.postTitle?.text = youtubeTitle
                        
                        if let seconds = self.post?.date?.doubleValue {
                            
                            let date = NSDate(timeIntervalSince1970: NSTimeInterval(seconds))
                            
                            
                            let betterDate = self.timeAgoSinceDate(date, numericDates: true)
                            
                            if userName == nil {
                                self.postTimeStampandUser?.text = "\(betterDate)•Unknown"
                            }
                            
                            self.postTimeStampandUser?.text = "\(userName!) • \(stringVote!) Likes • \(betterDate)"
                            
                        }
                        
                        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
                            self.userPosterProfileImage?.loadImageUsingCacheWithUrlString(profileImageUrl)
                        } else {
                            self.userPosterProfileImage.image = UIImage(named: "1")
                        }
                        
                    }
                    
                    }, withCancelBlock: nil)
            }
            
            
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year)
        } else if (components.year >= 1){
            if (numericDates){
                return NSLocalizedString("1 year ago", comment: "")
            } else {
                return NSLocalizedString("Last year", comment: "")
            }
        } else if (components.month >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month)
        } else if (components.month >= 1){
            if (numericDates){
                return NSLocalizedString("1 month ago", comment: "")
            } else {
                return NSLocalizedString("Last month", comment: "")
            }
        } else if (components.weekOfYear >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear)
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return NSLocalizedString("1 week ago", comment: "")
            } else {
                return NSLocalizedString("Last week", comment: "")
            }
        } else if (components.day >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day)
        } else if (components.day >= 1){
            if (numericDates){
                return NSLocalizedString("1 day ago", comment: "")
            } else {
                return NSLocalizedString("Yesterday", comment: "")
            }
        } else if (components.hour >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour)
        } else if (components.hour >= 1){
            if (numericDates){
                return NSLocalizedString("1 hours ago", comment: "")
            } else {
                return NSLocalizedString("An hour ago", comment: "")
            }
        } else if (components.minute >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute)
        } else if (components.minute >= 1){
            if (numericDates){
                return NSLocalizedString("1 minute ago", comment: "")
            } else {
                return NSLocalizedString("A minute ago", comment: "")
            }
        } else if (components.second >= 3) {
            return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second)
        } else {
            return NSLocalizedString("Just now", comment: "")
        }
    }
    
}

class HomePageCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageIdentifier: UIImageView!
    @IBOutlet weak var titleOfCell: UILabel!
    
}

class suggestionsCommentsCell: UITableViewCell {
   
    @IBOutlet weak var postInformation: UILabel!
    @IBOutlet weak var nameDateField: UILabel!
    @IBOutlet weak var userProfileImage: AnimatableImageView!
    @IBOutlet weak var numberOfComments: UILabel!
    @IBOutlet weak var numberOfPostLikes: UILabel!
    @IBOutlet weak var postIdentifier: UILabel!
    @IBOutlet weak var showMoreButton: UIButton!
    
    override func prepareForReuse() {
        userProfileImage.image = nil
    }
    
    var post: Suggestions? {
        didSet {
            
            userProfileImage.image = nil

            
            if let userUploaderPost = post!.userUploader {
                let ref = FIRDatabase.database().reference().child("users").child(userUploaderPost)
                ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                    
                    if let dictionary = snapshot.value as? [String: AnyObject] {
                        let userName = dictionary["name"] as? String
                        
                        let postText = self.post?.suggestionText
                        let postLikeCount = self.post?.voteCount
                        let postNumberOfComments = self.post?.numberOfComments
                        let snapShotValueOfKey = self.post?.referenceToItself
                        
                        let likeVote = postLikeCount?.stringValue
                        let commentVote = postNumberOfComments?.stringValue
                        
                        self.numberOfPostLikes?.text = likeVote!
                        self.numberOfComments?.text = commentVote!
                        self.postInformation?.text = postText!
                        
                        
                        self.postIdentifier?.text = snapShotValueOfKey
                        
                        
                        
                        if let seconds = self.post?.date?.doubleValue {
                            
                            let date = NSDate(timeIntervalSince1970: NSTimeInterval(seconds))
                            
                            
                            let betterDate = self.timeAgoSinceDate(date, numericDates: true)
                            
                            if userName == nil {
                                self.nameDateField?.text = "\(betterDate)•Unknown"
                            }
                            
                            self.nameDateField?.text = "\(betterDate)•\(userName!)"
                            
                        }
                        
                        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
                            self.userProfileImage?.loadImageUsingCacheWithUrlString(profileImageUrl)
                        } else {
                            self.userProfileImage.image = UIImage(named: "1")
                        }
                        
                    }
                    
                    }, withCancelBlock: nil)
            }
            
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year)
        } else if (components.year >= 1){
            if (numericDates){
                return NSLocalizedString("1 year ago", comment: "")
            } else {
                return NSLocalizedString("Last year", comment: "")
            }
        } else if (components.month >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month)
        } else if (components.month >= 1){
            if (numericDates){
                return NSLocalizedString("1 month ago", comment: "")
            } else {
                return NSLocalizedString("Last month", comment: "")
            }
        } else if (components.weekOfYear >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear)
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return NSLocalizedString("1 week ago", comment: "")
            } else {
                return NSLocalizedString("Last week", comment: "")
            }
        } else if (components.day >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day)
        } else if (components.day >= 1){
            if (numericDates){
                return NSLocalizedString("1 day ago", comment: "")
            } else {
                return NSLocalizedString("Yesterday", comment: "")
            }
        } else if (components.hour >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour)
        } else if (components.hour >= 1){
            if (numericDates){
                return NSLocalizedString("1 hours ago", comment: "")
            } else {
                return NSLocalizedString("An hour ago", comment: "")
            }
        } else if (components.minute >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute)
        } else if (components.minute >= 1){
            if (numericDates){
                return NSLocalizedString("1 minute ago", comment: "")
            } else {
                return NSLocalizedString("A minute ago", comment: "")
            }
        } else if (components.second >= 3) {
            return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second)
        } else {
            return NSLocalizedString("Just now", comment: "")
        }
    }
    
}

class commentCellClass: UITableViewCell {
    
    @IBOutlet weak var postInfo: UILabel!
    @IBOutlet weak var nameDateField: UILabel!
    @IBOutlet weak var userProifleImage: AnimatableImageView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var postIdentifier: UILabel!
    
    
    override func prepareForReuse() {
        userProifleImage.image = nil
    }
    
    var post: Suggestions_Comments? {
        didSet {
            
            userProifleImage.image = nil
            self.postInfo?.sizeToFit()
            
            if let userUploaderPost = post!.userUploader {
                let ref = FIRDatabase.database().reference().child("users").child(userUploaderPost)
                ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                    
                    if let dictionary = snapshot.value as? [String: AnyObject] {
                        let userName = dictionary["name"] as? String
                        
                        let postText = self.post?.postInformation
                        let postLikeCount = self.post?.voteCount
                        let snapShotValueOfKey = self.post?.referenceToItself
                        
                        let likeVote = postLikeCount?.stringValue
                        
                        self.likeCount?.text = likeVote!
                        self.postInfo?.text = postText!
                        
                        self.postIdentifier?.text = snapShotValueOfKey
                        
                        
                        
                        if let seconds = self.post?.date?.doubleValue {
                            
                            let date = NSDate(timeIntervalSince1970: NSTimeInterval(seconds))
                            
                            
                            let betterDate = self.timeAgoSinceDate(date, numericDates: true)
                            
                            if userName == nil {
                                self.nameDateField?.text = "\(betterDate)•Unknown"
                            }
                            
                            self.nameDateField?.text = "\(betterDate)•\(userName!)"
                            
                        }
                        
                        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
                            self.userProifleImage?.loadImageUsingCacheWithUrlString(profileImageUrl)
                        } else {
                            self.userProifleImage.image = UIImage(named: "1")
                        }
                        
                    }
                    
                    }, withCancelBlock: nil)
            }
            
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year)
        } else if (components.year >= 1){
            if (numericDates){
                return NSLocalizedString("1 year ago", comment: "")
            } else {
                return NSLocalizedString("Last year", comment: "")
            }
        } else if (components.month >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month)
        } else if (components.month >= 1){
            if (numericDates){
                return NSLocalizedString("1 month ago", comment: "")
            } else {
                return NSLocalizedString("Last month", comment: "")
            }
        } else if (components.weekOfYear >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear)
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return NSLocalizedString("1 week ago", comment: "")
            } else {
                return NSLocalizedString("Last week", comment: "")
            }
        } else if (components.day >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day)
        } else if (components.day >= 1){
            if (numericDates){
                return NSLocalizedString("1 day ago", comment: "")
            } else {
                return NSLocalizedString("Yesterday", comment: "")
            }
        } else if (components.hour >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour)
        } else if (components.hour >= 1){
            if (numericDates){
                return NSLocalizedString("1 hours ago", comment: "")
            } else {
                return NSLocalizedString("An hour ago", comment: "")
            }
        } else if (components.minute >= 2) {
            return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute)
        } else if (components.minute >= 1){
            if (numericDates){
                return NSLocalizedString("1 minute ago", comment: "")
            } else {
                return NSLocalizedString("A minute ago", comment: "")
            }
        } else if (components.second >= 3) {
            return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second)
        } else {
            return NSLocalizedString("Just now", comment: "")
        }
    }
    
}

*/
