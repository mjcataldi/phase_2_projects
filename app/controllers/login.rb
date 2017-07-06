get "/login" do

  erb :"login"
end

post "/login" do
  @contact = Contact.find_by(email: params[:email])

  if @contact == nil
    # @errors = ["Oops, you're not registered!  Let's take care of that."]
    erb :"sessions/register"
  elsif @contact.authenticate?(params[:password])
    session[:contact_id] = @contact.id
    redirect "/contacts/#{@contact.id}"
  else
    @errors = @contact.errors.full_messages
    erb :"login"
  end
end

get "/register" do
  erb :"/register"
end

post '/register' do
  @contact = Contact.create(params[:contact])

  if @contact.valid?
    redirect "/contacts/#{@contact.id}"
  else
    @errors = @contact.errors.full_messages
    erb :"/register"
  end

end

get "/logout" do
  session.delete(:contact_id)

  redirect "/login"
end
