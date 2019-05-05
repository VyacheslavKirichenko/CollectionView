//
//  ViewController.swift
//  CollectionView
//
//  Created by VyacheslavKrivoi on 5/3/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var categoriesModelArray: [[Model]] = [[Model]](repeating: [Model](), count: 3)
   // var arrSection: [String] = ["Cars","Quadro","Moto"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        generationArrayData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var res: Int
        switch(section) {
        case 0:
            res = categoriesModelArray[0].count  // Number of cell per section(section 0)
            break
        case 1:
            res = categoriesModelArray[1].count
            break
        case 2:
            res = categoriesModelArray[2].count
            break
        default:
            res = 0
            break
        }
        return res
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.gray
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cell.imgImage.image = categoriesModelArray[indexPath.section][indexPath.item].image
            cell.lblImageName.text = categoriesModelArray[indexPath.section][indexPath.item].name
            var color:UIColor
            switch indexPath.section {
            case 0:
                color = UIColor.orange
                break
            case 1:
                color = UIColor.blue
            case 2:
                color = UIColor.yellow
            default:
                color = UIColor.white
            }
            cell.backgroundColor = color
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        desVC.image = categoriesModelArray[indexPath.section][indexPath.item].image
        desVC.name = categoriesModelArray[indexPath.section][indexPath.item].name
        desVC.desc = categoriesModelArray[indexPath.section][indexPath.item].description
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return categoriesModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as?
            SectionHeaderView {
          //  sectionHeader.categoryTitle = arrSection[indexPath.section]
          sectionHeader.categoryTitle = categoriesModelArray[indexPath.section][indexPath.item].categoryName
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    
    func generationArrayData() {
        let imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10"),UIImage(named: "11")]
        let nameArray = ["Niva","LandCruiser 80","Hilux","FJ Cruiser","Wrangler","BRP Outlander","Yamaha Grizzly",
                         "BRP Maveric","Suzuki Hayabusa", "Honda AfricaTwin","Honda GoldWing"]
        let categoryIDArray = [0,0,0,0,0,1,1,1,2,2,2]
        let categoryNameArray = ["Cars","Cars","Cars","Cars","Cars","Atv","Atv","Atv","Moto","Moto","Moto"]
        let descriptionArray = ["ВАЗ-2121 (21213/21214) — легковой автомобиль повышенной проходимости (внедорожник) малого класса. Кузов несущий, трёхдверный — типа хэтчбэк, пятидверный — универсал. Трансмиссия с постоянным полным приводом, механической четырёхступенчатой коробкой передач (начиная с 21213 — пятиступенчатой), двухступенчатой раздаточной коробкой и блокируемым межосевым дифференциалом",
                                "Toyota Land Cruiser 80 (1990-1997) дебютировал в октябре 1989 года. Моторы представлены рядными шестицилиндровыми агрегатами: бензиновым, дизельным и турбодизелем. Безнаддувный атмосферный дизель 1HZ объёмом 4.2 л (некоторые люди, эксплуатирующие этот двигатель, считают его ресурс безграничным)",
                                "Машина за счёт своей простоты (рамная конструкция, продольное расположение двигателя, подключаемый полный привод), функциональности и ремонтопригодности заслужила огромную популярность по всему миру. На этой машине ездит чемпион мира по даунхиллу Джи Афертон",
                                "Toyota FJ Cruiser — компактный внедорожник в стиле ретро. Концепт был представлен на Чикагском автосалоне в феврале 2003 года[1], а серийная модель в 2005 году на последующем Североамериканском международном автосалоне.",
                                "Jeep Wrangler — автомобиль повышенной проходимости, производимый американской компанией Chrysler (отделение Jeep). Является преемником автомобилей семейства Jeep CJ. Выпускается с 1987 года. За время производства сменилось несколько поколений Wrangler.",
                                "У 1973 році під керівництвом американського інженера на ім’я Гар Робінсон і колишнім чемпіоном світу по мотокросу Джефом Смітом, працюючих з командою гонщиків з Каліфорнії, почали робити мотокросові мотоцикли і ендуро-велосипеди Can – Am з використанням двигунів, що надаються австрійською компанією Rotax, іншою дочірньою компанією Bombardier.",
                                "The Yamaha Grizzly is a large utility all-terrain vehicle manufactured by the Yamaha Motor Company. It has a 595cc four-stroke engine from the XT600. Yamaha replaced the Grizzly 600 with the new Grizzly 660 using a larger engine that is 660cc derived from the Raptor 660 with a five-valve cylinder head.","The Can-Am Maverick X3 is an off-road UTV (utility terrain vehicle).",
                                " по-японски означает «сапсан». Название этой птицы часто служит метафорой, обозначающей скорость, так как сапсан — самая быстрая из птиц: во время охоты он резко пикирует на жертв, развивая скорость 290—325 км/ч. В частности, выбор названия был обусловлен тем, что сапсан обыкновенно охотится на дроздов, и эта аллюзия отражала намерение производителей Hayabusa отобрать звание самого быстрого серийного мотоцикла в мире у Honda CBR1100XX Super Blackbird  Скорость Hayabusa превзошла Super Blackbird на 10 миль/ч (16 км/ч).",
                                "The Honda Africa Twin is a dual-sport motorcycle made by Honda in three versions, 1988 to 1989 as the 650 cc (40 cu in) V-twin XRV650,[1] then from 1990 to 2003 as the 750 cc (46 cu in) V-twin XRV750T, and then from 2016 to present as the 1,000 cc (61 cu in) parallel-twin CRF1000L.",
                                "Honda Gold Wing (або Goldwing) — важкий туристичний мотоцикл з 4-х або 6-цилідровим опозитним двигуном водяного охолодження і карданним валом японської компанії Honda. Вперше модель Honda GL1000 була представлена на виставці IFMA в Кьольні в жовтні 1974 року. Згодом став найпопулярнішою моделлю в Північній Америці, Західній Європі та Австралії, а також в  Японії. Загальний обсяг продажів склав більш ніж 640 000 од., більшість з них на ринку США."]
        
        
        for i in 0...categoriesModelArray.count-1 {
            for j in 0...imageArray.count-1 {
                if (i==categoryIDArray[j]) {
                    categoriesModelArray[i].append(Model(name: nameArray[j], image: imageArray[j]!, categoryID: categoryIDArray[j], description: descriptionArray[j], categoryName: categoryNameArray[j]))
                }
            }
        }
    }

}


