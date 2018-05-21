class Content < ActiveRecord::Base

  validates :title, :body, :uuid, presence: true

  before_validation :set_uuid, on: :create

  def self.random
    order('RANDOM()').first
  end

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
