//
//  SplashModel.swift
//  Snaptym
//
//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

import UIKit
import ObjectMapper

class ServiceRequest<T: Mappable>: Mappable {
    
    var Key: String?
    var Token: String?
    var Slug: String?
    var Data : T?
    
    init() {
        
//        if (UserDefaults.standard.object(forKey: UserDefaultsKey.Token) != nil && ((Preference.GetString(key : UserDefaultsKey.Token)!.isEmpty) == false)) {
        
            Token = "1fb5fe9a-9a6d-4e4a-bb81-0141525cebfd"//Preference.GetString(key : UserDefaultsKey.Token)!
            
//        }else{
//            Token=""
//        }
        //Key = AppConstant.APIKey
        //Slug = AppConstant.AppSiteSlug
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Key         <- map["Key"]
        Token      <- map["Token"]
        Slug      <- map["Slug"]
        Data       <- map["Data"]
        
    }
}

class ServiceResponse<T: Mappable>: Mappable {
    
    var IsSuccess: Bool?
    var Code: String?
    var Message: String? = ""
    var Data: T?
    
    init?() {
        
    }
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        IsSuccess       <- map["IsSuccess"]
        Code            <- map["Code"]
        Message         <- map["Message"]
        Data            <- map["Data"]
        
    }
}

class ServiceResponseArray<T: Mappable>: Mappable {
    
    var IsSuccess: Bool?
    var Code: String?
    var Message: String?
    var Data: [T]?
    
    init?() {
        
    }
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        IsSuccess    <- map["IsSuccess"]
        Code         <- map["Code"]
        Message      <- map["Message"]
        Data       <- map["Data"]
        
    }
}

class SplashPostModel: Mappable {
    
    var Platform                : String? = ""
    var DeviceId                : String? = ""
    var IsSubscribeToFcmTopic   : String? = ""
    
    required init(){
        
        Platform = "I"
        DeviceId = ""
    }
 
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        Platform                    <- map["Platform"]
        DeviceId                    <- map["DeviceId"]
        IsSubscribeToFcmTopic       <- map["IsSubscribeToFcmTopic"]
    }
    
}

class SplashGetModel <F: Mappable,T: Mappable,B: Mappable,S:Mappable,D: Mappable,P: Mappable, L:Mappable, C:Mappable>: Mappable {
//  class SplashGetModel <F: Mappable,T: Mappable,B: Mappable,S:Mappable>: Mappable {
    
    var FirmAndSiteDetail               : F?
    lazy var SiteImages                 : [T]? = []
    lazy var SiteLabels                 : [B]? = []
    lazy var Categories                 : [S]? = []
    var FontDetails                     : D?
    var SellDetails                     : P?
    lazy var StateList                  : [L]? = []
    lazy var LogoOption                 : CLong? = 0
    lazy var LogoText                   : String? = ""
    lazy var LogoFullImagePath          : String? = ""
    lazy var SplashBackgroundImagePath  : String? = ""
    lazy var PrimaryColor               : String? = "#41b546"
    lazy var SiteColors                 : [C]? = []
    
    required init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        FirmAndSiteDetail           <- map["FirmAndSiteDetail"]
        SiteImages                  <- map["SiteImages"]
        SiteLabels                  <- map["SiteLabels"]
        Categories                  <- map["Categories"]
        FontDetails                 <- map["FontDetails"]
        SellDetails                 <- map["SellDetails"]
        StateList                   <- map["StateList"]
        LogoOption                  <- map["LogoOption"]
        LogoText                    <- map["LogoText"]
        LogoFullImagePath           <- map["LogoFullImagePath"]
        SplashBackgroundImagePath   <- map["SplashBackgroundImagePath"]
        SiteColors                  <- map["SiteColors"]
    }
}

class SiteColors : Mappable {
    
    lazy var ThemeColorName             : String? = ""
    lazy var ColorValue                 : String? = ""
    
    required init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ThemeColorName                             <- map["ThemeColorName"]
        ColorValue                           <- map["ColorValue"]
    }
}

class StateList : Mappable {
    
    lazy var StateId                            : CLong? = 0
    lazy var StateName                          : String? = ""
    
    required init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        StateId                             <- map["StateId"]
        StateName                           <- map["StateName"]
    }
}


class ProductImageModel: Mappable{
    
