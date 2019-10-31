class CreateContacts < ActiveRecord::Migration[6.0]
  def change
  	create_table :contacts do |c|
	      c.text :name
	      c.text :message

	      c.timestamps
      end

  end
end
