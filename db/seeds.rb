# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Image.delete_all
Image.reset_pk_sequence
Image.create([
{name: 'nature1', file: 'nature1.jpg', theme_id: 2},
{name: 'nature2', file: 'nature2.jpg', theme_id: 2},
{name: 'nature3', file: 'nature3.jpg', theme_id: 2},
{name: 'nature4', file: 'nature4.jpg', theme_id: 2},
{name: 'nature5', file: 'nature5.jpg', theme_id: 2},
{name: 'porsche1', file: 'porsche1.jpg', theme_id: 3},
{name: 'porsche2', file: 'porsche2.jpg', theme_id: 3},
{name: 'porsche3', file: 'porsche3.jpg', theme_id: 3},
{name: 'porsche4', file: 'porsche4.jpg', theme_id: 3},
{name: 'porsche5', file: 'porsche5.jpg', theme_id: 3},
{name: 'flower1', file: 'flower1.jpg', theme_id: 1},
{name: 'flower2', file: 'flower2.jpg', theme_id: 1},
{name: 'flower3', file: 'flower3.jpg', theme_id: 1},
{name: 'flower4', file: 'flower4.jpg', theme_id: 1},
{name: 'flower5', file: 'flower5.jpg', theme_id: 1}
])

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([
{name: "flowers"},      # 1
{name: "nature"},      # 2
{name: "porsche"}      # 3
])

User.delete_all
User.reset_pk_sequence

Value.delete_all
Value.reset_pk_sequence
