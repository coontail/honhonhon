module PagesHelper
  def author_and_date
    "By Coontail, #{full_date}"
  end

  def full_date
    Time.now.strftime("%B %Y")
  end
end
