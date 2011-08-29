
require 'adapi'

# create ad group
require 'add_bare_ad_group'

keyword_criterion = {
  :xsi_type => 'BiddableAdGroupCriterion',
  :criterion => { :xsi_type => 'Keyword', :text => 'ataxo', :match_type => 'BROAD' }
}

placement_criterion = {
  :xsi_type => 'BiddableAdGroupCriterion',
  :criterion => { :xsi_type => 'Placement', :url => 'http://www.ataxo.cz' }
}

p Adapi::AdGroupCriterion.create(
  :ad_group_id => $ad_group[:id],
  :criteria => [keyword_criterion, placement_criterion]
)
