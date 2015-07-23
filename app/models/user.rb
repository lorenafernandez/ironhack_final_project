class User < ActiveRecord::Base
  
  has_one :artist
  has_one :local

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :current_password

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
    :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/    

  validates :name, :contact_person, :phone_number, :address, presence: true, on: :update
  validates :biography, format: {with: /[a-zA-Zñ]/}, on: :update
  validates :contact_person, format: {with: /[a-zA-Zñ]/}, on: :update

  validates :phone_number, numericality: true, length: 9..9, on: :update
  validate :phone_number_has_correct_format, on: :update

  def get_provinces
    provinces = []
    Provincias.all.each do |province|
      provinces.push([province.name, province.name])
    end
    self.class.const_set(:PROVINCES , provinces)
  end

  private

  def phone_number_has_correct_format
 	  errors.add(:phone_number, "Introduce un número de teléfono correcto") unless (phone_number.start_with?("6") || phone_number.start_with?("9"))
  end


end
