class Actor <ApplicationRecord
  validates_presence_of :name
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def associates

    # movies.joins(:actors).where('name !=?', self.name).distinct.pluck(:name)
    movies.joins(:actors).where('name !=?', self.name).order("name").distinct.pluck(:name).join(", ")

  end

end
