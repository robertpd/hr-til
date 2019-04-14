require 'rails_helper'

describe PostsController do
  describe '#update' do
    let(:not_my_post) { FactoryBot.create :post }

    context 'as a developer' do
      let(:developer) { FactoryBot.create :developer }

      before do
        controller.sign_in developer
      end

      it 'only allows me to update my own posts' do
        expect do
          patch :update, params: { titled_slug: not_my_post.to_param, post: { title: 'HAXORD' } }
        end.to_not change { not_my_post.reload.title }
      end

      it 'lists only my own drafts' do
        FactoryBot.create_list :post, 3, :draft, developer: developer
        FactoryBot.create_list :post, 3, developer: developer
        FactoryBot.create_list :post, 3, :draft
        get :drafts

        expect(assigns(:posts).length).to eq(3)
      end
    end

    context 'as an admin' do
      let(:admin) { FactoryBot.create :developer, admin: true }

      before do
        controller.sign_in admin
      end

      it 'allows me to update anyones post' do
        expect do
          patch :update, params: { titled_slug: not_my_post.to_param, post: { title: 'this is ok' } }
        end.to change { not_my_post.reload.title }
      end
    end
  end

  describe '#show' do
    it 'is a 404 when the post is not there' do
      expect do
        get :show, params: { titled_slug: 'asdf' }
      end.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe '#index' do
    it 'returns a list of published posts' do
      FactoryBot.create_list(:post, 3)
      FactoryBot.create(:post, :draft)

      get :index
      expect(assigns(:posts).map(&:published?).uniq == [true]).to eq(true)
    end
  end

  describe '#drafts' do
    before do
      controller.sign_in developer
    end

    context 'when I am a non-admin developer' do
      let(:developer) { FactoryBot.create :developer }

      it 'lists only my own drafts' do
        FactoryBot.create_list :post, 3, :draft, developer: developer
        FactoryBot.create_list :post, 3, developer: developer
        FactoryBot.create_list :post, 3, :draft
        get :drafts

        expect(assigns(:posts).length).to eq(3)
      end
    end

    context 'when I am an admin developer' do
      let(:developer) { FactoryBot.create :developer, admin: true }

      it 'lists all drafts' do
        FactoryBot.create_list :post, 3, :draft, developer: developer
        FactoryBot.create_list :post, 3, :draft
        get :drafts

        expect(assigns(:posts).length).to eq(6)
      end
    end
  end
end
