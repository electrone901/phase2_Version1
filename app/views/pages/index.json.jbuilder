json.array!(@pages) do |page|
  json.extract! page, :id, :total_visits, :total_duration, :site_id
  json.url page_url(page, format: :json)
end
