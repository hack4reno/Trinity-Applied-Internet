module ApplicationHelper

  def service_authorization_links
    links = []
    clazzes = []
    Dir.foreach("#{Rails.root}/app/models/services") do |model_path|
      begin
        file, ext = model_path.split('.')
        clazzes << "services/#{file}".camelize.constantize unless model_path == '..' or model_path == '.'
      rescue
      end
    end
    
    clazzes.each do |clazz|
      links << [ "Add #{clazz.default_service_name}", service_request_path(clazz.default_service_id) ]
    end
    links
  end
   
  def get_role( account, user ) 
    account.account_users.each do |au|
      return au.account_role.name if au.user_id == user.id
    end
    ""
  end   
  
  def remove_link_unless_new_record(fields)
    out = ''
    out << fields.hidden_field(:_delete)  unless fields.object.new_record?
    out << link_to("remove", "##{fields.object.class.name.underscore}", :class => 'remove')
    out
  end
  
  def generate_html(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f  

    form_builder.fields_for(method, options[:object], :child_index => 'NEW_RECORD') do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end

  def generate_template(form_builder, method, options = {})
    escape_javascript generate_html(form_builder, method, options )
  end
  
  def generate_permutations( account, form_builder, method, options = {}) 
    output = "{ "
    account.authorizations.each_with_index do |auth,index|
      auth.update_types.each do |ut|
        output << "#{ut.to_s}_#{index}: '" 
        update_task = UpdateTask.new( :authorization => auth, :user => current_user, :arguments => auth.update_defaults[ut], :update_type => ut )
        output << generate_template( form_builder, method, {:object => update_task} )
        include_task = false
        output << "',\n"
      end
    end
    output << "dummy: 0 }\n"
    
    output
  end

end
