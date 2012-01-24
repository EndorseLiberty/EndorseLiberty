AdminUser.create :first_name => "Jonathan", :last_name => "Geggatt", :password => "bajohngo", :password_confirmation => "bajohngo", :email => "jgeggatt@gmail.com", :role => 100

# Create a default landing path for each traffic group
[:organic, :affiliate, :viral].each do |traffic_group|
  experiment = Experiment.create({
    :conversion_event => "register",
    :traffic_group => traffic_group,
    :name => "default_#{traffic_group}_v1",
    :delivery_url => "https://www.paypal.com/cgi-bin/webscr"
  })
  PathFlow.create :experiment => experiment, :flow => [:video, :register, :share, :extra_user_info, :request_donation]
  PathPage.create :page_type => :video, :name => "default_video_v1", :experiment => experiment, :layout => "rp_layout"
  PathPage.create :page_type => :register, :name => "default_reg_v1", :experiment => experiment, :layout => "rp_layout"
  PathPage.create :page_type => :share, :name => "default_share_v1", :experiment => experiment, :layout => "rp_layout"
  PathPage.create :page_type => :extra_user_info, :name => "default_phone_v1", :experiment => experiment, :layout => "rp_layout"
  PathPage.create :page_type => :request_donation, :name => "default_donation_v1", :experiment => experiment, :layout => "rp_layout"
  experiment.generate_variant_combinations
end

# Default Invite pieces
InviteTemplate.create :name => "default_invite_v1"
InviteSubject.create :name => "default_subject_v1", :subject => "An invitation from *inviter_full_name*..."
InviteFromLine.create :name => "default_from_v1", :from => "*inviter_full_name* <*inviter_email*>"

# Default Invite Reminder pieces
InviteTemplate.create :name => "reminder_invite_v1", :reminder => true
InviteSubject.create :name => "reminder_subject_v1", :subject => "An invitation from *inviter_full_name*...", :reminder => true
InviteFromLine.create :name => "reminder_from_v1", :from => "*inviter_full_name* <*inviter_email*>", :reminder => true

# Default :register email
EmailTemplate.create :name => "default_register_v1", :email_type => :register
EmailSubject.create :name => "default_reg_subj_v1", :email_type => :register, :subject => "Thank you for supporting Ron Paul"
EmailFromLine.create :name => "default_reg_from_v1", :email_type => :register, :from => "Vote for Ron Paul <contact@voteronpaul.com>"
