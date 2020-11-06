class CreateJusyos < ActiveRecord::Migration[6.0]
  def change
    create_table :jusyos do |t|

      t.timestamps
    end
  end
end
