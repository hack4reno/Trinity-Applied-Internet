ActiveAdmin.register Place do
  index do  
    column :name  
    column :description  
    column :address_1  
    column :city
    column :state
    column :zipcode
    column :latitude
    column :longitude
  end
  
  filter :name
  filter :description
  filter :city
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
    end
    f.inputs "Address" do
      f.input :address_1, :label => 'Address'
      f.input :city
      f.input :state
      f.input :zipcode
    end
    f.buttons
  end
end
