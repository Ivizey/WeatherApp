//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 11/9/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let request: Request
    let location: Location
    let current: Current
}


//    <code>395</code>
//    <description>Moderate or heavy snow in area with thunder</description>
// 
//    <code>392</code>
//    <description>Patchy light snow in area with thunder</description>
//
//    <code>389</code>
//    <description>Moderate or heavy rain in area with thunder</description>
//
//    <code>386</code>
//    <description>Patchy light rain in area with thunder</description>
//
//    <code>377</code>
//    <description>Moderate or heavy showers of ice pellets</description>
//
//    <code>374</code>
//    <description>Light showers of ice pellets</description>
//
//    <code>371</code>
//    <description>Moderate or heavy snow showers</description>
//
//    <code>368</code>
//    <description>Light snow showers</description>
//
//    <code>365</code>
//    <description>Moderate or heavy sleet showers</description>
//
//    <code>362</code>
//    <description>Light sleet showers</description>
//
//    <code>359</code>
//    <description>Torrential rain shower</description>
//
//    <code>356</code>
//    <description>Moderate or heavy rain shower</description>
//
//    <code>353</code>
//    <description>Light rain shower</description>
//
//    <code>350</code>
//    <description>Ice pellets</description>
//
//    <code>338</code>
//    <description>Heavy snow</description>
//
//    <code>335</code>
//    <description>Patchy heavy snow</description>
//
//    <code>332</code>
//    <description>Moderate snow</description>
//
//    <code>329</code>
//    <description>Patchy moderate snow</description>
//
//    <code>326</code>
//    <description>Light snow</description>
//
//    <code>323</code>
//    <description>Patchy light snow</description>
//
//    <code>320</code>
//    <description>Moderate or heavy sleet</description>
//
//    <code>317</code>
//    <description>Light sleet</description>
//
//    <code>314</code>
//    <description>Moderate or Heavy freezing rain</description>
//
//    <code>311</code>
//    <description>Light freezing rain</description>
//
//    <code>308</code>
//    <description>Heavy rain</description>
//
//    <code>305</code>
//    <description>Heavy rain at times</description>
//
//    <code>302</code>
//    <description>Moderate rain</description>
//
//    <code>299</code>
//    <description>Moderate rain at times</description>
//
//    <code>296</code>
//    <description>Light rain</description>
//
//    <code>293</code>
//    <description>Patchy light rain</description>
//
//    <code>284</code>
//    <description>Heavy freezing drizzle</description>
//
//    <code>281</code>
//    <description>Freezing drizzle</description>
//
//    <code>266</code>
//    <description>Light drizzle</description>
//
//    <code>263</code>
//    <description>Patchy light drizzle</description>
//
//    <code>260</code>
//    <description>Freezing fog</description>
//
//    <code>248</code>
//    <description>Fog</description>
//
//    <code>230</code>
//    <description>Blizzard</description>
//
//    <description>Blowing snow</description>
//
//    <code>200</code>
//    <description>Thundery outbreaks in nearby</description>
//
//    <code>185</code>
//    <description>Patchy freezing drizzle nearby</description>
//
//    <code>182</code>
//    <description>Patchy sleet nearby</description>
//
//    <code>179</code>
//    <description>Patchy snow nearby</description>
//
//    <code>176</code>
//    <description>Patchy rain nearby</description>
//
//    <code>143</code>
//    <description>Mist</description>
//
//  <condition>
//    <code>122</code>
//    <description>Overcast</description>
//
//    <code>119</code>
//    <description>Cloudy</description>
//
//    <code>116</code>
//    <description>Partly Cloudy</description>
//
//    <code>113</code>
//    <description>Clear/Sunny</description>

