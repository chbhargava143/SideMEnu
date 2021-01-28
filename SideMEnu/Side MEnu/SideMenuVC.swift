//
//  SideMenuVC.swift
//  Retail App
//
//  Created by SRINIVASULU on 27/03/20.
//  Copyright © 2020 SRINIVASULU. All rights reserved.
//

import UIKit
protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}
class SideMenuVC: UIViewController {

     @IBOutlet var btnCloseMenuOverlay : UIButton!
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    @IBOutlet weak var table_SideMenu: UITableView!
    let arr_MenuItems = ["Home","Sales Executive","Supply Chain","OTIF Summary","Daily Sales","Exceptions","Search Item","Maps","BarCode","At Store","LogOut"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nibfile()

        // Do any additional setup after loading the view.
    }
    func nibfile(){
        let nib1 = UINib(nibName: "SideMenuCell", bundle: nil)
        table_SideMenu.register(nib1, forCellReuseIdentifier: "SideMenuCell")
           
    }

    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
           print(button.tag)
        btnMenu.tag = 0
           
           if (self.delegate != nil) {
               var index = Int32(button.tag)
               if(button == self.btnCloseMenuOverlay){
                   index = -1
               }
               delegate?.slideMenuItemSelectedAtIndex(index)
           }
           
           UIView.animate(withDuration: 0.3, animations: { () -> Void in
               self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
               self.view.layoutIfNeeded()
               self.view.backgroundColor = UIColor.clear
           }, completion: { (finished) -> Void in
               self.view.removeFromSuperview()
               self.removeFromParent()
           })
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: table View
extension SideMenuVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr_MenuItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SideMenuCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath)as! SideMenuCell
        cell.lbl_Name.text = arr_MenuItems[indexPath.row]
         //cell.imgView.image = UIImage(named: imgIcons[indexPath.row])
        //td_logo
       // cell.imgView_Logo.image = UIImage(named: "RetailLink_Logo")
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        cell.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.contentView.layer.shadowOpacity = 2
        cell.contentView.layer.shadowOffset = CGSize.zero
        cell.contentView.layer.shadowRadius = 15
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let btn = UIButton(type: UIButton.ButtonType.custom)
           btn.tag = indexPath.row
           self.onCloseMenuClick(btn)
         //  let dictva = arr_listReportsUpdate.object(at: indexPath.row) as! NSDictionary
           let searchitem = self.arr_MenuItems[indexPath.row]
           if searchitem == "Home"{
               navHomeVC()
           }else if searchitem == "Sales Executive"{
               navSaleExcutive()
           }else if searchitem == "Supply Chain"{
               navSupplyChain()
           }else if searchitem == "OTIF Summary"{
              // navOTIFSummaryVC()
           }else if searchitem == "Daily Sales"{
              // navDailyKPIVC()
           }else  if searchitem == "Exceptions"{
              // navADExceptionVC()
           }else  if searchitem == "Search Item"{
              // navADSearchListVC()
           }else if searchitem == "BarCode"{
              // navADBarCodeVC()
           }else if searchitem == "LogOut"{
             //  ADLogOutVC()
           }else if searchitem == "Maps"{
              // navADMapsVC()
           }else if searchitem == "At Store"{
              // navAtStore()
//               if self.arr_listReportsUpdate.count == 3{
//                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                   let homeAtStoreVC = storyboard.instantiateViewController(withIdentifier: "HomeAtStoreVC") as! HomeAtStoreVC
//                   self.navigationController?.pushViewController(homeAtStoreVC, animated: true)
//               }else{
//               let storyboard = UIStoryboard(name: "Main", bundle: nil)
//               let CompanySearchItemVC = storyboard.instantiateViewController(withIdentifier: "ADSearchStoreVC") as! ADSearchStoreVC
//               self.navigationController?.pushViewController(CompanySearchItemVC, animated: true)
//               }
           }
       }
    //MARK: Going to VC
       func navHomeVC(){
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let CompanySearchItemVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
           self.navigationController?.pushViewController(CompanySearchItemVC, animated: true)
       }
       func navSaleExcutive(){
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let SalesExecutiveVC = storyboard.instantiateViewController(withIdentifier: "SalesExecutive") as! SalesExecutive
           self.navigationController?.pushViewController(SalesExecutiveVC, animated: true)
       }
    func navSupplyChain(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SupplyChainVC = storyboard.instantiateViewController(withIdentifier: "SupplyExecutive") as! SupplyExecutive
        self.navigationController?.pushViewController(SupplyChainVC, animated: true)
    }
}
