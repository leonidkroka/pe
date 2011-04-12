class UpdateJob
  include Sidekiq::Job

  def perform(id)
    User.find_by!(id: id).update(available: true)
  end
end
