module PinsHelper
  def display_pin_links(pin)
    html = "<td>#{link_to 'Show', pin }</td>"
    html += "<td>#{link_to 'Edit', edit_pin_path(pin) if current_user == pin.user}</td>"
    html += "<td>#{link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } if current_user == pin.user}</td>"

    html.html_safe
  end

  def display_pin_show_links(pin)
    html = ""
    if current_user == pin.user
      html += link_to 'Edit', edit_pin_path(@pin)
      htmml += ' | '
    end
    html += link_to 'Back', pins_path
    html.html_safe
  end
end
