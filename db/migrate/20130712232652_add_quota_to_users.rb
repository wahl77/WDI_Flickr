class AddQuotaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :quota, :integer, default:2
    User.update_all quota:2

  end
end
