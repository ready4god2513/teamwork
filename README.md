# Teamwork Gem

Teamwork is project management software for teams.  This gem attempts to get as close to 100% coverage for the API as possible,
with a few notable holes being uploading files and managing companies.  I would welcome any pull-request that add these capabilities.

## Usage

To get started add `gem "teamworkpm"` to your `Gemfile` (if using Bundler) or run `gem install teamworkpm`.

In order to use the `teamworkpm` gem you will need to have an active teamwork account with full API access.  You can read the docs
on getting your API key [here](http://developer.teamwork.com/enabletheapiandgetyourkey).

### Authentication

Authentication to the API is done through the class method `authenticate`.  `Teamwork.authenticate(api_key)` will log you in.  Failed authentication will return a `401`, else the account for the authenticated user.

### Capabilites

#### Account

    ```Teamwork.account_info```


    ```Teamwwork.authenticate(api_key)```

#### Activity

    Teamwork.recent_activity(options) # Defaults to returning 60 items

#### Comment

    Teamwork.get_comments(resource, id, options = {})


    Teamwork.get_comment(id)

    
    Teamwork.post_comment(resource, id, options)


    Teamwork.update_comment(id, options)


    Teamwork.delete_comment(id)