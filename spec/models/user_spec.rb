describe User do

  it "should have tags" do
    10.times {|i| Tag.create!(name: "tag #{i}") }

    5.times do |i|
      u = User.create!
      10.times do |j|
        a = Article.create!(user: u)
        5.times do |k|
          a.tags << Tag.all[i + k]
        end
      end
      # expect(u.tags.size).to eq 5
    end

    puts User.first.tags.map(&:name).join(", ")

    # puts User.preload(:tags).each do |u|
    # puts User.includes(:tags).references(:tags).each do |u|
    User.eager_load(:tags).distinct.each do |u|
      puts "===="
      puts u.tags.map(&:name).join(", ")
    end
  end

end
