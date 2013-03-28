class User < ActiveRecord::Base

  attr_accessible :login, :password, :password_confirmation, :name, :salt
  attr_accessor :password_confirmation

  validates_uniqueness_of :login
  validates_confirmation_of :password

	has_many :project

  before_save :salting_password


  def self.authenticate(_login, _password)
    u = find_by_login(_login)
    u && u.password == Digest::SHA1.hexdigest("#{_password}:#{u.salt}") ? u: nil
  end

  protected
    def salting_password
      return unless self.changes.include?('password')
      self.salt = Digest::MD5.hexdigest(Time.now.to_f.to_s)
      self.password = Digest::SHA1.hexdigest("#{self.password}:#{self.salt}")
    end

end
