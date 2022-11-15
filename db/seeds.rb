
Idea.destroy_all
Review.destroy_all
User.destroy_all
Like.destroy_all

PASSWORD = '123'

users = User.all

super_user = User.create(
    first_name: 'Admin',
    last_name: 'User',
    email: 'admin@user.com',
    password: PASSWORD,
    admin?: true
)

10.times do
        first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}@#{last_name.downcase}.com",
        password: PASSWORD,
        admin?: false
    )

end

30.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    i = Idea.create(
        title: Faker::GreekPhilosophers.quote,
        body: Faker::Lorem.paragraph(sentence_count: 4),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if i.valid?
        rand(1..5).times do
            Review.create(body: Faker::Hacker.say_something_smart, idea: i, user: users.sample)
        end
        i.likers = users.shuffle.slice(0, rand(users.count))
    end

end

ideas = Idea.all
reviews = Review.all

puts Cowsay.say("Generated #{ideas.count} ideas.", :elephant)
puts Cowsay.say("Generated #{reviews.count} reviews.", :bunny)
puts Cowsay.say("Generated #{users.count} users.", :dragon)
puts Cowsay.say("Genereated #{Like.count} likes", :koala)



