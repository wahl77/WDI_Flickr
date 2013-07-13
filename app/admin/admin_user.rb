ActiveAdmin.register User do     
  index do                            
    column :username                     
    default_actions                   
  end                                 

  filter :username                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :username                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
