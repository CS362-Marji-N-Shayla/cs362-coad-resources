# MS - extends ActiveRecordclass and is an abstract base class for Region, Organization, ResourceCategory, Ticket, and User
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
