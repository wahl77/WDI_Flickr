ActiveAdmin.register User do     
  index do                            
    column :username                     
    column :is_admin
    default_actions                   
  end                                 

  filter :username                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :username                  
      f.input :password               
      f.input :password_confirmation  
      f.input :is_admin
    end                               
    f.actions                         
  end                                 
end                                   
