class Actor <ApplicationRecord
  validates_presence_of :name
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def associates
    movies.joins(:actors).where('name !=?', self.name).order("name").distinct.pluck(:name).join(", ")
    # I had trouble with the `order` method.
    # Is there a way to order by the join table name without using a sql injection?
    # it would have been nice to have .order(actor.name)... or something like that
  end

end
