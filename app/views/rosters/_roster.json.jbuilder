json.extract! roster, :id, :name, :start_date, :end_date, :slug, :created_at, :updated_at
json.url roster_url(roster, format: :json)
