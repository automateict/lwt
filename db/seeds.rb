# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
role = Role.create(name: 'Admin')

top_gov_type = GovernmentBodyType.create(name: 'Top Gov Type')

top_gov_body = GovernmentBody.create(name: 'Top Gov Body', government_body_type_id: top_gov_type.id)

admin_user = User.create(role_id: role.id, government_body_id: top_gov_body.id, email: 'admin@lwt.com', password: 'admin123')
