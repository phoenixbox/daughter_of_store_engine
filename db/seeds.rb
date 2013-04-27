SEED_DATA = YAML.load_file('db/seeds.yml')

def seed_products(store, count)
  count.times do |i|
    puts "Seeding product #{i} for store #{store.id}"

    params = SEED_DATA['products'][store.path][i]
    image_params = params.delete('images')

    product = store.products.new(params)

    image_params.each do |image_param|
      product.images.new(data: URI.parse(image_param['url']))
    end

    product.save!
  end
end

def seed_categories(store, count)
  count.times do |i|
    title = Faker::Lorem.words(2).join(" ")
    store.categories.create!(title: title,
                             store_id: store.id)
    puts "Category #{title} created for Store #{store.id}"
  end
end

# THE USUAL SUSPECS / UBERS
user1 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com", password: "password", display_name: "j3")
user1.uber_up
user2 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com", password: "password", display_name: "SkrilleX")
user2.uber_up

# CREATE STORES
stores = SEED_DATA['stores'].map do |store_params|
           Store.create!(store_params)
         end

# SET STORE STATUS
stores.each do |store|
  store.update_attributes({status: 'online'}, as: :uber)
end

# CREATE CATEGORIES
# stores.each { |store| seed_categories(store, 10) }

# CREATE PRODUCTS
stores.each { |store| seed_products(store, 20) }

# CREATE ORDERS
# STATUSES = ['pending', 'shipped', 'cancelled', 'returned', 'paid']
# stores.each do |store|
#   20.times do |i|
#     begin
#       puts "Seeding order #{i} for store #{store.id}"
#       order = Order.create(status: STATUSES.sample,
#                            user_id: rand(10_000),
#                            store_id: store.id)
#       product = store.products.sample
#       order.order_items.create(product_id: product.id,
#                                unit_price: product.price,
#                                quantity: rand(5))
#     rescue
#       retry
#     end
#   end
# end
