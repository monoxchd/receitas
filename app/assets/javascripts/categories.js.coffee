# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class window.Sampler
  constructor: ->
    @starter()

  starter: =>
    selectors = $('.recipe_sampler_name')
    $('.recipe_sampler_most_viewed').hide()
    $('.recipe_sampler_image_display').hide()
    $('#most_recent_image_1').show()
    selectors.mouseover (e) =>
      selectorId = $(e.currentTarget).children().attr('id')
      @imageSwitcher(selectorId)
    $('a.most_recent_link').click =>
      @click('recipe_sampler_most_recent')
    $('a.most_viewed_link').click =>
      @click('recipe_sampler_most_viewed')
    $('a.most_voted_link').click =>
      @click('recipe_sampler_most_voted')

  imageSwitcher: (element) ->
    switch element
      when 'most_recent_1' then @change('most_recent_image_1')
      when 'most_recent_2' then @change('most_recent_image_2')
      when 'most_recent_3' then @change('most_recent_image_3')
      when 'most_viewed_1' then @change('most_viewed_image_1')
      when 'most_viewed_2' then @change('most_viewed_image_2')
      when 'most_viewed_3' then @change('most_viewed_image_3')

  change: (element) ->
    $('.recipe_sampler_image_display').hide()
    $("##{element}").show()

  click: (element) =>
    console.log element
    $('.recipe_sampler').hide()
    $(".#{element}").show()
    false