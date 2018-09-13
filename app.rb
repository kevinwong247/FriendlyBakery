require 'sinatra'
require 'sendgrid-ruby'
require 'materialize'

include SendGrid

get "/" do 

    erb :index
end 

get "/cookies" do 

    erb :cookies
end 

get "/muffins" do 

    erb :muffins
end 

get "/cakes" do 

    erb :cakes
end 

get "/catalog" do
    
    erb :catalog
end 

post "/catalog" do
    from = Email.new(email: 'kevinwong247@gmail.com')
    to = Email.new(email: params[:email])
    subject = 'The Bakery World Catalog'
    content = Content.new(type: 'text/html', value: erb(:emailcatalog)  )
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['NAME'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.parsed_body
    # puts response.headers
    redirect "/"
    
end 


get "/contact" do 

    erb :contact
end

post "/contact" do 

    from = Email.new(email: 'kevinwong247@gmail.com')
    to = Email.new(email: params[:email])
    subject = 'contact'
    content = Content.new(type: 'text/plain', value:  "hello" )
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['NAME'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.parsed_body
    # puts response.headers
    redirect "/"
end

