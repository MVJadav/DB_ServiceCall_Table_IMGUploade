//
//  DbInsertVC.swift
//  TestDemo
//
//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

import UIKit
import ObjectMapper

class DbInsertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DbInsertVC {
    
    func getData(){
        let query = DBQuery().getGoalType()
        let JSONString = DBHelper.getDataWithModel(strQuery: query, key: CustomModelName.Data)
        if let response = Mapper<ServiceResponse<SplashGetModel<FirmAndSiteDetail<OwnerNamePhoneNumberList>,SiteImages,SiteLabels,Categories<SubCategories>,FontDetails,SellDetails,StateList,SiteColors>>>().map(JSONString: JSONString) {
            if let goalType = response.Data {
                //objGoalType = goalType
            }
        }
        
//        if objGoalType.count > 0  {
//            self.arrayGoalTypes.removeAll()
//            for i in 0..<objGoalType.count {
//                self.arrayGoalTypes.append((self.objGoalType[i].GoalTypeName)!)
//            }
//        }
    }
}


