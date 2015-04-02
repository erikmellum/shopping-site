# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create(
  [
    { email: 'a@a.com', password: 'a', password_confirmation: 'a'},
    { email: 'b@b.com', password: 'b', password_confirmation: 'b'},
    { email: 'c@c.com', password: 'c', password_confirmation: 'c'},
    { email: 'd@d.com', password: 'd', password_confirmation: 'd'},
    { email: 'e@e.com', password: 'e', password_confirmation: 'e'}
  ]
)
families = Family.create(
  [
    { name: 'Mellum'},
    { name: 'Zachary'}
  ]
)
members = Member.create(
  [
    { name: 'Erik', description: 'Strange', dob: 'March 19th, 1991', family_id: 1},
    { name: 'Krissy', description: 'Stranger', dob: 'June 3rd, 1991', family_id: 1},
    { name: 'Monica', description: 'Parent', dob: 'Some day', family_id: 2}
  ]
)
images = Image.create(
  [
    { filename: 'test.jpg', description: 'For Testing', member_id: 1},
    { filename: 'wow.jpg', description: 'So much wow', member_id: 1},
    { filename: 'cute.jpg', description: 'Oh so cute', member_id: 2},
    { filename: 'hello.jpg', description: 'Hello!', member_id: 3},
    { filename: 'family.jpg', description: 'A snippet about this', family_id: 1},
    { filename: 'extra.jpg', description: 'So wonderful', family_id: 2}
  ]
)
milestones = Milestone.create(
  [
    {name: 'Opened first can of beer', description: 'A momentous occasion', date: 'December 31st, 1999', member_id: 1},
    {name: 'Fell and hit head for first time', description: 'The beginning of a day of infamy involving a cycle of falls and head smacks', date: 'December 7th, 1941'}
  ]
)
#relationships = Relationship.create(
#  [
#    {name: 'Married', member_one: 1, member_two: 2}
#  ]
#)
tags = Tag.create(
  [
    { name: 'Test Tag', image_id: 1},
    { name: 'Funny Tag', image_id: 1},
    { name: 'Sad Tag', image_id: 2}
  ]
)
likes = Like.create(
  [
    { user_id: 1, image_id: 1},
    { user_id: 2, image_id: 1},
    { user_id: 2, image_id: 2}
  ]
)
comments = Comment.create(
  [
    { user_id: 1, image_id: 1, date: DateTime.new(2009,9,1,17), body: 'The quick brown fox jumps over the lazy dog'},
    { user_id: 1, image_id: 1, date: DateTime.new(2012,9,2,18), body: 'Grumpy wizards make toxic brew for evil queen and jack'},
    { user_id: 2, image_id: 1, date: DateTime.new(2014,10,1,1), body: 'Pack my box with five dozen jugs of liquor'},
    { user_id: 3, image_id: 2, date: DateTime.new(2014,10,2,2), body: 'Do you know what an anagram is?'}
  ]
)
events = Event.create(
  [
    { name: 'Wedding', date: 'May 31st, 2014', location: 'Neighborhood Church', family_id: 1},
    { name: 'Reception', date: 'May 31st, 2014', location: 'Partytown', family_id: 1}
  ]
)
hobbies = Hobby.create(
  [
    {name: 'School', description: 'Going to school', member_id: 1},
    {name: 'Teaching', description: 'Going to school', member_id: 2},
    { name: 'Drumming', description: 'Going to drum', member_id: 1}
  ]
)
