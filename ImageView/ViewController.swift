//
//  ViewController.swift
//  ImageView
//
//  Created by Johnny Uhm on 2020/02/16.
//  Copyright © 2020 Jamong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom: Bool = false    // 확대 여부
    var imgOn: UIImage?         // On 상태 이미지 변수
    var imgOff: UIImage?        // Off 상태 이미지 변수
    

    @IBOutlet var imgView: UIImageView!     // 이미지 뷰 객체
    @IBOutlet var btnResize: UIButton!      // 확대/축소 버튼 객체
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "on.png")        // On 이미지 파일 할당
        imgOff = UIImage(named: "off.png")      // Off 이미지 파일 할당
        
        imgView.image = imgOn                   // 이미지 뷰 아웃렛 변수에 On 이미지 할당
    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0        // (상수) 이미지를 확대할 배율값
        var newWidth: CGFloat,
            newHeight: CGFloat          // 이미지 확대/축소 시 변하는 이미지의 가로, 세로 길이를 저장할 변수
        
        if (isZoom) {
            // 축소기능 - 이미지 프레임의 가로, 세로 크기에 scale 값을 나눈다
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            
            // 버튼의 텍스트 값을 확대로 변경
            btnResize.setTitle("확대", for: .normal)
        } else {
            // 확대기능 - 이미지 프레임의 가로, 세로 크기에 scale 값을 곱한다
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
            // 버튼의 텍스트 값을 축소로 변경
            btnResize.setTitle("축소", for: .normal)
        }
        // CGSize 메소드를 사용해 이미지 뷰의 프레임 크기 변경
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if (sender.isOn) {
            imgView.image = imgOn       // On 스위치면 이미지 뷰 객체에 On 이미지 할당
        } else {
            imgView.image = imgOff      // Off 스위치면 이미지 뷰 객체에 Off 이미지 할당
        }
    }
}

