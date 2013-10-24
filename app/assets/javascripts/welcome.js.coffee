# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class FadeIn
  ready: () ->
    setTimeout () =>
      @animate '.first', () =>
        @animate '.second', () =>
          @animate '.third', () =>
    ,500

  animate: (selector, callback) ->
    $(selector).each () ->
      attrs = {}
      easing = "linear"
      klasses = $(@).attr('class').split(/\s+/)
      for i, klass of klasses
        switch klass
          when 'fadein'
            attrs['opacity'] = 1
          when 'slidein'
            attrs['margin-left'] = 0
          when 'easeOut'
            easing = 'easeOutCubic'
      $(@).animate(attrs, 500, easing, callback)

class Router
  @instance: () ->
    @router ||= new Router()
    @router

  dispatch: () ->
    (new FadeIn).ready()
    switch window.location.pathname
      when '/'
        console.log('welcome')
      when '/blog'
        if typeof FB != 'undefined'
          FB.XFBML.parse()
          console.log('blog')


onload = () ->
  Router.instance().dispatch()

$(document).on "page:load", () ->
  onload()

$(document).on "page:before-change", () ->
  $('.first').stop()
  $('.second').stop()
  $('.third').stop()

$(document).ready () ->
  onload()
