module DeploymentsHelper

  def days_deployed deployment
    if deployment.returned_date?
      (deployment.returned_date - deployment.created_at.to_date + 1).to_i
    else
      (Date.today - deployment.created_at.to_date + 1).to_i  
    end  
  end
end

