require 'faker'

record_count = Contact.all.size
desired_records = 50
records_to_make = desired_records - record_count

records_to_make.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.safe_email("#{first_name}.#{last_name}")

  contact = Contact.new(first_name: first_name,
                        last_name: last_name,
                        email: email)
  contact.save
end

record_count = Dog.count
desired_records = 25
records_to_make = desired_records - record_count

records_to_make.times do
  name = Faker::Cat.name
  dog = Dog.new(name: name, contact_id: (1 + rand(Contact.count)))

  dog.save
end
