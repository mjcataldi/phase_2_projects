get "/contacts" do
  @contacts = Contact.all

  erb :"contacts/index"
end

get "/contacts/new" do
  @contact = Contact.new

  erb :"contacts/new"
end

post "/contacts" do
  contact = Contact.new(params[:contact])

  if contact.save
    redirect "contacts"
  else
    @errors = contact.errors.full_messages
  end
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id])

  erb :"contacts/show"
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id])

  erb :"contacts/edit"
end

put "/contacts/:id" do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])

  redirect "/contacts/#{@contact.id}"
end

get "/contacts/:id/delete" do
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect "/contacts"
end
