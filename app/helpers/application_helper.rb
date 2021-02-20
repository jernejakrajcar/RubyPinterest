module ApplicationHelper
  def display_session_links
    capture do
      if user_signed_in?
        concat link_to "Edit Profile", edit_user_registration_path, class:"btn btn-outline-secondary"
        concat " "
        concat link_to "Pins", pins_path, class:"btn btn-outline-danger"
        concat " "
        concat link_to "Log out", destroy_user_session_path, method: :delete, class:"btn btn-outline-danger"
      else
        concat link_to "Log in", new_user_session_path, class:"btn btn-danger"
        concat " "
        concat link_to "Sign in", new_user_registration_path, class:"btn btn-danger"
        concat " "
      end
    end
  end
end
