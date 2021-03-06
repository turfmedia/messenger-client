module Messenger
  # A class representing a connection to ComcenterApi. It holds the username and password.
  class Client

    include ApiAccessor
    use_resources Resources::Base::RESOURCES_LIST

    # Api key needed for authorized requests.
    # @return [String]
    attr_reader :api_key

    # URL prefix for calling API methods.
    # @return [String]
    attr_reader :url_prefix

    # A new API client.
    # @param [Hash] options API key, API url prefix.
    def initialize(api_key:, url_prefix:)
      @api_key = api_key
      @url_prefix = url_prefix
    end

    ## Subscriptions actions

    # List of site subscriptions
    def all_subscriptions(&block)
      subscriptions.list(&block)
    end

    # Subscribe person to site
    def subscribe(options, &block)
      subscriptions.create(options, &block)
    end

    # Unsubscribe subscriber
    def unsubscribe(options, &block)
      subscriptions.destroy(options, &block)
    end

    # Tag subscriber
    # DEPRECATED
    def tag_subscription(options, &block)
      subscriptions.tag(options, &block)
    end

    # Tag subscriber
    def tag(email, tags)
      subscriptions.tag(email: email, tags: tags)
    end

    # Untag subscriber
    # DEPRECATED
    def untag_subscription(options, &block)
      subscriptions.untag(options, &block)
    end

    # Untag subscriber
    def untag(email, tags)
      subscriptions.untag(email: email, tags: tags)
    end

    # Add external event to subscriber
    # DEPRECATED
    def event_subscription(options, &block)
      subscriptions.event(options, &block)
    end

    # Add external event to subscriber
    def add_event(email, event, payload = {})
      subscriptions.event(email: email, event: event, payload: payload)
    end

    # Update subscription email
    def update_subscription_email(options, &block)
      subscriptions.update_email(options, &block)
    end

    ## Sites actions

    # returns all available sites
    def all_sites(&block)
      sites.list(&block)
    end

    ## Recurring actions ####

    # returns all available recurrings
    def all_recurrings(&block)
      recurrings.list(&block)
    end

    # send recurring message
    def send_recurring_message(options, &block)
      recurrings.send_message(options, &block)
    end
  end

end
