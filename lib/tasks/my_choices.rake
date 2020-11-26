namespace :my_choices do
  desc "destroying my choices"
  task destroy_all: :environment do
    User.where(email: ["laurene@cigogn.fr", "antony@cigogn.fr", "marion@cigogn.fr", "gregoire@cigogn.fr"]).each do |user|
      user.choices.destroy_all
      puts "all choices for #{user.email} destroyed"
    end
  end
end

# rails my_choices:destroy_all
