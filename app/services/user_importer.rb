require "csv"

class UserImporter
  attr_accessor :errors
  def initialize(file_path)
    @file_path = file_path
    @errors = []
  end

  def call
    csv_table = CSV.table(@file_path, col_sep: ";")
    ActiveRecord::Base.transaction do
      csv_table.each do |row|
        user = User.new(id: row.fetch(:id))
        user.full_name =  row.fetch(:full_name)
        user.sub_seats = row.fetch(:subscription_seats) || 0        
        @errors << user unless user.save

        address = user.addresses.new
        address.address1 = row.fetch(:address1)
        address.address2 = row.fetch(:address2)
        address.postal_code = row.fetch(:postal_code)
        address.city = row.fetch(:city)
        address.country = row.fetch(:country)
        @errors << address unless address.save!
        
        
      end
      raise(ActiveRecord::Rollback) unless @errors.empty?
    end
  end 
    
end

