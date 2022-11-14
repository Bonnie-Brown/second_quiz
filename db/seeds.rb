
Idea.destroy_all

30.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    i = Idea.create(
        title: Faker::GreekPhilosophers.quote,
        body: Faker::Lorem.paragraph(sentence_count: 4),
        created_at: created_at,
        updated_at: created_at
    )

end

ideas = Idea.all

puts Cowsay.say("Generated #{ideas.count} ideas.", :elephant)



