(1..3).each do |id|
    User.create!(
        username: Faker::Name.name,
        password_digest: "password",
        )
end

(1..10).each do |id|
    Game.create!(
        user_id: rand(1..3),
        game_title: Faker::Name.name
    )
end