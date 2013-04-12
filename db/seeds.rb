User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com", password: "password")
User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com", password: "password", display_name: "j3")
User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com", password: "password", display_name: "SkrilleX").uber_up

product1 = Product.create(title: "Bobby", description: "Marcy's triplet brother. He's kind of smelly.", price: 14.19, status: 'active')
product2 = Product.create(title: "Ruby (green)", description: "We <3 it.", price: 120.19, status: 'active')
product3 = Product.create(title: "Dust Bunny", description: "We swear Frank didn't get his inspiration from Kirby.", price: 2.50, status: 'active')
product4 = Product.create(title: "The Great Fairy", description: "She'll heal you when you're low on hearts. Keep her in a bottle.", price: 23.90, status: 'active')
product5 = Product.create(title: "The Great Slump", description: "The Great Slump has a single claw arm.", price: 272.30, status: 'active')
product6 = Product.create(title: "Madam Mushroom", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 104.19, status: 'active')
product7 = Product.create(title: "Macy", description: "Macy, Marcy's triplet sister, is a tom-boy at heart.", price: 104.19, status: 'active')
product8 = Product.create(title: "Marcy", description: "The one and only (except for her siblings).", price: 104.19, status: 'active')
product9 = Product.create(title: "Ruby (blue)", description: "We <3 it.", price: 104.19, status: 'active')
product10 = Product.create(title: "Madam Mushroom (yellow)", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 104.19, status: 'active')
product11 = Product.create(title: "Senior Marshmellow", description: "Unfortunately he never learned how to spell his name correctly.", price: 74.44, status: 'active')
product12 = Product.create(title: "Slump, Sr.", description: "The grandfather of all hairballs. He was in a war once, you know.", price: 34.07, status: 'active')
product13 = Product.create(title: "Slumpy", description: "The daddy of the bunch.", price: 104.19, status: 'active')
product14 = Product.create(title: "Over-Saturated Slumpy", description: "Slumpy really hates being put in the microwave.", price: 1001.87, status: 'active')
product15 = Product.create(title: "Madam Mushroom (purple)", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 1235.99, status: 'active')
product16 = Product.create(title: "Ruby", description: "We <3 it.", price: 1.19, status: 'active')
product17 = Product.create(title: "Dust Bunny (purple)", description: "We swear Frank didn't get his inspiration from Kirby.", price: 17.95, status: 'active')
product18 = Product.create(title: "Squint", description: "Expert piano player", price: 24.00, status: 'active')
product19 = Product.create(title: "The Viking", description: "He's really a big softy at heart.", price: 4.70, status: 'active')
product20 = Product.create(title: "The Wizard", description: "Cranky, hates kids, and doesn't smell very good. I heard he's related to Dumbledore's second cousin.", price: 99.50, status: 'active')

Category.create(title: "Hairballs", product_ids: [1, 5, 7, 8, 12, 13, 14])
Category.create(title: "Mystics", product_ids: [3, 4, 6, 10, 11, 15, 17, 18, 20])
Category.create(title: "Bunnies", product_ids: [3, 17])
Category.create(title: "Brutes", product_ids: [19, 20, 11])
Category.create(title: "Miscellaneous", product_ids: [2, 9, 16, 4, 15, 18])

order1 = Order.create(status: 'pending', user_id: 1)
order2 = Order.create(status: 'paid', user_id: 1)
order3 = Order.create(status: 'shipped', user_id: 1)
order4 = Order.create(status: 'cancelled', user_id: 2)
order5 = Order.create(status: 'returned', user_id: 2)
order6 = Order.create(status: 'pending', user_id: 3)
order7 = Order.create(status: 'paid', user_id: 3)
order8 = Order.create(status: 'shipped', user_id: 3)
order9 = Order.create(status: 'pending', user_id: 3)
order10 = Order.create(status: 'returned', user_id: 3)

order1.order_items.create(product_id: product1.id,
                          unit_price: product1.price,
                          quantity: 2)

order1.order_items.create(product_id: product2.id,
                          unit_price: product2.price,
                          quantity: 1)

order2.order_items.create(product_id: product2.id,
                          unit_price: product2.price,
                          quantity: 1)

order3.order_items.create(product_id: product4.id,
                          unit_price: product4.price,
                          quantity: 1)

order3.order_items.create(product_id: product5.id,
                          unit_price: product5.price,
                          quantity: 1)

order4.order_items.create(product_id: product12.id,
                          unit_price: product12.price,
                          quantity: 1)

order4.order_items.create(product_id: product11.id,
                          unit_price: product11.price,
                          quantity: 5)

order5.order_items.create(product_id: product8.id,
                          unit_price: product8.price,
                          quantity: 10)


order6.order_items.create(product_id: product15.id,
                          unit_price: product15.price,
                          quantity: 1)

order7.order_items.create(product_id: product8.id,
                          unit_price: product8.price,
                          quantity: 2)

order8.order_items.create(product_id: product10.id,
                          unit_price: product10.price,
                          quantity: 3)

order9.order_items.create(product_id: product9.id,
                          unit_price: product9.price,
                          quantity: 4)

order10.order_items.create(product_id: product18.id,
                          unit_price: product18.price,
                          quantity: 1)
