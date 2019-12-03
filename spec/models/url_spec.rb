# frozen_string_literal: true

require 'rails_helper'

describe URL do
    subject { described_class.new(url) }
    let(:url) { 'https://www.farmdrop.com' }

    context 'when a URL class is instantiated' do
      it 'stores a url attribute' do
        expect(subject.url).to eq(url)
      end

      it 'stores a shortened url' do
        expect(subject.short_url.length).to eq(4)
      end

      it 'can be found from the class method' do
        subject
        expect(URL.find(subject.short_url)).to eq(subject)
      end
    end
  end