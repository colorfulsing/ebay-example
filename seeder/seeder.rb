pages << {
    page_type: 'listings',
    method: "GET",
    url: "https://www.ebay.com/b/Apple-iPhone/9355/bn_319682",
    freshness: Time.now.utc.strftime('%FT%TZ'),
    #fetch_type: 'browser'
}

pages << {
    page_type: 'browser_pages',
    method: "GET",
    url: "https://fetchtest.datahen.com/cat",
    freshness: Time.now.utc.strftime('%FT%TZ'),
    fetch_type: 'browser',
    driver: {
      pre_code: 'codeVars["sup"] = "Hello!";',
      code: File.read('./seeder/browser_test.js')
    }
}

# testing emptyu collections
outputs << {
  _id: 'empty_collection',
  value: 'DDD'
}
outputs << {
  _id: 'blank_collection',
  value: 'EEE'
}

# these should override the previous ones
outputs << {
  _id: 'empty_collection',
  value: "GOOD empty"
}
outputs << {
  _id: 'blank_collection',
  value: "GOOD blank"
}
