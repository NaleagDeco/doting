require 'doting/contextualizer'

RSpec.describe Doting::Contextualizer, '#contextualize' do
  it 'should apply a context to the template' do
    VALUE = 'Hello'
    template = '<%= myvar %>'
    context = { myvar: VALUE }

    result = Doting::Contextualizer.contextualize(template, context)
    expect(result).to eq 'Hello'
  end
end
