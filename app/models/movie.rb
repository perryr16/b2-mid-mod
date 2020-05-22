class Movie <ApplicationRecord
  validates_presence_of :name
  has_many :movie_actors
  has_many :actors, through: :movie_actors

end
