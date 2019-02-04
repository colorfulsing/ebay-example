
outputs << {
    _collection: 'seeds',
    _id:"iphone",
    search: "iphone"
}

save_outputs(outputs)
puts "saved_output"

puts "finding output #{find_output("seeds", {_id: "iphone"})}"

outputs << {
    _gid: "www.ebay.com-f06bd9f00f29e937ef9176ff97daf24a",
    _collection: 'seeds',
    search: "iphone",
    dependent_record: find_output("seeds", {_id: "iphone"}),
}

pages << {
    page_type: 'listings', 
    method: "GET",
    url: "https://www.ebay.com/b/Apple-iPhone/9355/bn_319682" 
}