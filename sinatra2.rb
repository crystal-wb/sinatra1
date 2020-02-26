require 'sinatra'
require 'sqlite3'
db = SQLite3::Database.new( "maindata.db" )
get '/' do
    @results = db.execute( "select * from results" )
    erb :results
end

get '/howmany' do
   erb :howmany
end

post '/candles' do
    @number = params[:number].to_i
    db.execute( "insert into results(number) values(#{@number})" )
    erb :candles
end