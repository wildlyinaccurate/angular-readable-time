'use strict'

describe 'Filter: readableTime', ->
  readableTime = null

  # Ensure the module is loaded
  beforeEach module 'readableTime'

  beforeEach inject (_$filter_) ->
    readableTime = _$filter_ 'readableTime'

  it 'Formats times correctly', ->
    expect(readableTime '1').toEqual '1 second'
    expect(readableTime '2').toEqual '2 seconds'
    expect(readableTime '59').toEqual '59 seconds'
    expect(readableTime '60').toEqual '1 minute'
    expect(readableTime '119').toEqual '1 minute'
    expect(readableTime '120').toEqual '2 minutes'
    expect(readableTime '3599').toEqual '59 minutes'
    expect(readableTime '3600').toEqual '1 hour'
    expect(readableTime '7199').toEqual '1 hour'
    expect(readableTime '7200').toEqual '2 hours'
    expect(readableTime '86399').toEqual '23 hours'
    expect(readableTime '86400').toEqual '1 day'
    expect(readableTime '172799').toEqual '1 day'
    expect(readableTime '172800').toEqual '2 days'
    expect(readableTime '604799').toEqual '6 days'
    expect(readableTime '604800').toEqual '1 week'
    expect(readableTime '1209599').toEqual '1 week'
    expect(readableTime '1209600').toEqual '2 weeks'
    expect(readableTime '2627999').toEqual '4 weeks'
    expect(readableTime '2628000').toEqual '1 month'
    expect(readableTime '5255999').toEqual '1 month'
    expect(readableTime '5256000').toEqual '2 months'
    expect(readableTime '31535999').toEqual '11 months'
    expect(readableTime '31536000').toEqual '1 year'
    expect(readableTime '63071999').toEqual '1 year'
    expect(readableTime '63072000').toEqual '2 years'
    expect(readableTime 3.15569e9).toEqual '100 years'
