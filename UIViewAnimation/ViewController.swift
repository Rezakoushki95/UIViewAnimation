//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by Reza Koushki on 02/09/2022.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var moveButton: UIButton!
	@IBOutlet weak var alphaButton: UIButton!
	@IBOutlet weak var pulseButton: UIButton!
	@IBOutlet weak var colorChangeButton: UIButton!
	
	var colorIndex = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		let deviceWidth = view.frame.width
		imageView.frame.origin.x = deviceWidth
		alphaButton.frame.origin.x = deviceWidth
		pulseButton.frame.origin.x = deviceWidth
		colorChangeButton.frame.origin.x = deviceWidth
	}

	@IBAction func movePressed(_ sender: UIButton) {
		
		UIView.animate(withDuration: 0.5, animations: { self.imageView.center.x = self.view.center.x })
		
		UIView.animate(withDuration: 0.5, animations: { self.alphaButton.center.x = self.view.center.x })

		UIView.animate(withDuration: 0.5, animations: { self.pulseButton.center.x = self.view.center.x })

		UIView.animate(withDuration: 0.5, animations: { self.colorChangeButton.center.x = self.view.center.x })


		
//		UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveLinear, .repeat], animations: { self.imageView.center.x = self.view.center.x })
//
//		UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseIn, .repeat], animations: { self.alphaButton.center.x = self.view.center.x })
//
//		UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut, .repeat, .autoreverse], animations: { self.pulseButton.center.x = self.view.center.x })
//
//		UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: { self.colorChangeButton.center.x = self.view.center.x })
	}
	
	@IBAction func alphaPressed(_ sender: UIButton) {
		UIView.animate(withDuration: 1.0) {
			self.imageView.alpha = (self.imageView.alpha == 1 ? 0.0 : 1.0)
		}
	}
	@IBAction func pulsePressed(_ sender: UIButton) {
		
		let originalFrame = sender.frame
		let widthShrink: CGFloat = 30
		let heightShrink: CGFloat = 10
		let smallerFrame = CGRect(
			x: sender.frame.origin.x + widthShrink,
			y: sender.frame.origin.y + heightShrink,
			width: sender.frame.width - (2 * widthShrink),
			height: sender.frame.height - (2 * heightShrink))
		sender.frame = smallerFrame
		
		UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8.0) {
			sender.frame = originalFrame
		}
		
		let originalImageViewFrame = imageView.frame
		let imageViewWidthShrink: CGFloat = 20
		let imageViewHeightShrink: CGFloat = 20
		let smallerImageViewFrame = CGRect(
			x: imageView.frame.origin.x + imageViewWidthShrink,
			y: imageView.frame.origin.y + imageViewHeightShrink,
			width: imageView.frame.width - (2 * imageViewWidthShrink),
			height: imageView.frame.height - (2 * imageViewHeightShrink))
		imageView.frame = smallerImageViewFrame
		
		UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8.0) {
			self.imageView.frame = originalImageViewFrame
		}
		
	}
	@IBAction func colorChangePressed(_ sender: UIButton) {
		let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .systemIndigo, .purple]
		
		UIView.animate(withDuration: 0.5) {
			self.colorChangeButton.backgroundColor = colors[self.colorIndex]
		}
		

		colorIndex = (colorIndex == colors.count - 1 ? 0 : colorIndex + 1)
	}
}

