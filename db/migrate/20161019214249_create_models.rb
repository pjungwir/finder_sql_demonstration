class CreateModels < ActiveRecord::Migration
  def change
    create_table :users do |t|
    end

    create_table :articles do |t|
      t.references :user
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :articles_tags do |t|
      t.references :article
      t.references :tag
    end
  end
end
