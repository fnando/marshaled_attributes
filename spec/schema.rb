ActiveRecord::Schema.define(:version => 0) do
  create_table :beers do |t|
    t.string :name
    t.binary :meta
  end
end