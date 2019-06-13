class VocabulariesController < ApplicationController
  def index
    @vocabularies=Vocabulary.all
    @levels=Level.all
  end
end
