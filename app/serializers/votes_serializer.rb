class VotesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :stats, :vote_count, :percent_complete
end
