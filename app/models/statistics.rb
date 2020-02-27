class Statistics
  def initialize(user)
    @user = user
  end

  def statistics
    {id: 1, stats: {user_count: cohort_users,
                    vote_count: number_of_votes_cast,
                    percent_complete: percent_vote_complete}}
  end

  def cohort_users
    User.where(cohort_id: @user.cohort_id).count
  end

  def number_of_votes_cast
    Vote.where(cohort_id: @user.cohort_id).count
  end

  def percent_vote_complete
    (number_of_votes_cast / available_number_of_votes)
  end

  def available_number_of_votes
    (cohort_users * 3)
  end


end
