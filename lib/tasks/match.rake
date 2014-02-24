namespace :match do
  desc 'Reset user quotes to 1200 and calculate quotes'
  task :recalculate => :environment do

    User.update_all(quote: 1200, number_of_wins: 0, number_of_looses: 0)
    Team.update_all(number_of_wins: 0, number_of_looses: 0)
    Match.unscoped.order("date ASC").each do |match|
      p match.date
      match.calculate_user_quotes
      p match.difference
    end
  end
end