class CreateApplicants < ActiveRecord::Migration
  def self.up
    create_table :applicants do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.string :school
      t.string :grate
      t.string :sex
      t.integer :tel
      t.string :pname
      t.string :address
      t.string :birth
      t.string :idcard

      t.timestamps
    end
  end

  def self.down
    drop_table :applicants
  end
end
