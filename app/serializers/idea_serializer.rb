class IdeaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :pitch, :problem, :solution, :audience, :features, :apis, :oauth, :user_id, :updated_at, :cohort_id, :vote_count
end
