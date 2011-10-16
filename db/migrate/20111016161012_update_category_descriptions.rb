class UpdateCategoryDescriptions < ActiveRecord::Migration
  def up
    c = Category.find_by_name("Sports")
    c.description = "Peewee, Varsity, Clubs, Professional, and Blood."
    c.save!

    c = Category.find_by_name("Government")
    c.description = "For the people, by the people."
    c.save!

    c = Category.find_by_name("Music")
    c.description = "Concerts, Clubs, DJs, and the Sound of."
    c.save!

    c = Category.find_by_name("Arts")
    c.description = "Multi-Disciplinary/Media, Performing, Graphic, and Garfunkel."
    c.save!

    c = Category.find_by_name("Education")
    c.description = "Teach the people, help them grow."
    c.save!

    c = Category.find_by_name("Theater")
    c.description = "All the world's a stage."
    c.save!

    c = Category.find_by_name("Nightlife")
    c.description = "Clubs, Parties, Bars, and Werewolves."
    c.save!

    c = Category.find_by_name("Training")
    c.description = "Improving yourslef and learning skills."
    c.save!

    c = Category.find_by_name("Entertainment")
    c.description = "Not boring."
    c.save!

    c = Category.find_by_name("Civic")
    c.description = "Enhancing public life."
    c.save!

    c = Category.find_by_name("Volunteer")
    c.description = "Opportunities to give back."
    c.save!

    c = Category.find_by_name("Literature")
    c.description = "My baby loves a bunch of writers."
    c.save!

    c = Category.find_by_name("Tech")
    c.description = "Science, Technology and Math."
    c.save!

    c = Category.find_by_name("Comedy")
    c.description = "It makes you laugh, it makes you cry."
    c.save!

    c = Category.find_by_name("Concert")
    c.description = "Free Bird!"
    c.save!

    c = Category.find_by_name("Meeting")
    c.description = "Circling the wagons."
    c.save!

  end

  def down
  end
end
