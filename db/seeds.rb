require 'faker'


5.times do
    user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
        )
    user.skip_confirmation!
    user.save!
end
users = User.all

10.times do
    RegisteredApplication.create!(
        user: users.sample,
        url: Faker::Internet.url,
        name: Faker::App.name
    )
end
registered_applications = RegisteredApplication.all

100.times do
    Event.create!(
        registered_application: registered_applications.sample,
        name: Faker::Lorem.word
    )
end
events = Event.all


stacia = User.new(
    name: 'stacia',
    password: 'helloworld',
    email: 'stacia@example.com'
    )
stacia.skip_confirmation!
stacia.save!

admin = User.new(
    name: 'admin',
    password: 'helloworld',
    email: 'admin@example.com'
    )
admin.skip_confirmation!
admin.save!

puts "#{User.count} users created."
puts "#{RegisteredApplication.count} registered_applications created."
puts "#{Event.count} events created."