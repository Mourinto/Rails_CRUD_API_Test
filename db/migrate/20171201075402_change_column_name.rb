class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :type, :category
  end
end
