Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "wwFliQ4RB7SdqwT3Fs7ykgF95", "gzyjU9I1rovWc2HiCQjgMJy4vLBGvlfs6rIopjhStKYfgeo7dm",
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'en'
      }
    }
end