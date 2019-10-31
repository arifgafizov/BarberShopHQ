require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# создаем сущность
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	# Вывод барберов на экран с помощью ActiveRecord
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	# сохранение клиентов в БД на странице visit с помощью ActiveRecord
	clients = Client.create(name: @username, phone: @phone, datestamp: @datetime, barber: @barber, color: @color)

	erb "<h2>Спасибо вы записались на #{@datetime}</h2>"

end

get '/contacts' do
	erb :contacts
end