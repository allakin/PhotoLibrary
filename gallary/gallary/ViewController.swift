//
//  ViewController.swift
//  gallary
//
//  Created by Павел Анплеенко on 31/07/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
	
	@IBOutlet weak var imageView: UIImageView!
	
	//Создаем переменную и приравниваем ее к классу который управляет фотографиями и видео
	let imagePicker = UIImagePickerController()
	
	//на кнопку вешаем что фотобиблиотека изначально не активна, следом обращаемся к фотобиблиотеки и потображаем действие в view controller
	@IBAction func loadImageButtonTapped(sender: UIButton) {
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .PhotoLibrary
		presentViewController(imagePicker, animated: true, completion: nil)
	}
	
	// сдесь указываем что сами будет выбирать картинку из фото лаборатории
	override func viewDidLoad() {
		super.viewDidLoad()
		imagePicker.delegate = self
	}
	
	// MARK: - UIImagePickerControllerDelegate Methods
	// в функции пишем что условие при котором IBoutlet растягивается по размеру области и приравниваем к imgPicker и отображаем действия во viewControllere
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		if let imgPicker = info[UIImagePickerControllerOriginalImage] as? UIImage {
		imageView.contentMode = .ScaleAspectFit
		imageView.image = imgPicker
		}
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	// Пишем функцию для отображения во viewControllere
	// MARK: - imagePickerControllerDidCancel Methods
	func imagePickerControllerDidCancel(imgPicker: UIImagePickerController){
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}