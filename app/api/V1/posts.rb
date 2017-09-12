module API
    module V1
        class Posts < Grape::API
            version 'v1'
            format :json

            resource :posts do
                desc "Return list of all posts"
                get do
                    posts = Post.all
                    present :posts, posts
                end

                desc "Get a post"
                params do
                    requires :id, type: Integer, desc: 'Post id'
                end
                get ':id' do
                    post = Post.find(params[:id])
                    present :post, post
                end

                desc "Create a post"
                params do
                    requires :title, type: String, desc: 'Post title'
                    requires :body, type: String, desc: 'Post body'
                end 
                post do
                    post = Post.new(title: params[:title], body: params[:body])
                    if post.save
                        status :created # 201
                        present :post, post
                    else
                        status :bad_request # 400
                        present :errors, post.errors
                    end
                end
            end
        end
    end
end
