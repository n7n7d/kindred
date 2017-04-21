class ChangeColumnName < ActiveRecord::Migration[5.0]
    def change
      rename_column :houses, :type, :house_structure
    end
end
