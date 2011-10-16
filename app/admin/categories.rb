ActiveAdmin.register Category do
  index do  
    column :name  
    column :description
    default_actions
  end
  
  filter :name
  filter :description
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description, :as => :text
    end
    f.buttons
  end  
  
end
