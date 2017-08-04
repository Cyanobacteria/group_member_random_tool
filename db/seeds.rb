# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  data = ["陳","王","吳","李","郭","董","賴","廖","許","倪","林","蔣","戴","徐","鍾","薛","姬"]
  data_shuffle =data.shuffle
  a=[]
  b=[]
  5.times do |m|
   a << data_shuffle[m]
   b << (m+1).to_s
  end
  Group.create!( :info => "test number#{n}",
                 :member => "#{a.join('x')}",
                 :sort => "#{b.join('x')}"
                )


end
User.create(:email => "aaaaaa@aaa.aaa", :password => "aaaaaa", :password_confirmation => "aaaaaa")

