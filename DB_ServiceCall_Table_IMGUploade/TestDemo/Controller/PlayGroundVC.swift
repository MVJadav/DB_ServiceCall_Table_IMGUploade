//
//  PlayGroundVC.swift
//  TestDemo
//
//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

import UIKit

import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SDWebImage

class PlayGroundVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    
    var profileImageData                    : NSData? = nil
    
    var objResponse                         : [Response] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

//MARK: - IBAction Methods
extension PlayGroundVC {
    
    @IBAction func tabOnImage(_ sender: AnyObject) {
        self.openGallary()
    }
    
    @IBAction func clickOnTableView(_ sender: Any) {
        let objMyTableVC                    = MyTableVC(nibName: "MyTableVC", bundle: nil)
        self.navigationController?.pushViewController(objMyTableVC, animated: true)
    }
    
    @IBAction func clickOnUploadeImg(_ sender: Any) {
        
        upload(multipartFormData: { (multipartFormData) in
            
            var imageData: [Data] = []
            
            let imageData1 = UIImageJPEGRepresentation(self.imgProfile.image!, 1.0)!
            imageData.append(imageData1)
            
            var parameter : NSDictionary = NSDictionary()
            parameter = ["UserID":"78"
                ,"Token":"7e513f04-66ba-400f-9343-72ea1fa449db"
                ,"ProductImageID":"0"
                ,"Key":"SiteAdminAppkey"] as [String:String] as NSDictionary
            
            multipartFormData.append(imageData1 as Data, withName: "photo_path", fileName: "uploaded_file.jpeg", mimeType: "image/jpeg")
            
            for (key, value) in parameter {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String )
            }
            
            //  print("mutlipart 2st \(multipartFormData)")
        }, to:ServiceUrl.UploadProductImage)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    //                            if let view = uiviewController as? RegistrationVC {
                    //                                view.imgProgress.isHidden = false
                    //                                view.imgProgress.setProgress(Float(Progress.fractionCompleted), animated: true)
                    //                            }
                    
                })
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                    
                    //                            if let view = uiviewController as? RegistrationVC {
                    //                                view.imgProfile.alpha = 1
                    //                                view.imgProgress.isHidden = true
                    //                                view.imgProgress.progress = 0.0
                    //                            }
                    
                    if(response.result.isSuccess){
                        
                        let datastring = NSString(data:response.data!, encoding:String.Encoding.utf8.rawValue) as String?
                        
                        let serviceResponse = Mapper<ServiceResponseArray<ProductImageModel>>().map(JSONString: datastring!)
                        self.setImage(strURL: (serviceResponse?.Data?[0].FullImagePath)!)
                        
                    }
                }
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
        }
    }
    
    @IBAction func clickOnSaveData(_ sender: Any) {
        /*
         {
         "Slug": "mytesting",
         "Key": "SiteAppkey",
         "Token": "",
         "Data": {
         "IsSubscribeToFcmTopic": "false",
         "Platform": "I",
         "DeviceId": "dMxO5Ol2OJo:APA91bGhLO5iXXNkKGFVawjbuTayJg-xkgM16ffm5er_URQE80uIeiZwhmQaysTpEy9k43rScLm1l4dTddvaaIoIemr4c9YCIijrexE4H5PWtLGk_vikBYYB2oV713YUnKPIhrhbl2Vv"
         }
         }
         */
        /*
         func Enquiry (enquiryModel : EnquiryPostModel<SearchParams>,IsLoader:Bool? = true, viewController:UIViewController? = nil, ServiceCallBack: @escaping (_ response: ServiceResponse<EnquiryModel<Items>>?, _ IsSuccess: Bool?)-> Void! ) {
            let serviceRequest  = ServiceRequest<SplashPostModel>()
            serviceRequest.Data = enquiryModel
            let JSONString      = Mapper().toJSON(serviceRequest)
            // JSONString will be passed as Parameters
         }
         */
        
        
        let parameters: Parameters = ["Slug": "mitun",
                                      "Key": "SiteAppkey",
                                      "Token": "",
                                      "Data": [
                                        "IsSubscribeToFcmTopic": "false",
                                        "Platform": "I",
                                        "DeviceId": ""]]
        request(ServiceUrl.Splash, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(response)
            if response.result.isSuccess == true {
                
                let datastring = NSString(data:response.data!, encoding:String.Encoding.utf8.rawValue) as String?
                //get data from weservice
                let serviceResponse = Mapper<ServiceResponse<SplashGetModel<FirmAndSiteDetail<OwnerNamePhoneNumberList>,SiteImages,SiteLabels,Categories<SubCategories>,FontDetails,SellDetails,StateList,SiteColors>>>().map(JSONString: datastring!)
                print(serviceResponse!)
                
                if serviceResponse?.IsSuccess == true {
                    // insert data into database
                    DBHelper.InsertServiceResponse(strQuery: DBQuery().inserData(strValue: (datastring!)))
                    //get data from database
                    self.getData()
                }
            } else {
                print(response.result.error?.localizedDescription as Any)
            }
        }
    }
    
    func getData(){
        let query = DBQuery().getGoalType()
        let JSONString = DBHelper.getDataWithModel(strQuery: query, key: CustomModelName.Data)
        if let response = Mapper<ServiceResponseArray<Response>>().map(JSONString: JSONString) {
            if let objResponse = response.Data {
                self.objResponse = objResponse
            }
        }
        
        if self.objResponse.count > 0  {
        //            self.arrayGoalTypes.removeAll()
        //            for i in 0..<objGoalType.count {
        //                self.arrayGoalTypes.append((self.objGoalType[i].GoalTypeName)!)
        //            }
        }
    }
    
}

