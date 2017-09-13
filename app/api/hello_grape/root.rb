module HelloGrape
    class Root < Grape::API
        prefix 'api'
        mount HelloGrape::V1::Root
    end
end
