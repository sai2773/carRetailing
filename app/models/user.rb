class User < ActiveRecord::Base
	attr_accessor :password

	validates :email, uniqueness: true, length:{in: 3..50}
	validates :email, presence: true
	validates :password, presence:true, confirmation: true, length: { in: 4..20}

before_save :encrypt_new_password

def self.authenticate(email,password)
	user= find_by_email(email)
	return user if user && user.authenticated_password(password)
end

def authenticated_password(password)
self.hashed_password == encrypt(password)
end	


protected
def encrypt_new_password
return if password.blank?
self.hashed_password= encrypt(password)
end	

def encrypt(string)
	Digest::SHA1.hexdigest(string)
end

end