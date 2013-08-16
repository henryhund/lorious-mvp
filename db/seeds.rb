10.times do |i|
  expert = Expert.create!({
    hourly_rate: (i+1) * 10,
    email: "rg#{i}@gmail.com",
    username: "rg#{i}",
    credit_balance: 100,
    firstname: "Robert",
    lastname: "Griffin",
    display_name: "Robert Griffin #{i}",
    tagline: "This is the tagline for the expert. This needs to be longer than a sentence or the CSS is breaking",
    bio: "This is the bio of an expert, it's like really long and stuff",
    avatar_url: "http://cdn.solecollector.com/media/sneakers/images/robert-griffin-iii-rg3-covers-nike-logo-01.jpg"
  })
  puts "Created Expert: #{expert.display_name}"
end
