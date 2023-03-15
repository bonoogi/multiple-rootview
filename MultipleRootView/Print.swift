//
//  Print.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import Foundation

func printDetail(
  message: String,
  file: String = #fileID,
  function: String = #function,
  line: Int = #line
) {
  var _file: String
  if let fileName = file.split(separator: "/").last {
    _file = String(fileName)
  } else {
    _file = file
  }
  print("PRINT-DETAIL::\(_file)::\(function)::\(line)\(message.isEmpty ? "" : " - \(message)")")
}
