class Movie <ApplicationRecord
  validates_presence_of :title
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_by_age
    actors.order(:age)
  end

  def avg_actor_age
    actors.average(:age)
  end

end