    lazy var ProductImageID         : Int? = 0
    lazy var SortOrder              : Int? = 0
    lazy var FullImagePath          : String? = ""
    lazy var ImagePath              : String? = ""
    
    required init(){
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        ProductImageID          <- map["ProductImageID"]
        SortOrder               <- map["SortOrder"]
        FullImagePath           <- map["FullImagePath"]
        ImagePath               <- map["ImagePath"]
    }
}
class SellDetails : Mappable {
    
    lazy var SiteID                         : CLong? = 0
    lazy var IsSellingEnable                : Bool? = false
    lazy var IsCODAllowed                   : Bool? = false
    lazy var IsPaytmAllowed                 : Bool? = false
    lazy var IsPaymentGatewayAllowed        : Bool? = false
    lazy var PaytmNumber                    : String? = ""
    lazy var WithinCityCourier              : CLong? = 0
    lazy var WithinStateCourier             : CLong? = 0
    lazy var OutStateCourier                : CLong? = 0
    lazy var StateId                        : CLong? = 0
    lazy var State                          : String? = ""
    lazy var City                           : String? = ""
    lazy var UserID                         : CLong? = 0
    
    required init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        SiteID                          <- map["SiteID"]
        IsSellingEnable                 <- map["IsSellingEnable"]
        IsCODAllowed                    <- map["IsCODAllowed"]
        IsPaytmAllowed                  <- map["IsPaytmAllowed"]
        IsPaymentGatewayAllowed         <- map["IsPaymentGatewayAllowed"]
        PaytmNumber                     <- map["PaytmNumber"]
        WithinCityCourier               <- map["WithinCityCourier"]
        WithinStateCourier              <- map["WithinStateCourier"]
        OutStateCourier                 <- map["OutStateCourier"]
        StateId                         <- map["StateId"]
        State                           <- map["State"]
        City                            <- map["City"]
        UserID                          <- map["UserID"]
    }
}

class FontDetails : Mappable {
    
    lazy var FontID             : CLong? = 0
    lazy var FontName           : String? = ""
    lazy var FontFile           : String? = ""
    lazy var FontImage          : String? = ""
    lazy var FontFileURL        : String? = ""
    lazy var FontImageURL       : String? = ""
    
    
    required init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        FontID              <- map["FontID"]
        FontName            <- map["FontName"]
        FontFile            <- map["FontFile"]
        FontImage           <- map["FontImage"]
        FontFileURL         <- map["FontFileURL"]
        FontImageURL        <- map["FontImageURL"]
    }
}

//MARK: - Firm And Site Detail Model
class FirmAndSiteDetail<T: Mappable>: Mappable {
    
    lazy var FirmName: String?                      = ""
    lazy var Address: String?                       = ""
    lazy var City: String?                          = ""
    lazy var StateName: String?                         = ""
    lazy var PinCode:CLong?                         = 0
    lazy var FirmLogo: String?                      = ""
    lazy var FirmFullDescription: String?           = ""
    lazy var FirmShortDescription : String?         = ""
    lazy var ContactNumberType1: String?            = ""
    lazy var ContactNumberType2: String?            = ""
    lazy var ContactNumber1: String?                = ""
    lazy var ContactNumber2: String?                = ""
    lazy var Email: String?                         = ""
    lazy var Latitude : String?                     = ""
    lazy var Longitude : String?                    = ""
    lazy var OwnerNamePhoneNumberList :[T]?         = []
    lazy var ShopTiming: String?                    = ""
    lazy var PrivacyPolicy : String?                = ""
    lazy var FacebookURL : String?                  = ""
    lazy var GooglePlusURL : String?                = ""
    lazy var LinkedInURL : String?                  = ""
    lazy var PininterstURL : String?                = ""
    lazy var TwitterURL : String?                   = ""
    lazy var Instagram : String?                    = ""
    lazy var IsSubscribeToFcmTopic : String?        = ""
    
