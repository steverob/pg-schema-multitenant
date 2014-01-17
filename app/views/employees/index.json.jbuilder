json.array!(@employees) do |employee|
  json.extract! employee, :name, :eid, :department, :title
  json.url employee_url(employee, format: :json)
end
