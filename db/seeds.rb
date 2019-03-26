require 'faker'

camille = User.new(
  first_name:         "Camille",
  last_name:          "Huret",
  phone:              "21-456-654",
  avatar:             Rails.root.join("app/assets/images/camille.JPG").open,
  email:              "camille@gmail.com",
  password:           "12345678",
)
camille.save!


floriane = User.new(
  first_name:         "Floriane",
  last_name:          "Didier",
  phone:              "21-456-654",
  avatar:             Rails.root.join("app/assets/images/floriane.jpg").open,
  email:              "floriane@gmail.com",
  password:           "12345678",
)
floriane.save!


lucas = User.new(
  first_name:         "Lucas",
  last_name:          "Martins",
  phone:              "21-456-654",
  avatar:             Rails.root.join("app/assets/images/lucas.jpg").open,
  email:              "lucas@gmail.com",
  password:           "12345678",
)
lucas.save!

marcus = User.new(
  first_name:         "Marcus",
  last_name:          "Maione",
  phone:              "21-456-654",
  avatar:             Rails.root.join("app/assets/images/marcus.jpg").open,
  email:              "marcus@gmail.com",
  password:           "12345678",
)
marcus.save!

pedro = User.new(
  first_name:         "Pedro",
  last_name:          "Meyer",
  phone:              "21-456-654",
  avatar:             Rails.root.join("app/assets/images/pedro.jpg").open,
  email:              "pedro@gmail.com",
  password:           "12345678",
)
pedro.save!

10.times do
  user = User.new(
    first_name:         Faker::Name.first_name,
    last_name:          Faker::Name.last_name,
    phone:              Faker::PhoneNumber.phone_number,
    avatar:             Faker::Avatar.image,
    email:              Faker::Internet.unique.email,
    password:           "12345678",
  )
  user.save!
end

# stores:
wagon = Store.new(
  name:    "Le Wagon",
  address: "Ladeira da Glória 26, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "The best ecological coding bootcamp on the planet.",
  phone: "21-99-234-234",
  user: User.all.fifth,
  picture: Rails.root.join("app/assets/images/wagon.jpg").open,
)
wagon.save!

osklen = Store.new(
  name:    "Osklen",
  address: "Rua do Catete 230, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "Sustainable fashion, promoting circular economy and recycling.",
  phone: "(21) 2227-2930",
  user: User.all.third,
  picture: Rails.root.join("app/assets/images/osklen.jpg").open,
)
osklen.save!

ecobeach = Store.new(
  name:    "Eco Beach",
  address: "Rua do Passeio 256, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "Sustainable clothing.",
  phone: "(21) 2227-2930",
  user: User.all.fourth,
  picture: Rails.root.join("app/assets/images/ecobeach.jpg").open,
)
ecobeach.save!

mundoazul = Store.new(
  name:    "Mundo Azul",
  address: "Avenida Rio Branco 456, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "Organic food.",
  phone: "(21) 2227-2930",
  user: User.all.third,
  picture: Rails.root.join("app/assets/images/mundoazul.jpg").open,
)
mundoazul.save!

planetaverde = Store.new(
  name:    "Planeta Verde",
  address: "Rua Dias de Barros 600, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "Home appliances.",
  phone: "(21) 2227-2930",
  user: User.all.fourth,
  picture: Rails.root.join("app/assets/images/planetaverde.jpg").open,
)
planetaverde.save!

ashtanga = Store.new(
  name:    "Ashtanga",
  address: "Rua Paissandu 300, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "Yoga studio.",
  phone: "(21) 2227-2930",
  user: User.all.fifth,
  picture: Rails.root.join("app/assets/images/ashtanga.jpg").open,
)
ashtanga.save!

esperanzacafe = Store.new(
  name:    "Esperanza Cafe",
  address: "Rua Pereira da Silva 102, Rio de Janeiro, Rio de Janeiro, Brasil",
  description: "Sustainable coffee.",
  phone: "(21) 2227-2930",
  user: User.all.third,
  picture: Rails.root.join("app/assets/images/esperanzacafe.jpg").open,
)
esperanzacafe.save!


# Benefits:

benefit_wagon = Benefit.new(
  name:       "Learn coding for free!",
  description: "Free coding bootcamp and a massage from Pedro.",
  start_date: "03/15/2019",
  end_date: "09/15/2019",
  store: Store.all.first,
)
benefit_wagon.save!


benefit_osklen = Benefit.new(
    name:       "Free T-Shirt",
    description: "Our star t-shirt ASAP: As Sustainable As Possible.",
    start_date: "03/15/2019",
    end_date: "09/15/2019",
    store:Store.all.second,
)
benefit_osklen.save!

benefit_ecobeach = Benefit.new(
    name:       "Discount",
    description: "10% discount on all products.",
    start_date: "03/15/2019",
    end_date: "09/15/2019",
    store:Store.all.third,
)
benefit_ecobeach.save!

benefit_mundoazul = Benefit.new(
    name:       "Discount",
    description: "15% discount on all products.",
    start_date: "03/15/2019",
    end_date: "09/15/2019",
    store:Store.all.fourth,
)
benefit_mundoazul.save!

benefit_planetaverde = Benefit.new(
    name:       "Gift",
    description: "Free tote bag with our beautiful logo.",
    start_date: "03/15/2019",
    end_date: "09/15/2019",
    store:Store.all.fifth,
)
benefit_planetaverde.save!

benefit_ashtanga = Benefit.new(
    name:       "Yoga against plastic",
    description: "One free yoga class.",
    start_date: "03/15/2019",
    end_date: "09/15/2019",
    store:Store.find(6),
)
benefit_ashtanga.save!

benefit_esperanzacafe = Benefit.new(
    name:       "Less plastic more coffee",
    description: "One free 250g coffee pack origin Sumatra.",
    start_date: "03/15/2019",
    end_date: "09/15/2019",
    store:Store.all.last,
)
benefit_esperanzacafe.save!





# Working hours:


7.times do
  working_hour = WorkingHour.new(
    week_day: 1,
    start_time: "10h00",
    end_time: "19h00",
    store: Store.all.sample,
  )
  working_hour.save!
end

7.times do
  working_hour = WorkingHour.new(
    week_day: 2,
    start_time: "10h00",
    end_time: "19h00",
    store: Store.all.sample,
  )
  working_hour.save!
end

7.times do
  working_hour = WorkingHour.new(
    week_day: 3,
    start_time: "10h00",
    end_time: "19h00",
    store: Store.all.sample,
  )
  working_hour.save!
end

7.times do
  working_hour = WorkingHour.new(
    week_day: 4,
    start_time: "10h00",
    end_time: "19h00",
    store: Store.all.sample,
  )
  working_hour.save!
end

7.times do
  working_hour = WorkingHour.new(
    week_day: 5,
    start_time: "10h00",
    end_time: "19h00",
    store: Store.all.sample,
  )
  working_hour.save!
end

7.times do
  working_hour = WorkingHour.new(
    week_day: 6,
    start_time: "10h00",
    end_time: "19h00",
    store: Store.all.sample,
  )
  working_hour.save!
end

7.times do
  working_hour = WorkingHour.new(
    week_day: 7,
    start_time: "10h00",
    end_time: "13h00",
    store: Store.all.sample,
  )
  working_hour.save!
end






