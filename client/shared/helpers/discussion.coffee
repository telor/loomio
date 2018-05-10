ThreadQueryService = require 'shared/services/thread_query_service'

module.exports = ->
  dashboardViews: ->
    proposals: ThreadQueryService.queryFor
      name:    viewName("proposals")
      filters: filters('show_proposals')
    today:     ThreadQueryService.queryFor
      name:    viewName("today")
      from:    '1 second ago'
      to:      '-10 year ago' # into the future!
      filters: filters('hide_proposals')
    yesterday: ThreadQueryService.queryFor
      name:    viewName("yesterday")
      from:    '1 day ago'
      to:      '1 second ago'
      filters: filters('hide_proposals')
    thisweek: ThreadQueryService.queryFor
      name:    viewName("thisWeek")
      from:    '1 week ago'
      to:      '1 day ago'
      filters: filters('hide_proposals')
    thismonth: ThreadQueryService.queryFor
      name:    viewName("thisMonth")
      from:    '1 month ago'
      to:      '1 week ago'
      filters: filters('hide_proposals')
    older: ThreadQueryService.queryFor
      name:    viewName("older")
      from:    '3 month ago'
      to:      '1 month ago'
      filters: filters('hide_proposals')
