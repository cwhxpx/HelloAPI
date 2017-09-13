module HelloGrape
    module V1
        class Root < Grape::API
            #mount HelloGrape::V1::Auth
            mount HelloGrape::V1::Posts
        end
   end
end
