# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

# get the seller username
seller = nokogiri.at_css('.si-inner .mbg-nw') && nokogiri.at_css('.si-inner .mbg-nw').text

# get the seller's feedback 
feedback = nokogiri.at_css('.si-inner #si-fb') && nokogiri.at_css('.si-inner #si-fb').text

# save it into outputs
outputs << {
    _collection: 'products',
    title: page['vars']['title'],
    price: page['vars']['price'],
    seller: seller,
    feedback: feedback
}