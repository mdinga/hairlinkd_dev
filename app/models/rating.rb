class Rating < ApplicationRecord

  belongs_to :client
  belongs_to :stylist


  #validates_presence_of :Comment
  validate :today_or_before
  validate :date_too_far
  validate :rating_1_missing
  validate :rating_2_missing
  validate :rating_3_missing
  validate :rating_4_missing
  validate :rating_5_missing

  private

  def today_or_before
    if date_of_appointment >= 1.day.from_now
      errors.add(:date_of_appointment, "can't be after today")
    end
  end

  def date_too_far
    if date_of_appointment < 1.month.ago
      errors.add(:date_of_appointment, "can't be a more than a month ago")
    end
  end

  def rating_1_missing
    if rating_1 == 0.0
      errors.add(:base, "First rating incomplete")
    end
  end

  def rating_2_missing
    if rating_2 == 0.0
      errors.add(:base, "Second rating incomplete")
    end
  end

  def rating_3_missing
    if rating_3 == 0.0
      errors.add(:base, "Third rating incomplete")
    end
  end

  def rating_4_missing
    if rating_4 == 0.0
      errors.add(:base, "Fourth rating incomplete")
    end
  end

  def rating_5_missing
    if rating_5 == 0.0
      errors.add(:base, "Fifth rating incomplete")
    end
  end


end
