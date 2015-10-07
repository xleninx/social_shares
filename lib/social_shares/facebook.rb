module SocialShares
  class Facebook < Base
    URL = 'https://graph.facebook.com/fql'

    def shares!
      response = get(URL, {
        :params => {
          :q => "SELECT share_count, like_count, comment_count FROM link_stat WHERE url='#{checked_url}'"
        }
      })
      JSON.parse(response)['data'][0] || 0
    end
  end
end