    required init(){
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        FirmName                        <- map["FirmName"]
        Address                         <- map["Address"]
        City                            <- map["City"]
        StateName                       <- map["StateName"]
        PinCode                         <- map["PinCode"]
        FirmLogo                        <- map["FirmFullDescription"]
        FirmFullDescription             <- map["FirmFullDescription"]
        FirmShortDescription            <- map["FirmShortDescription"]
        ContactNumberType1              <- map["ContactNumberType1"]
        ContactNumberType2              <- map["ContactNumberType2"]
        ContactNumber1                  <- map["ContactNumber1"]
        ContactNumber2                  <- map["ContactNumber2"]
        Email                           <- map["Email"]
        Latitude                        <- map["Latitude"]
        Longitude                       <- map["Longitude"]
        OwnerNamePhoneNumberList        <- map["OwnerNamePhoneNumberList"]
        ShopTiming                      <- map["ShopTiming"]
        PrivacyPolicy                   <- map["PrivacyPolicy"]
        FacebookURL                     <- map["FacebookURL"]
        GooglePlusURL                   <- map["GooglePlusURL"]
        LinkedInURL                     <- map["LinkedInURL"]
        PininterstURL                   <- map["PininterstURL"]
        TwitterURL                      <- map["TwitterURL"]
        Instagram                       <- map["Instagram"]
        IsSubscribeToFcmTopic           <- map["IsSubscribeToFcmTopic"]
        
    }
    
}

class OwnerNamePhoneNumberList: Mappable
{
    lazy var MobileNumber       : String? = ""
    lazy var OwnerName          : String? = ""
    
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        MobileNumber        <- map["MobileNumber"]
        OwnerName           <- map["OwnerName"]
        
    }
}

//FollowUS
class FollowUSModel: Mappable {
    
    lazy var FollowUsID         : CLong? = 0
    lazy var FollowUsURL        : String? = ""
    lazy var ButtonImageName    : String? = ""
    lazy var Color              : UIColor? = UIColor.darkGray
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        FollowUsID                  <- map["FollowUsID"]
        FollowUsURL                 <- map["FollowUsURL"]
        ButtonImageName             <- map["ButtonImageName"]
        Color                       <- map["Color"]
    }
}

/*
 // Login POST Model
 */
class SiteImages: Mappable
{
    var ThemeImageName      : String? = ""
    var WebImagePath        : String? = ""
    var MobileImageFullPath     : String? = ""
    var ThemeImageGroup     : String? = ""
    
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ThemeImageName      <- map["ThemeImageName"]
        WebImagePath        <- map["WebImagePath"]
        MobileImageFullPath     <- map["MobileImageFullPath"]
        ThemeImageGroup     <- map["ThemeImageGroup"]
        
    }
}

class SiteLabels: Mappable
{
    var ThemeLabelName      : String? = ""
    var LabelValue          : String? = ""
    
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ThemeLabelName      <- map["ThemeLabelName"]
        LabelValue          <- map["LabelValue"]
        
    }
}

class Categories<T: Mappable>: Mappable
{
    lazy var CategoryID                 : CLong? = 0
    lazy var CategoryName               : String? = ""
    lazy var MobileMenuImageFullPath    : String? = ""
    lazy var SubCategories              :[T]? = []
    lazy var bgColor                    : UIColor? = UIColor.white
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        CategoryID                  <- map["CategoryID"]
        CategoryName                <- map["CategoryName"]
        MobileMenuImageFullPath     <- map["MobileMenuImageFullPath"]
        SubCategories               <- map["SubCategories"]
    }
}

class SubCategories: Mappable
{
    lazy var SubCategoryID       : CLong? = 0
    lazy var SubCategoryName     : String? = ""
    lazy var CategoryID          : CLong? = 0
    lazy var CategoryName        : String? = ""
        
    required init(){
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        SubCategoryID       <- map["SubCategoryID"]
        SubCategoryName     <- map["SubCategoryName"]
        CategoryID          <- map["CategoryID"]
        CategoryName        <- map["CategoryName"]
        
    }
}

class ApiError: Mappable
{
    lazy var ErrorCode     : CLong? = 0
    lazy var ErrorMessage   : String? = ""
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ErrorCode       <- map["ErrorCode"]
        ErrorMessage     <- map["ErrorMessage"]
        
    }
}


//Model Name
struct CustomModelName {
    
    //Contact Screen
    static let Data = "Data"
}


class Response: Mappable {
    lazy var ResponseId     : CLong? = 0
    lazy var ResponseData   : String? = ""
    
    required init(){
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ResponseId       <- map["ResponseId"]
        ResponseData     <- map["ResponseData"]
        
    }
}

