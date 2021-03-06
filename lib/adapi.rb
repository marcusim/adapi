# encoding: utf-8

require 'rubygems'
require 'adwords_api'
# require 'logger'
require 'yaml'
require 'pp'

require 'active_model'
# TODO require only ActiveSupport parts that we actually use
require 'active_support/all'

require 'adapi/version'
require 'adapi/config'
require 'adapi/api'
require 'adapi/campaign'
require 'adapi/campaign_criterion'
require 'adapi/campaign_target'
require 'adapi/ad_group'
require 'adapi/ad_group_criterion'
require 'adapi/keyword'
require 'adapi/ad'
require 'adapi/ad/text_ad'
require 'adapi/ad_param'
require 'adapi/constant_data'
require 'adapi/constant_data/language'
require 'adapi/constant_data/country'
require 'adapi/location'

# monkeypatch HTTPI - important, check the file!
require 'httpi_request_monkeypatch'

# I can haz hack?! This hotfixes OAuth
# will be removed when new version of ads-common is released
require 'ads_common_monkeypatch'

HTTPI.adapter = :curb
HTTPI.log = false # supress HTTPI output

module Adapi
  API_VERSION = :v201109  
end

if RUBY_VERSION < '1.9'
  puts "WARNING: please use ruby 1.9, adapi gem won't work properly in 1.8 and earlier versions"
end