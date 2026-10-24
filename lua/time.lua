local json = require("json")
local http = require("simplehttp")

local function translator(input, seg)
   if (input == "``t") then
      yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 時間"))
      yield(Candidate("time", seg.start, seg._end, os.date("%H時%M分%S秒"), " 時間"))
   end
   if (input == "``w") then
      api_url = "http://api.openweathermap.org/data/2.5/weather?"
      -- http://openweathermap.org/help/city_list.txt , http://openweathermap.org/find
      cityid = "1675151"
      -- metric or imperial
      cf = "metric"
      -- measure is °C if metric and °F if imperial
      measure = '°C'
      lang = "zh_TW"
      -- Unicode weather symbols to use
      icons = {
      ["01"] = "☀",
      ["02"] = "🌤",
      ["03"] = "🌥",
      ["04"] = "☁",
      ["09"] = "🌧",
      ["10"] = "🌦",
      ["11"] = "🌩",
      ["13"] = "🌨",
      ["50"] = "🌫",
      }
      -- get an open weather map api key: http://openweathermap.org/appid
      apikey = "da7cc1c1518145219d94c802ff8afbfc"
      weather = http.request(("%sid=%s&lang=%s&units=%s&APPID=%s"):format(api_url, cityid, lang, cf, apikey))
      response = json.decode(weather)
      temp = response.main.temp
      humidity = response.main.humidity
      conditions = response.weather[1].description
      icon_num = response.weather[1].icon:sub(1, 2)
      icon = icons[icon_num]

      yield(Candidate("weather", seg.start, seg._end, icon .. conditions, "天氣"))
      yield(Candidate("weather", seg.start, seg._end, temp .. measure, "溫度"))
      yield(Candidate("weather", seg.start, seg._end, humidity .. "%", "濕度"))
   end
end

return translator
