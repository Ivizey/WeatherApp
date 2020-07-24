# Weather application
![](https://img.shields.io/badge/Swift-5-orange)
![](https://img.shields.io/badge/RxSwift-5.1.1-blueviolet)
![](https://img.shields.io/badge/Alamofire-4.9.1-orange)
![](https://img.shields.io/badge/Version-1.0-blue)

A single application that returns data from [Weatherstack](https://weatherstack.com) and parses the JSON into viewable results. 

<p align="center">
    <img src="launch.png" width="200">
    <img src="no_data.png" width="200">
    <img src="main.png" width="200">
    <img src="search.png" width="200">
</p>

## Getting Started

<p align="center">
    <img src="https://weatherstack.com/site_images/weatherstack_logo_footer.png">
</p>
The first step to using the API is to authenticate with your weatherstack account's unique API access key, which can be found in your account dashboard after registration. To authenticate with the API, simply use the base URL below and pass your API access key to the API's access_key parameter. ([Details](https://weatherstack.com/documentation))

# Installation
1. Install Cocoapods: sudo gem install cocoapods
2. Update pods in folder: pod update
3. Install [RxSwift & RxCocoa](https://github.com/ReactiveX/RxSwift#installation)
4. Install [Alamofire](https://github.com/Alamofire/Alamofire#installation)
5. Build project from Xcode.

