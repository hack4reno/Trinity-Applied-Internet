# from http://devcenter.heroku.com/articles/using-sass
# related to https://gist.github.com/1012619,  (active_admin_heroku.rb)

Sass::Plugin.options.merge!(
  :template_location => 'public/stylesheets/sass',
  :css_location => 'tmp/stylesheets'
)

Rails.configuration.middleware.delete('Sass::Plugin::Rack')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/stylesheets'],
    :root => "#{Rails.root}/tmp")