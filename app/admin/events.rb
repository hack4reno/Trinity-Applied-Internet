ActiveAdmin.register Event do
  index do  
    column :name  
    column :place
    column :start_at
    column :end_at
    column :age_rating
    column :price
    default_actions
  end
  
  filter :name
  filter :description
  filter :place
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :start_at
      f.input :end_at
      f.input :place
      f.input :age_rating
      f.input :price
    end
    f.buttons
  end  
end
