class Suggestion < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :website, :reason

  attr_accessible :name, :website, :reason

  state_machine initial: :open do
    event :accept do
      transition open: :accepted
    end

    event :reject do
      transition open: :rejected
    end
  end
end
