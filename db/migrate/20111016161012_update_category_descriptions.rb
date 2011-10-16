class UpdateCategoryDescriptions < ActiveRecord::Migration
  def up
    c = Category.find_by_name("Sports")
    c.description = ""
    c.save!

    c = Category.find_by_name("Government")
    c.description = ""
    c.save!

    c = Category.find_by_name("Music")
    c.description = ""
    c.save!

    c = Category.find_by_name("Arts")
    c.description = ""
    c.save!

    c = Category.find_by_name("Education")
    c.description = ""
    c.save!

    c = Category.find_by_name("Theater")
    c.description = ""
    c.save!

    c = Category.find_by_name("Nightlife")
    c.description = ""
    c.save!

    c = Category.find_by_name("Training")
    c.description = ""
    c.save!

    c = Category.find_by_name("Entertainment")
    c.description = ""
    c.save!

    c = Category.find_by_name("Civic")
    c.description = ""
    c.save!

    c = Category.find_by_name("Volunteer")
    c.description = ""
    c.save!

    c = Category.find_by_name("Literature")
    c.description = ""
    c.save!

    c = Category.find_by_name("Tech")
    c.description = ""
    c.save!

    c = Category.find_by_name("Comedy")
    c.description = ""
    c.save!

    c = Category.find_by_name("Concert")
    c.description = ""
    c.save!

    c = Category.find_by_name("Meeting")
    c.description = ""
    c.save!

  end

  def down
  end
end
