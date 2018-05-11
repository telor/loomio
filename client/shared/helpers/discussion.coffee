_ = require 'lodash'
ThreadQueryService = require 'shared/services/thread_query_service'

module.exports =
  dashboardViews: (muted) ->
    filter = if muted then 'show_muted' else 'hide_muted'
    proposals: ThreadQueryService.queryFor
      name:    viewName("proposals", filter)
      filters: filters(['show_proposals', filter])
    today:     ThreadQueryService.queryFor
      name:    viewName("today", filter)
      from:    '1 second ago'
      to:      '-10 year ago' # into the future!
      filters: filters(['hide_proposals', filter])
    yesterday: ThreadQueryService.queryFor
      name:    viewName("yesterday", filter)
      from:    '1 day ago'
      to:      '1 second ago'
      filters: filters(['hide_proposals', filter])
    thisweek: ThreadQueryService.queryFor
      name:    viewName("thisWeek", filter)
      from:    '1 week ago'
      to:      '1 day ago'
      filters: filters(['hide_proposals', filter])
    thismonth: ThreadQueryService.queryFor
      name:    viewName("thisMonth", filter)
      from:    '1 month ago'
      to:      '1 week ago'
      filters: filters(['hide_proposals', filter])
    older: ThreadQueryService.queryFor
      name:    viewName("older", filter)
      from:    '3 month ago'
      to:      '1 month ago'
      filters: filters(['hide_proposals', filter])

viewName = (name, filter) ->
  if filter == 'show_muted'
    "dashboard#{_.capitalize(name)}Muted"
  else
    "dashboard#{_.capitalize(name)}"

filters = (filters) ->
  ['only_threads_in_my_groups', 'show_opened'].concat(filters)
