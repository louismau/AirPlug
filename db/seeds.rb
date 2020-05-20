# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 
puts 'Cleaning database...'
User.destroy_all
Plug.destroy_all
Booking.destroy_all
 
puts 'Creating user...'


  user = User.new(
    password: "alpha0101",
    first_name: 'Elon',
    last_name: 'Musk',
    phone_number: '0150504545',
    email: 'elonm94@mail.com')  
  user.save
  puts "User #{user.email} created"

20.times do

  a = ['64 rue Pelleport, 75020 Paris', '12 Avenue des Champs Elysées, 75008 Paris', '8 rue du Mur du Parc, 78240 Chambourcy',
'113 rue des Pyrénées, 75020 Paris', '4 Passage de la Râpe, 45000 Orléans', '22 Boulevard Pierre Segelle, 45000 Orléans', 
'11 rue du Grenier A Sel, 45000 Orléans', '9 rue du Cheval Rouge, 45000 Orléans', '12 Hameau de la Rivière, 45160 Ardon',
'2 rue Girodet, 45000 Orléans', '13 impasse Gustave Courbet, 45650 Saint-Jean-le-Blanc', '22 Rue du Faubourg Saint-Jean, 45000 Orléans', 
'25 rue anatole france 92300 levallois-perret', '4 allée rené gripoix 77380 combs-la-ville', '25 passage dubail 75010 paris', 
'49 Avenue du Président Wilson94340 Joinville-le-Pont', '4 rue bobierre de vallière 92340 bourg la reine']

  plug = Plug.new(
      address: a.sample,
      power: [16, 30, 40, 70].sample,
      ac_dc: ["ac", "dc"].sample,
      type_plug: ["CHAdeMO", "CCS", "Type 2", "Tesla Type 2"].sample,
      price: rand(8..20)
  )
 
    plug.user = user
    plug.save
    puts "Plug \"#{plug.type_plug} - #{plug.power}\"created"

end

puts'Creating bookings...'
20.times do 
  booking = Booking.new 
  booking.user = User.all.sample 
  plug = Plug.all.sample
  booking.plug = plug
  puts "Booking for #{booking.user} created"
end


 
puts "Finished!"