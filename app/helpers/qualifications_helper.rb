module QualificationsHelper

  def qual_links var
    (link_to fa_icon("pencil-square-o", class: 'fa-lg'), edit_qualification_path(var), class: 'edit-btn') + " ".html_safe + 
    (link_to fa_icon("trash-o", class: 'fa-lg'), var, method: :delete, data: { confirm: "Are you sure you want to delete \'#{var.name.titleize}'?" }, class: 'delete-btn') 
  end

end