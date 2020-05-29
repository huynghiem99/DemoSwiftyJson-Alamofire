//
//  Post.swift
//  CloneGatUpSummaryPage
//
//  Created by macOS on 5/28/20.
//  Copyright © 2020 macOS. All rights reserved.
//

import Foundation
import MagicMapper

@objcMembers
class Post: NSObject, Mappable {
    
    var gatUpNewsId:Int = 1
    var title:String = ""
    var descrip:String = ""
    var address:String = ""
    
}
