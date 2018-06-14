module ApplicationHelper

  def flash_class(level)
      case level
          when 'notice'  then "alert alert-info"
          when 'success' then "alert alert-success"
          when 'danger'  then "alert alert-danger"  
          when 'error'   then "alert alert-error"
          when 'alert'   then "alert alert-error"
      end
  end

  def days_deployed deployment
    if deployment.returned_date?
      (deployment.returned_date - deployment.created_at.to_date + 1).to_i
    else
      (Date.today - deployment.created_at.to_date + 1).to_i  
    end  
  end

end
