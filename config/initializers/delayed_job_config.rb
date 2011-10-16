# config/initializers/delayed_job_config.rb

# Optional but recommended for less future surprises.
# Fail at startup if method does not exist instead of in background job 
[[ExceptionNotifier::Notifier, :background_exception_notification]].each do |object, method_name|
  raise NoMethodError, "undefined method `#{method_name}' for #{object.inspect}" unless object.respond_to?(method_name, true)
end

# Chain delayed job's handle_failed_job method to do exception notification
Delayed::Worker.class_eval do
  def handle_failed_job_with_notification(job, error)
    handle_failed_job_without_notification(job, error)
    # only actually send mail in production
    ExceptionNotifier::Notifier.background_exception_notification(error).deliver #if Rails.env.production?
  end 
  alias_method_chain :handle_failed_job, :notification 
end

Delayed::Worker.destroy_failed_jobs = false
silence_warnings do
  Delayed::Worker.const_set("MAX_ATTEMPTS", 3)
  Delayed::Worker.const_set("MAX_RUN_TIME", 5.minutes)
end