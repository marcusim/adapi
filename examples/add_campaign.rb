
require 'adapi'

# create campaign by single command, with campaing targets, with ad_groups
# including keywords and ads

campaign_data = {
  :name => "Campaign #%d" % (Time.new.to_f * 1000).to_i,
  :status => 'PAUSED',
  # TODO
  :bidding_strategy => { :xsi_type => 'ManualCPC' },

  :budget => { :amount => 50, :delivery_method => 'STANDARD' },

  :network_setting => {
    :target_google_search => true,
    :target_search_network => true,
    :target_content_network => false,
    :target_content_contextual => false
  },

  :targets => {
    :language => [ 'en', 'cs' ],
    # TODO test together with city target
    :geo => { :proximity => { :geo_point => '38.89859,-77.035971', :radius => '10 km' } }
  },

  :ad_groups => [
    {
      :name => "AdGroup #%d" % (Time.new.to_f * 1000).to_i,
      :status => 'ENABLED',
      # TODO 
      :bids => {
        :xsi_type => 'ManualCPCAdGroupBids',
        :keyword_max_cpc => {
          :amount => {
            :micro_amount => 10000000
          }
        }
      },

      # TODO to shortened format
      # :keywords => [ 'dem codez', '"top coder"', "[-code]" ]
      :keywords => [
        { :text => 'dem codez', :match_type => 'BROAD' },
        { :text => 'top coder', :match_type => 'PHRASE' ),
        { :text => 'code', :match_type => 'EXACT', :negative => true }
      ],

      :ads => [
        {
          :headline => "Code like Neo",
          :description1 => 'Need mad coding skills?',
          :description2 => 'Check out my new blog!',
          :url => 'http://www.demcodez.com',
          :display_url => 'http://www.demcodez.com'
        }
      ]
    }
  ]

}
 
$campaign = Adapi::Campaign.create(campaign_data)

p $campaign 