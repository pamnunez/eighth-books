EighthBooks::Application.config.session_store :redis_store,
  servers: [ENV['REDIS_URL']],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.parent_name.downcase}_session",
  threadsafe: false