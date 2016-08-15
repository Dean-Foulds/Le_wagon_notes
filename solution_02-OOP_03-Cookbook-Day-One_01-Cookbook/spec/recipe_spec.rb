begin
  require 'recipe_factory'
rescue
end

describe Recipe do
  let(:recipe) { RecipeFactory.build("", "") }

  describe '#name' do
    it 'should return the name of recipe' do
      expect(recipe).to respond_to :name
    end
  end

  describe '#description' do
    it 'should return the description of recipe' do
      expect(recipe).to respond_to :description
    end
  end

  describe '#initialize' do
    it 'should create a recipe with a list of attributes' do
      recipe = RecipeFactory.build('Brownie', 'Delicious chocolate cake')
      expect(recipe.name).to eq 'Brownie'
      expect(recipe.description).to eq 'Delicious chocolate cake'
    end
  end
end
