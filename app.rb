require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://Databases/database1')

get "/" do
  @db = DB[:blog]
  erb :blog
end

post "/" do
  @db = DB[:blog]
  @db.insert(:name => params[:name], :subject => params[:subject], :text => params[:text])
  erb :blog
end