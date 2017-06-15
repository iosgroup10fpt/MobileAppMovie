//
//  getinforUser.swift
//  MovieApp-master
//
//  Created by miceli on 6/15/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import Foundation
import Firebase

class User {
    static func getUser(completionHandler: @escaping (_ userInfor: [UserInfo]?, _ error: Error?) -> Void){
        var listMovie = [UserInfo]()
        var ref: DatabaseReference!
        ref = Database.database().reference().child("user").child("NowPlaying")
        ref.observe(.childAdded, with: { (snapshot) in
            var today = [Schedule]()
            var tomorrow = [Schedule]()
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let movie = Movie(json: dictionary)
                for child in snapshot.childSnapshot(forPath: "Today").children
                {
                    today.append(Schedule(hour: (child as! DataSnapshot).key, seat: (child as! DataSnapshot).value as! String))
                }
                for child in snapshot.childSnapshot(forPath: "Tomorrow").children
                {
                    tomorrow.append(Schedule(hour: (child as! DataSnapshot).key, seat: (child as! DataSnapshot).value as! String))
                }
                movie.today=today
                movie.tomorrow=tomorrow
                listMovie.append(movie)
                completionHandler(listMovie, nil)
            }
            
        }, withCancel: nil)
        
    }

}
