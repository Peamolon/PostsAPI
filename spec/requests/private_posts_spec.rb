require "rails_helper" 
RSpec.describe "Posts with authentication", type: :request do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let!(:other_user_post) { create(:post, user: other_user, published: true) }
    let!(:other_user_post_unpublished) { create(:post, user: other_user, published: false) }
    let!(:auth_headers) { {'Authorization' => "Bearer #{user.auth_token}" } }
    let!(:other_auth_headers) { {'Authorization' => "Bearer #{other_user.auth_token}" } }

    describe "GET /posts/{id}" do    
        context "with valid auth" do
            context "when requisting other user's post" do
                #When the post is published true
               context "when post is public" do
                    before { get "/posts/#{other_user_post.id}", headers: auth_headers }
                    #payload
                    context "payload" do
                        subject { JSON.parse(response.body) }
                        it { is_expected.to include(:id)}
                    end
                    #response 
                    context "response" do
                        subject { response }
                        it { is_expected.to have_http_status(:ok) }
                    end    
               end
                #When the post is published false
               context "when post is draft" do
                before { get "/posts/#{other_user_post_unpublished.id}", headers: auth_headers }
                    #payload
                    context "payload" do
                        subject { JSON.parse(response.body) }
                        it { is_expected.to include(:error)}
                    end
                    #response 
                    context "response" do
                        subject { response }
                        it { is_expected.to have_http_status(:not_found) }
                    end    
               end
            end

            context "when requisting user's post" do
                

            end
        end
    end

    describe "POST /posts" do
    end

    describe "PUT /posts" do
    end

end