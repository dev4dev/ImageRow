//
//  ViewController.swift
//  Example
//
//  Copyright © 2016 Xmartlabs SRL. All rights reserved.
//

import ImageRow
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        form +++ Section()
                <<< ImageRow("avatar") { row in
                    row.title = "Image Row 1"
                    row.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                    row.clearAction = .yes(style: UIAlertActionStyle.destructive)
					row.placeholder = UIImage(named: "cat")
                }.cellSetup({ cell, row in
					cell.height = { 60.0 }
				})
             +++
                 Section()
                <<< ImageRow() {
                    $0.title = "Image Row 2"
                    $0.sourceTypes = .PhotoLibrary
                    $0.clearAction = .no
                }
                .cellUpdate { cell, row in
                    cell.accessoryView?.layer.cornerRadius = 17
                    cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
                }
             +++
                 Section()
                    <<< ImageRow() {
                        $0.title = "Image Row 3"
                        $0.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                        $0.clearAction = .yes(style: .default)
                    }
    }

	@IBAction func onSave(_ sender: UIBarButtonItem) {
		print(form.values())
	}
}
