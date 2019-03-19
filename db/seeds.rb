# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# ser.new(
#     email: marcusmaione@gmail.com,
#     password: "12345678",
#     name: Faker::Name.name,
#     description: ["My host can occupy all the spaces of my apartment, the sites made in a place with many trees and quiet that is in the street of the apartment, very close. They will have jokes to have fun and much attention and affection. I live alone and have to make all the weekend time available for my host.","My pet loves new friends! It's very playful! is a guaranteed treat for the hospet, which you can stroll through the entire stay! The area is very good for dogs, wide and flat sidewalks. From the side of the park, you have a ride for all hours. Always with the tutor-oriented frequency, and of course, never in the sun so as not to burn the paws."].sample,
#     phone_number: "021 97474-7754",
#     remote_avatar_url: "http://i.pravatar.cc/300", #"https://source.unsplash.com/300x300/?face",
#     remote_location_url: ["http://kingdomlandscapes.com/images/uploads/gallery/20150205_113031.jpg", "https://www.rentfast.ca/rfc/listing_photos/6/7/4/9/1909476.v.6e924532cfc90b95d562551149f3ff28.jpg", "https://www.victorslandscaping.net/wp-content/uploads/2015/09/Clarendon4.jpeg", "https://ehq-production-canada.imgix.net/photos/images/bbba5d257514bc0fbe70accdebc9c5aa68933641/000/006/283/original/WP_20180704_15_24_43_Pro.jpg?auto=compress", "https://i.pinimg.com/originals/8e/e1/b7/8ee1b7f798db175af9ea1b8b9b156b77.jpg", "https://cache.legacy.net/usercontent/guestbook/photos/2017-05/2017-05-09/131838530.jpg", "https://storage.googleapis.com/idx-photos-gs.ihouseprd.com/CA-TULARE/130444/org/000.jpg", "https://1.bp.blogspot.com/-SUffhsmAmRI/V3RxYzn6BZI/AAAAAAAAC6Q/-4a9C1_1bOMf6Ow8uAV9q0VprR3ab79GQCLcB/s1600/20160424_145852.jpg"].sample,
#     address: ["Rua Rodolfo Dantas, 85 - Copacabana - Rio de Janeiro - RJ, 22020-040"]
#   )
#   user.save!
# end

require 'faker'

10.times do
  user = User.new(
    email:    Faker::Internet.unique.email,
    password: "12345678",
    remote_avatar_url: Faker::Avatar.image("my-own-slug", "50x50")
  )
  user.save!
  p "user created"
end


5.times do
  store = Store.new(
    name:    Faker::Company.unique.name,
    address: ["Rua General Polidoro 166, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Visconde de Pirajá 550, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua das Laranjeiras 540, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Avenida Nossa Sra. de Copacabana 540, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Avenida Vieira Souto 460, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Rodolfo Dantas 85, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Bom Pastor 544, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Moura Brasil 74, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Ladeira da Glória 26, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Voluntários da Pátria, 190 Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua São Clemente 185, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Bambina 54, Rio de Janeiro, Rio de Janeiro, Brasil",
    "Rua Mena Barreto 161, Rio de Janeiro, Rio de Janeiro, Brasil"].sample,
    description: Faker::Commerce.department(3),
    remote_picture_url: ["https://cdn.pixabay.com/photo/2017/11/06/11/36/store-2923410_960_720.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Fachada_do_Salvador_Norte_Shoping.jpg/800px-Fachada_do_Salvador_Norte_Shoping.jpg"].sample,
    phone: ["21-99-234-234","21-99-45-456","21-99-789-789","21-99-678-678","21-99-654-654"].sample,
    user: User.all.sample
  )
  p "store created"
  store.save!
end


5.times do
  working_hour = WorkingHour.new(
    week_day: 1,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["17h00", "18h00","19h00","20h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end

5.times do
  working_hour = WorkingHour.new(
    week_day: 2,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["17h00", "18h00","19h00","20h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end

5.times do
  working_hour = WorkingHour.new(
    week_day: 3,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["17h00", "18h00","19h00","20h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end

5.times do
  working_hour = WorkingHour.new(
    week_day: 4,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["17h00", "18h00","19h00","20h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end

5.times do
  working_hour = WorkingHour.new(
    week_day: 5,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["17h00", "18h00","19h00","20h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end

5.times do
  working_hour = WorkingHour.new(
    week_day: 6,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["17h00", "18h00","19h00","20h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end

5.times do
  working_hour = WorkingHour.new(
    week_day: 7,
    start_time: ["8h30", "9h00", "10h00","11h00"].sample,
    end_time: ["12h00", "13h00"].sample,
    store_id: ["1", "2", "3", "4", "5"].shuffle!.pop
  )
  working_hour.save!
end






