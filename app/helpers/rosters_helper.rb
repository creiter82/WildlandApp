module RostersHelper

  def roster_index_links var
    # (link_to fa_icon("eye", class: 'fa-lg'), var) + " ".html_safe +
    (link_to fa_icon("pencil-square-o", class: 'fa-lg'), edit_roster_path(var), class: 'edit-btn') + " ".html_safe + 
    (link_to fa_icon("trash-o", class: 'fa-lg'), var, method: :delete, data: { confirm: 'Are you sure?' }, class: 'delete-btn') 
  end

end
