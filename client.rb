require 'rubygems'
require 'bundler'

require 'net/http'
require 'json'

Bundler.require

CHANNEL = 'channel'.freeze
ENDPOINT = 'slack-api'.freeze

p ENDPOINT
uri = URI(ENDPOINT)
req = Net::HTTP::Post.new(uri)
req.content_type = 'application/json'
req.body = {
  "text": "五倍溫馨小提醒",
  "attachments": [
    {
      "title": "打卡狀況",
      "fields": [
        {
          "title": "已打卡人數",
          "value": "1",
          "short": true
        },
        {
          "title": "未打卡人數",
          "value": "3",
          "short": true
        }
      ],
      "author_name": "Clockin",
      "author_icon": "http://a.slack-edge.com/7f18/img/api/homepage_custom_integrations-2x.png"
    }
  ]
}

ap req.body

res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
end

ap (res.body).to_json
