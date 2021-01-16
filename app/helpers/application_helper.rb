module ApplicationHelper
  def display_session_links
    capture do
      if user_signed_in?
        concat link_to "Edit Profile", edit_user_registration_path
        concat " "
        concat link_to "Log out", destroy_user_session_path, method: :delete
      else
        concat link_to "Log in", new_user_session_path
        concat " "
        concat link_to "Sign in", new_user_registration_path
        concat " "
      end
    end
  end
end
