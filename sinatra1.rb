require 'sinatra'  
enable :sessions
get '/' do
    if session[:name]
        "Welcome back to the Sinatra lesson #{session[:name]}"
    else
        "Welcome to the Sinatra lesson"
    end
end

get "/submitted" do
    "Submitted: #{params[:message]}"
end

post "/submitted" do
    if params[:message] == "welcome"
      "Thank you"
    else
      "What do you mean by #{params[:message]}?"
    end
end

get "/getdoc" do
  '<!DOCTYPE html>
  <html>
    <body>
        <p style="color:red;">p tag red </p>
    </body>
  </html>'
end

get '/login.html' do
    'another method'
end

post '/logon' do
    name = params[:username]
    pass = params[:password]
    if name == 'Bob' && pass == 'pass'
        '<h1>SUCCESS</h1>'
    else
        '<h1>FAILURE</h1>'
    end
end

get "/set" do
    session[:message] = params[:message]
    "session saved"
end 
 
get "/get" do
    session[:message]
end

post '/hello' do
    session[:name] = params[:name]
    'Saved the name'
end

get '/greet' do
    "Hello, so happy to meet you, #{session[:name]}"
end

