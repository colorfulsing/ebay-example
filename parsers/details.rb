raise "This is an error"

# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

# get the seller username
seller = nokogiri.at_css('.si-inner .mbg-nw')&.text

# get the seller's feedback 
feedback = nokogiri.at_css('.si-inner #si-fb')&.text

# save it into outputs
outputs << {
    _collection: 'products',
    title: page['vars']['title'],
    price: page['vars']['price'],
    seller: seller,
    feedback: feedback,
    test_value: 123,
    test_value_b:345
}

# test dup output
outputs << {
    _collection: 'dedup_should_be_BBB',
    _id: '111aaa',
    value: 'AAA'
}
outputs << {
    _collection: 'dedup_good',
    _id: '111aaa',
    value: 'CCC'
}
outputs << {
    _collection: 'dedup_should_be_BBB',
    _id: '111aaa',
    value: 'BBB'
}
