class FixCommentsTableReferences < ActiveRecord::Migration[7.1]
  def change
    change_column_null :comments, :pilot_profiles_id, true
  end
end
