#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

#For Guidance
#http://github.com/thoughtbot/factory_girl
# http://railscasts.com/episodes/158-factories-not-fixtures

def r_str
  ActiveSupport::SecureRandom.hex(3)
end

Factory.define :profile do |p|
  p.sequence(:first_name) { |n| "Robert#{n}#{r_str}" }
  p.sequence(:last_name)  { |n| "Grimm#{n}#{r_str}" }
  p.birthday Date.today
end

Factory.define :person do |p|
  p.sequence(:diaspora_handle) { |n| "bob-person-#{n}#{r_str}@example.net" }
  p.sequence(:url)  { |n| AppConfig[:pod_url] }
  p.serialized_public_key OpenSSL::PKey::RSA.generate(1024).public_key.export
  p.after_build do |person|
    person.profile = Factory.build(:profile, :person => person) unless person.profile.first_name.present?
  end
  p.after_create do |person|
    person.profile.save
  end
end

Factory.define :searchable_person, :parent => :person do |p|
  p.after_build do |person|
    person.profile = Factory.build(:profile, :person => person, :searchable => true)
  end
end

Factory.define :user do |u|
  #u.getting_started false
  u.sequence(:username) { |n| "bob#{n}#{r_str}" }
  u.sequence(:email) { |n| "bob#{n}#{r_str}@pivotallabs.com" }
  u.password "bluepin7"
  u.password_confirmation { |u| u.password }
  u.serialized_private_key  OpenSSL::PKey::RSA.generate(1024).export
  u.after_build do |user|
    user.person = Factory.build(:person, :profile => Factory.build(:profile),
                                :owner_id => user.id,
                                :serialized_public_key => user.encryption_key.public_key.export,
                                :diaspora_handle => "#{user.username}@#{AppConfig[:pod_url].gsub(/(https?:|www\.)\/\//, '').chop!}")
  end
  u.after_create do |user|
    user.person.save
    user.person.profile.save
  end
end
