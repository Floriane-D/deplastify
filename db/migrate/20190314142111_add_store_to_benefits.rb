class AddStoreToBenefits < ActiveRecord::Migration[5.2]
  def change
    add_reference :benefits, :store, foreign_key: true
  end
end
