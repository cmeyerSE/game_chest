User.destroy_all

(1..3).each do |id|
    User.create!(
        user_id: id,
        username: Faker::Name.name,
        password_digest: "password",
        )
end

Game.destroy_all


(1..15).each do |id|
    Game.create!(
        user_id: rand(1..3),
        game_title: Faker::Name.name
    )
end