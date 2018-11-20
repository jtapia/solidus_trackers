module SolidusTrackers
  class Configuration < Spree::Preferences::Configuration
    preference :types, :string, default: ['Google Analytics',
                                          'Google Manager',
                                          'Facebook Pixel']

    preference :fb_url_mapping, :hash, default: { 'Lead' => '/signup',
                                                  'Search' => '/products',
                                                  'AddToCart' => '/products',
                                                  'CompleteRegistration' => '/',
                                                  'AddToWishlist' => '/products',
                                                  'AddPaymentInfo' => '/checkout/payment',
                                                  'InitiateCheckout' => '/checkout/address' }
  end
end
