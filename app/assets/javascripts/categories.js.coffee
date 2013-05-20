# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class window.Sampler
  constructor: ->
    $('#carousel').infiniteCarousel({
      displayProgressRing: false
      showControls: false
      autoPilot: true
      thumbnailType: 'images'
      internalThumbnails: true
      })