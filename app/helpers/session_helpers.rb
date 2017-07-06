module SessionHelper
  def current_user
    @current_user = Contact.find(session[:contact_id]) if session[:contact_id]
  end

  def logged_in?
    !!current_user
  end

end

helpers SessionHelper
