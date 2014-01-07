'use strict'

angular.module('readableTime', [])
  .filter 'readableTime', ->
    (seconds) ->
      seconds = parseInt seconds, 10

      minute = 60
      hour = minute * 60
      day = hour * 24
      week = day * 7
      year = day * 365
      month = year / 12

      format = (number, string) ->
        # Pluralize the string if necessary
        string = if number == 1 then string else "#{string}s"

        "#{number} #{string}"

      switch
        when seconds < minute then format(seconds, 'second')
        when seconds < hour then format(Math.floor(seconds / minute), 'minute')
        when seconds < day then format(Math.floor(seconds / hour), 'hour')
        when seconds < week then format(Math.floor(seconds / day), 'day')
        when seconds < month then format(Math.floor(seconds / week), 'week')
        when seconds < year then format(Math.floor(seconds / month), 'month')
        else format(Math.floor(seconds / year), 'year')
