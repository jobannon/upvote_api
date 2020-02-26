class AddImgUrlToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :img_url, :string, default: "https://images.unsplash.com/photo-1552862750-746b8f6f7f25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  end
end
