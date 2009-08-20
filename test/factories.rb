require 'factory_girl'

Factory.define :user do |f|
  f.firstname 'Matthew'
  f.surname 'House'
  f.email 'matt@theshadowaspect.com'
  f.joined_on Date.parse("08/09/2008")
  f.left_on nil
end

Factory.define :left_user, :parent => :user do |f|
  f.left_on Time.now
end

Factory.define :hardware do |f|
  f.serial_number '0123456789'
  f.date_purchased Time.now
  f.user_id nil
  f.hardware_type_id nil
end

Factory.define :software do |f|
  f.name "Microsoft Windows XP"
  f.serial "serialkey"
  f.date_purchased Time.now
  f.hardware_id nil
  f.user_id nil
end

Factory.define :hardware_type do |f|
  f.name 'Laptop'
  f.manufacturer 'Macbook Pro'
  f.model_number rand(100)
end