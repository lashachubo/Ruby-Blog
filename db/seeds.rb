# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

["https://m.media-amazon.com/images/I/7146PQT0mKL._AC_UF894,1000_QL80_.jpg",
"https://m.media-amazon.com/images/I/7146PQT0mKL._AC_UF894,1000_QL80_.jpg",
"https://cdn.webshopapp.com/shops/2090/files/397576279/650x650x2/the-batman-movie-masterpiece-action-figure-1-6-bat.jpg",
"https://cdn.webshopapp.com/shops/2090/files/397576279/650x650x2/the-batman-movie-masterpiece-action-figure-1-6-bat.jpg",
"https://cdn.webshopapp.com/shops/2090/files/397576279/650x650x2/the-batman-movie-masterpiece-action-figure-1-6-bat.jpg",
 "https://cdn.ecommercedns.uk/files/1/240241/0/17719470/batman-gallery-606220a478d7f.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8iOzbPB8R0JLVezvk7EN6Wf0C6Iem56Kkbg&s",
"https://cdn11.bigcommerce.com/s-hlbgbzrg7y/images/stencil/1280x1280/products/1536/16965/Batman_Kingdom_Come__02163.1710791155.png?c=1",
"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Batman_%28black_background%29.jpg/800px-Batman_%28black_background%29.jpg"].each_with_index do |url, i| 
  title = "batman action figure #{i}"
  Listing.find_or_create_by!(picture_url: url, title: title, user_id: 1)
end