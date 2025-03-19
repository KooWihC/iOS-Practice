//
//  UIViewController URL.swift
//  BTSApp
//
//  Created by Chiwook Ahn on 3/19/25.
//

import UIKit

extension UIViewController
{
    func urlForDocuments() -> URL
    {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
    }
    
    func urlForFileName(_ filename: String) -> URL
    {
        let url = urlForDocuments()
        let fileURL = url.appendingPathComponent(filename, conformingTo: .propertyList)
        return fileURL
    }
    
    //func urlWithFileName(_ fileNmae: String)
}
