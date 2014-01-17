json.array!(@meta_data) do |meta_datum|
  json.extract! meta_datum, :table_name, :field_name, :account_id
  json.url meta_datum_url(meta_datum, format: :json)
end