//MARK: imagePicker Methods
extension PlayGroundVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imageTapped() {
        
        //dismissKeyboard()
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive)
        {
            UIAlertAction in
        }
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert:UIAlertController=UIAlertController(title: "Oops No Camera !", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                self.openGallary()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive)
            {
                UIAlertAction in
            }
            // Add the actions
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
//        indImgLoader.isHidden = false
//        indImgLoader.startAnimating()
        
        picker .dismiss(animated: true, completion: nil)
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imgProfile.image = imagePicked
//            indImgLoader.stopAnimating()
//            indImgLoader.isHidden = true
            
            /*
             imageName = self.getImageName()
             let fileManager = FileManager.default
             let paths1 = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
             if !fileManager.fileExists(atPath: paths1){
             try! fileManager.createDirectory(atPath: paths1, withIntermediateDirectories: true, attributes: nil)
             }else{
             print("Already dictionary created.")
             }
             
             let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory/"+imageName)
             
             let imageData = UIImageJPEGRepresentation(imagePicked, 0.5) as NSData?
             fileManager.createFile(atPath: paths as String, contents: imageData as Data?, attributes: nil)
             self.setBorder = true;
             self.imgContact.image = nil
             self.imgContact.image = imagePicked
             self.profileImageData = UIImageJPEGRepresentation(imagePicked, 1) as NSData?
             */
            
        }
    }
    
    func getImageName()-> String{
        let timestamp = NSDate().timeIntervalSince1970
        return  String(format: "%.0f", timestamp)+self.randomString(length: 6)+".jpg"
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        if(profileImageData==nil){
            //imgProfile.image=UIImage(named:"ic_user")
        }else
        {
            imgProfile.image=UIImage(data:profileImageData! as Data,scale:1.0)
        }
        picker .dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Other Methods
extension PlayGroundVC {
    
    func setImage(strURL:String){
        imgProfile.setIndicatorStyle(.white)
        imgProfile.setShowActivityIndicator(true)
        imgProfile.setIndicatorStyle(.white)
        imgProfile.setShowActivityIndicator(true)
        imgProfile.sd_setImage(with: URL(string: (strURL)), placeholderImage: UIImage(named: "ic_Placeholder_Post"))
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
}


