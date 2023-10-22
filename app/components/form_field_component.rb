# frozen_string_literal: true

class FormFieldComponent < ApplicationComponent
  renders_one :label, lambda {
    @form.label(@name)
  }
  renders_one :field, lambda { |method_name, *args, **kwargs, &block|
    kwargs[:class] = [kwargs[:class], 'input input-bordered'].compact.join(' ')
    @form.public_send(method_name, @name, *args, **kwargs, &block)
  }

  erb_template <<-ERB
    <div class="form-control">
      <%= label %>
      <%= field %>
    </div>
  ERB

  def initialize(form:, name:)
    @form = form
    @name = name

    super
  end

  %i[text_field password_field].each do |method_name|
    define_method("with_#{method_name}") do |*args, **kwargs, &block|
      with_field(method_name, *args, **kwargs, &block)
    end
  end
end
