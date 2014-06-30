# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {email: "test@test.com", password: "abcd1234", password_confirmation: "abcd1234"}
])

abstract_statuses = AbstractStatus.create([
  {name: "Pending"},
  {name: "Rejected"},
  {name: "Approved"}
])
