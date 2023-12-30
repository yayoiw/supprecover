module ApplicationHelper
  def tweet_truncate
    if @tweet_template.length > 140
      truncated_text = tweet_template[0..137] + '...'
      @result_for_tweet = truncated_text
    else
      @result_for_tweet = @tweet_template
    end
  end
end
