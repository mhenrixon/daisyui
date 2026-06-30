# frozen_string_literal: true

class ComponentsController < ApplicationController
  def show
    component = ComponentDoc.from_slug(params[:component])
    return head :not_found unless component&.example_class

    render_page Views::Components::Show.new(component: component)
  end
end
