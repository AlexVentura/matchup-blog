ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address              =>  'smtp.gmail.com',
    :port                 =>  '587',
    :authentication       =>  :plain,
    :user_name            =>  'lex.venturac@gmail.com',
    :password             =>  'covent2015',
    :domain               =>  'lenguajemx.com',
    :enable_starttls_auto  =>  true
}
