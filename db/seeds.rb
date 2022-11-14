
Idea.destroy_all
Review.destroy_all

30.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    i = Idea.create(
        title: Faker::GreekPhilosophers.quote,
        body: Faker::Lorem.paragraph(sentence_count: 4),
        created_at: created_at,
        updated_at: created_at
    )
    if i.valid?
        rand(1..5).times do
            Review.create(body: Faker::Hacker.say_something_smart, idea: i)
        end
    end

end

ideas = Idea.all
reviews = Review.all

puts Cowsay.say("Generated #{ideas.count} ideas.", :elephant)
puts Cowsay.say("Generated #{reviews.count} reviews.", :bunny)



