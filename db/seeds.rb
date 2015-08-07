# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Product.create(title: 'All of Teis\' Stuff',
description: '<p>Everything</p>',
image_url: 'Teis.jpg',
price: '1.00'
)

Product.create(title: 'New Google TV Remote',
description: %{<p>
  Just what you need
  </p>},
image_url: 'remote.jpg',
price: '100000.00'
)


